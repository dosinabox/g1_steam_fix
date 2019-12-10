###################################
##      Подключенные хидеры      ##
###################################

Unicode true

!include "MUI.nsh"
!include "FileFunc.nsh"
!include "GothicFixesCommon.nsh"

###################################
##            Основное           ##
###################################

!define MOD_NAME "Gothic Steam Fix"
!define MOD_VERSION "11.2019"
!define MOD_DETAILED_VERSION "19.11.1.0"
!define MOD_AUTHOR "D36"

Name "${MOD_NAME}"
OutFile "Gothic_Steam_Fix_(Russobit-M)_${MOD_VERSION}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "FileVersion" "${MOD_DETAILED_VERSION}"
VIAddVersionKey "LegalCopyright" "© ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "Установщик ${MOD_NAME}"
VIAddVersionKey "ProductVersion" "${MOD_VERSION}"

###################################
##      Настройки интерфейса     ##
###################################

!define MUI_ICON "Gothic_Steam_Fix.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo_russobit.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic_russobit.bmp"

Caption "${MOD_NAME} (Руссобит-М)"
!define MUI_TEXT_WELCOME_INFO_TITLE "$\t   $\n$\t${MOD_NAME}"
!define MUI_TEXT_WELCOME_INFO_TEXT "Данный сборник исправлений предназначен для установки на чистую Steam-версию Gothic без других патчей и модов."

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText $DirectoryText

!define MUI_TEXT_COMPONENTS_TITLE "Выбор компонентов для установки"
!define MUI_TEXT_COMPONENTS_SUBTITLE " "
!define MUI_COMPONENTSPAGE_TEXT_TOP "Выберите компоненты ${MOD_NAME}, которые вы хотите установить.$\nНажмите кнопку \
'Установить' для продолжения." 
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "Компоненты для установки:"
!define MUI_COMPONENTSPAGE_SMALLDESC

!define MUI_TEXT_INSTALLING_TITLE "Копирование файлов и настройка..."
!define MUI_TEXT_INSTALLING_SUBTITLE " "

!define MUI_TEXT_FINISH_INFO_TITLE "$\t   $\n$\tУстановка завершена!"
!define MUI_TEXT_FINISH_INFO_TEXT "Теперь игру можно запустить из Steam. Установка дополнительных обновлений или патчей не требуется и не рекомендуется.\
$\n$\nПриятной игры!"

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

	IfFileExists "$INSTDIR\system\snowball.rtf" file_found file_not_found
	file_found:
	MessageBox MB_OK "В выбранной папке уже установлен Gothic Steam Fix (Snowball) или его компоненты. Для продолжения:$\n$\n- удалите игру через Steam;$\n- удалите папку игры (steam/steamapps/common/gothic);$\n- скачайте игру через Steam заново;$\n- установите данный сборник;$\n- начните новую игру (сохранения Snowball не поддерживаются в версии игры от Руссобит-М).$\n$\nУстановка прервана."
	quit
	goto end_of_test
	file_not_found:
	end_of_test:

	!insertmacro GMF_Delete "$INSTDIR\VDFS.dmp"
	!insertmacro GMF_Delete "$INSTDIR\delsaves.exe"
	!insertmacro GMF_Delete "$INSTDIR\Gothic.url"
	!insertmacro GMF_Delete "$INSTDIR\install.log"
	!insertmacro GMF_Delete "$INSTDIR\JoWooD.url"
	!insertmacro GMF_Delete "$INSTDIR\Readme.htm"
	!insertmacro GMF_Delete "$INSTDIR\Readme.txt"
	!insertmacro GMF_Delete "$INSTDIR\UNWISE.exe"
	!insertmacro GMF_Delete "$INSTDIR\UNWISE.ini"
	!insertmacro GMF_Delete "$INSTDIR\Data\textures_bikini.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\textures_apostroph_patch_neu.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\textures_choicebox_32pixel_modialpha.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\Gothic_Mod_Fix_Beta.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\OrcTempelPatch.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\sndpatch.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\Breitbild_Patch.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\MENU_AutoScale_G1.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\FONT_High_Resolution.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\FONT_High_Resolution_1.1.0.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\FONT_High_Resolution_2.0.2.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\FONT_High_Resolution_2.0.3.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\FONT_High_Resolution_2.1.0.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\FONT_High_Resolution_2.2.0.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\FONT_High_Resolution_2.2.1.vdf"
	!insertmacro GMF_Delete "$INSTDIR\system\dmband.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\dmcompos.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\dmime.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\dmloader.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\dmstyle.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\dmsynth.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\dmusic.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\gothic.rpt"
	!insertmacro GMF_Delete "$INSTDIR\system\KillHelp.exe"
	!insertmacro GMF_Delete "$INSTDIR\system\MssDS3D.m3d.exe"
	!insertmacro GMF_Delete "$INSTDIR\system\D3dim700.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\D3DImm.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\DMusic.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\GEngine.exe"
	!insertmacro GMF_Delete "$INSTDIR\system\GEngine.ini"
	!insertmacro GMF_Delete "$INSTDIR\system\GEngineStarter.exe"
	!insertmacro GMF_Delete "$INSTDIR\system\GEngineStarter_mod.exe"
	!insertmacro GMF_Delete "$INSTDIR\system\AntTweakBar.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\Assimp32.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\d3dcompiler_47.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\ddraw.dll"
	!insertmacro GMF_Delete "$INSTDIR\system\GFSDK_SSAO.win32.dll"

	CreateDirectory "$INSTDIR\_work\data\textures\_compiled"
	CreateDirectory "$INSTDIR\Saves\Current"

	SetOutPath "$INSTDIR"
	File "VDFS.cfg"
	File "SystemPack - Форум.url"

	SetOutPath "$INSTDIR\Data"
	File "SystemPack.vdf"

	SetOutPath "$INSTDIR\Miles"
	File "MssA3D.m3d"
	File "MssA3D2.m3d"
	File "MssDolby.m3d"
	File "MssDS3Dh.m3d"
	File "MssDS3Ds.m3d"
	File "MssDX7sh.m3d"
	File "MssDX7sl.m3d"
	File "MssDX7sn.m3d"
	File "MssEAX.m3d"
	File "MssEAX2.m3d"
	File "MssFast.m3d"
	File "MssRSX.m3d"

	SetOutPath "$INSTDIR\system"
	File "AutoPan.flt"
	File "Capture.flt"
	File "Chorus.flt"
	File "Compress.flt"
	File "Flange.flt"
	File "Gothic.exe"
	File "Gothic.ini"
	File "GothicMod.exe"
	File "GothicStarter.exe"
	File "GothicStarter_mod.exe"
	File "HighPass.flt"
	File "LaGInter.flt"
	File "LowPass.flt"
	File "MDelay.flt"
	File "MP3Dec.asi"
	File "Mss32.dll"
	File "MssV12.asi"
	File "MssV24.asi"
	File "MssV29.asi"
	File "ParmEQ.flt"
	File "Reverb1.flt"
	File "Reverb2.flt"
	File "Reverb3.flt"
	File "SDelay.flt"
	File "ShelfEQ.flt"
	File "Shw32.dll"
	File "sp.log"
	File "SystemPack.ini"
	File "vdfs32g.dll"
	File "original.rtf"
	!insertmacro GMF_File_Rename "GothicGame_original.ini" "GothicGame.ini"
	!insertmacro _ReplaceInFile "Gothic.ini" "1280" "$RESX"
	!insertmacro _ReplaceInFile "Gothic.ini" "1024" "$RESY"

SectionEnd


SectionGroup /e "Русификация от Руссобит-М" Group1


Section "Текст и субтитры" SecAdditional_1

	CreateDirectory "$INSTDIR\saves_russobit_fix\current"

	!insertmacro GMF_Delete "$INSTDIR\_work\data\scripts\_compiled\ouinfo.inf"
	!insertmacro GMF_Delete "$INSTDIR\_work\data\scripts\content\cutscene\ou.csl"
	!insertmacro GMF_Delete "$INSTDIR\system\original.rtf"

	SetOutPath "$INSTDIR\Data"
	File "russobit_main.vdf"

	SetOutPath "$INSTDIR\Data\ModVDF"
	File "russobit_fix.mod"
	File "russobit_models.mod"

	SetOutPath "$INSTDIR"
	File "Gothic_RussobitM_Fix_ReadMe.txt"

	SetOutPath "$INSTDIR\_work\data\scripts\_compiled"
	!insertmacro GMF_File_Rename "menu_russobit.dat" "menu.dat"
	!insertmacro GMF_File_Rename "gothic_russobit_original.dat" "gothic.dat"

	SetOutPath "$INSTDIR\_work\data\scripts\content\cutscene"
	!insertmacro GMF_File_Rename "OU_russobit_original.bin" "OU.bin"

	SetOutPath "$INSTDIR\system"
	File "russobit_fix.ini"
	File "russobit_fix.rtf"
	File "russobit.rtf"
	!insertmacro GMF_File_Rename "GothicGame_russobit.ini" "GothicGame.ini"

SectionEnd

Section "Озвучка и видео" SecAdditional_2
	
	!insertmacro GMF_Delete "$INSTDIR\Data\speech_babe_speech_engl.vdf"
	!insertmacro GMF_Delete "$INSTDIR\Data\speech_patch2.vdf"

	SetOutPath "$INSTDIR\Data"
	!insertmacro GMF_File_Rename "russobit_speech.vdf" "speech.vdf"

	SetOutPath "$INSTDIR\Data\ModVDF"
	File "russobit_fix_speech.mod"

	SetOutPath "$INSTDIR\_work\data\video"
	!insertmacro GMF_File_Rename "greatPrayer_russobit.bik" "greatPrayer.bik"
	!insertmacro GMF_File_Rename "intro_russobit.bik" "intro.bik"
	!insertmacro GMF_File_Rename "playerout_russobit.bik" "playerout.bik"

SectionEnd


SectionGroupEnd


Section "Широкоформатный монитор" SecAdditional_3
	
	SetOutPath "$INSTDIR\_work\data\video"
	File "logo1.bik"

	!insertmacro GMF_Delete "$INSTDIR\_work\data\video\logo2.bik"

	IfFileExists "$INSTDIR\Data\russobit_main.vdf" russian_found russian_not_found
	russian_found:
	SetOutPath "$INSTDIR\Data"
	File "russobit_widescreen.vdf"
	goto end_of_test2
	russian_not_found:
	SetOutPath "$INSTDIR\Data"
	File "textures_widescreen.vdf"
	end_of_test2:

SectionEnd


Section /o "Совместимость с ноутбуками" SecAdditional_4

	SetOutPath "$INSTDIR\system"
	!insertmacro GMF_File_Rename "Gothic_laptop.ini" "Gothic.ini"
	!insertmacro GMF_File_Rename "SystemPack_laptop.ini" "SystemPack.ini"
	!insertmacro _ReplaceInFile "Gothic.ini" "1366" "$RESX"
	!insertmacro _ReplaceInFile "Gothic.ini" "768" "$RESY"

SectionEnd


###################################
##     Описание компонентов      ##
###################################

LangString DESC_SecMain ${LANG_RUSSIAN} "Основные компоненты Gothic Steam Fix (SystemPack, Player Kit, патч 1.08k)."
LangString DESC_Group1 ${LANG_RUSSIAN} "Выбор компонентов русификации игры."
LangString DESC_SecAdditional_1 ${LANG_RUSSIAN} "Выберите эту опцию, если хотите установить русский текст и субтитры от Руссобит-М." 
LangString DESC_SecAdditional_2 ${LANG_RUSSIAN} "Выберите эту опцию, если хотите установить русскую озвучку и видео от Руссобит-М."  
LangString DESC_SecAdditional_3 ${LANG_RUSSIAN} "Выберите эту опцию, если у вашего ПК широкоформатный монитор (16x9 или 16х10)." 
LangString DESC_SecAdditional_4 ${LANG_RUSSIAN} "Выберите эту опцию, если предполагается запуск игры на ноутбуке."

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
	StrCpy $DirectoryText "Нажмите кнопку 'Обзор ...' и укажите папку, в которой установлена Gothic. Как правило, это Steam\steamapps\common\Gothic. \
$\n$\nЗатем нажмите кнопку 'Далее' для продолжения."
	InstallPathIsGood:
	System::Call 'user32::GetSystemMetrics(i 0) i .r0'
	System::Call 'user32::GetSystemMetrics(i 1) i .r1'
	StrCpy $RESX $0
	StrCpy $RESY $1
	System::Call kernel32::GetSystemDEPPolicy()i.r3
	StrCmp $3 "error" skipDEP
	IntCmp $3 ${DEP_SYSTEM_POLICY_TYPE_ALWAYSOFF} skipDEP
	IntCmp $3 ${DEP_SYSTEM_POLICY_TYPE_OPTIN} skipDEP
	MessageBox MB_OK|MB_ICONEXCLAMATION "Включена система предотвращения выполнения данных Windows (DEP). Отключите её и перезагрузите компьютер для избежания вылета при начале новой игры."
	skipDEP:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\Gothic.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd