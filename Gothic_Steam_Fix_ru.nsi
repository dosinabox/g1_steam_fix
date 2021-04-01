Unicode true
SetCompressor lzma
var DirectoryText

!include "MUI.nsh"
!include "FileFunc.nsh"

###################################
##            Макросы            ##
###################################

!macro GMF_File_Rename FILENAME_1 FILENAME_2
	File "${FILENAME_1}"
	IfFileExists "${FILENAME_2}" "" +2
	Delete "${FILENAME_2}"
	Rename "${FILENAME_1}" "${FILENAME_2}"
!macroend

!macro GMF_Delete FILENAME
	IfFileExists "${FILENAME}" "" +2
	Delete "${FILENAME}"
!macroend

###################################
##       Режимы компиляции       ##
###################################

!define SNOWBALL_SYS "snowball"
!define SNOWBALL_DISPLAY "Snowball"
!define RUSSOBIT_SYS "russobit"
!define RUSSOBIT_DISPLAY "Russobit-M"
!define RUSSOBIT_DISPLAY_RU "Руссобит-М"

# Руссобит-М:
!define MOD_LOCALE "${RUSSOBIT_SYS}"
!define MOD_LOCALE_DISPLAY "${RUSSOBIT_DISPLAY}"
!define MOD_LOCALE_DISPLAY_RU "${RUSSOBIT_DISPLAY_RU}"

# Snowball:
#!define MOD_LOCALE "${SNOWBALL_SYS}"
#!define MOD_LOCALE_DISPLAY "${SNOWBALL_DISPLAY}"
#!define MOD_LOCALE_DISPLAY_RU "${SNOWBALL_DISPLAY}"

###################################
##            Основное           ##
###################################

!define MOD_NAME "Gothic Steam Fix"
!define MOD_VERSION "04.2021"
!define MOD_DETAILED_VERSION "21.4.1.0"
!define MOD_AUTHOR "D36"

Name "${MOD_NAME}"
OutFile "Gothic_Steam_Fix_RU_${MOD_LOCALE_DISPLAY}_${MOD_VERSION}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "FileVersion" "${MOD_DETAILED_VERSION}"
VIAddVersionKey "LegalCopyright" "© ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "Установщик ${MOD_NAME}"
VIAddVersionKey "ProductVersion" "${MOD_VERSION}"

###################################
##      Настройки интерфейса     ##
###################################

!define MUI_ICON "icon.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo_${MOD_LOCALE}.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic_${MOD_LOCALE}.bmp"

Caption "${MOD_NAME} (${MOD_LOCALE_DISPLAY_RU})"
!define MUI_TEXT_WELCOME_INFO_TITLE "$\t   $\n$\t${MOD_NAME}"
!define MUI_TEXT_WELCOME_INFO_TEXT "Данный сборник исправлений предназначен для установки на чистую Steam-версию Gothic без других патчей и модов."

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText $DirectoryText

!define MUI_TEXT_COMPONENTS_TITLE "Выбор компонентов для установки"
!define MUI_TEXT_COMPONENTS_SUBTITLE " "
!define MUI_COMPONENTSPAGE_TEXT_TOP "Выберите компоненты ${MOD_NAME}, которые вы хотите установить.$\nНажмите кнопку 'Установить' для продолжения." 
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Компоненты для установки:"
!define MUI_COMPONENTSPAGE_SMALLDESC

!define MUI_TEXT_INSTALLING_TITLE "Копирование файлов и настройка..."
!define MUI_TEXT_INSTALLING_SUBTITLE " "

!define MUI_TEXT_FINISH_INFO_TITLE "$\t   $\n$\tУстановка завершена!"
!define MUI_TEXT_FINISH_INFO_TEXT "Теперь игру можно запустить из Steam. Установка дополнительных обновлений или патчей не требуется и не рекомендуется.$\n$\nПриятной игры!"

BrandingText " "

###################################
##     Страницы  инсталлятора    ##
###################################

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

###################################
##             Языки             ##
###################################

!insertmacro MUI_LANGUAGE "Russian"

###################################
##          Инсталляция          ##
###################################

Section "Основные патчи и обновления" SecMain
	SectionIn RO

	!insertmacro GMF_Delete "$INSTDIR\VDFS.dmp"
	!insertmacro GMF_Delete "$INSTDIR\system\ddraw.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\dinput.dll"
	!insertmacro GMF_Delete "$INSTDIR\Data\textures_bikini.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\textures_apostroph_patch_neu.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\textures_choicebox_32pixel_modialpha.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\Gothic_Mod_Fix_Beta.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\SystemPack.vdf"
	!insertmacro GMF_Delete "$INSTDIR\_work\data\video\logo2.bik"

	CreateDirectory "$INSTDIR\_work\data\textures\_compiled"
	CreateDirectory "$INSTDIR\Saves\Current"

	SetOutPath "$INSTDIR"
	File "Union.url"

	SetOutPath "$INSTDIR\_work\data\video"
	File "logo1.bik"

	SetOutPath "$INSTDIR\Data"
	File "Union.vdf"

	SetOutPath "$INSTDIR\system"
	File "binkw32.dll"
	File "Gothic.exe"
	File "Gothic.ini"
	File "GothicMod.exe"
	File "GothicStarter.exe"
	File "Shw32.dll"
	File "SystemPack.ini"
	File "vdfs32g.dll"
	File "Union.patch"
	File "${MOD_LOCALE}.rtf"
	!insertmacro GMF_File_Rename "GothicGame_${MOD_LOCALE}.ini" "GothicGame.ini"

	SetOutPath "$INSTDIR\system\autorun"
	File "AutoScreenRes.dll"

SectionEnd


Section /o "Расширение доступной памяти" SecAdditional_1

	SetOutPath "$INSTDIR\system"
	!insertmacro GMF_File_Rename "GothicMod_4gb.exe" "GothicMod.exe"

SectionEnd


Section /o "Поддержка геймпада" SecAdditional_2

	SetOutPath "$INSTDIR\Data"
	File "zGamePad.vdf"

SectionEnd


SectionGroup /e "Русификация от ${MOD_LOCALE_DISPLAY_RU}" Group1


Section "Текст и субтитры" SecAdditional_3

	CreateDirectory "$INSTDIR\saves_${MOD_LOCALE}_fix\current"

	SetOutPath "$INSTDIR\Data"
	File "${MOD_LOCALE}_main.vdf"

	SetOutPath "$INSTDIR\Data\ModVDF"
	File "${MOD_LOCALE}_fix.mod"
	File "${MOD_LOCALE}_models.mod"

	SetOutPath "$INSTDIR"
	File "GothicModFix_(${MOD_LOCALE_DISPLAY})_ReadMe.txt"

	SetOutPath "$INSTDIR\_work\data\scripts\_compiled"
	!insertmacro GMF_File_Rename "menu_${MOD_LOCALE}.dat" "MENU.DAT"
	!insertmacro GMF_File_Rename "gothic_${MOD_LOCALE}_original.dat" "GOTHIC.DAT"

	SetOutPath "$INSTDIR\_work\data\scripts\content\cutscene"
	!insertmacro GMF_File_Rename "OU_${MOD_LOCALE}_original.bin" "OU.BIN"

	SetOutPath "$INSTDIR\system"
	File "${MOD_LOCALE}_fix.ini"
	File "${MOD_LOCALE}_fix.rtf"

SectionEnd


Section "Озвучка и видео" SecAdditional_4
	
	!insertmacro GMF_Delete "$INSTDIR\Data\speech_babe_speech_engl.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\speech_patch2.vdf"

	SetOutPath "$INSTDIR\Data"
	!insertmacro GMF_File_Rename "${MOD_LOCALE}_speech.vdf" "speech.vdf"

	SetOutPath "$INSTDIR\Data\ModVDF"
	File "${MOD_LOCALE}_fix_speech.mod"

	SetOutPath "$INSTDIR\_work\data\video"
	!insertmacro GMF_File_Rename "greatPrayer_${MOD_LOCALE}.bik" "greatPrayer.bik"
	!insertmacro GMF_File_Rename "intro_${MOD_LOCALE}.bik" "intro.bik"
	!insertmacro GMF_File_Rename "playerout_${MOD_LOCALE}.bik" "playerout.bik"

SectionEnd

SectionGroupEnd


###################################
##     Описание компонентов      ##
###################################

LangString DESC_SecMain ${LANG_RUSSIAN} "Основные компоненты сборника (Union 1.0j, SystemPack 1.9, Player Kit, патч 1.08k)."
LangString DESC_Group1 ${LANG_RUSSIAN} "Выбор компонентов русификации игры."
LangString DESC_SecAdditional_1 ${LANG_RUSSIAN} "Использование 4 ГБ оперативной памяти вместо 2 ГБ. Только для 64-битных систем!"
LangString DESC_SecAdditional_2 ${LANG_RUSSIAN} "Выберите эту опцию, если хотите играть на геймпаде."
LangString DESC_SecAdditional_3 ${LANG_RUSSIAN} "Выберите эту опцию, если хотите установить русский текст и субтитры от ${MOD_LOCALE_DISPLAY_RU}."
LangString DESC_SecAdditional_4 ${LANG_RUSSIAN} "Выберите эту опцию, если хотите установить русскую озвучку и видео от ${MOD_LOCALE_DISPLAY_RU}."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecMain} $(DESC_SecMain)
!insertmacro MUI_DESCRIPTION_TEXT ${Group1} $(DESC_Group1)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_1} $(DESC_SecAdditional_1)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_2} $(DESC_SecAdditional_2)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_3} $(DESC_SecAdditional_3)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_4} $(DESC_SecAdditional_4)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

###################################
##            Функции            ##
###################################

Function .onInit
	SetSilent normal
	StrCpy $DirectoryText "Обнаружена установленная Steam-версия Gothic. Нажмите кнопку 'Далее' для продолжения или 'Обзор ...' для выбора другой папки."
	SetRegView 32
	ReadRegStr $INSTDIR HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 65540" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	SetRegView 64
	ReadRegStr $INSTDIR HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 65540" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	InstallPathIsFound:
	IfFileExists "$INSTDIR\system\Gothic.exe" InstallPathIsGood
	StrCpy $INSTDIR "$PROGRAMFILES\Steam\steamapps\common\Gothic"
	StrCpy $DirectoryText "Нажмите кнопку 'Обзор ...' и укажите папку, в которой установлена Gothic. Как правило, это Steam\steamapps\common\Gothic.$\n$\nЗатем нажмите кнопку 'Далее' для продолжения."
	InstallPathIsGood:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\Gothic.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd
