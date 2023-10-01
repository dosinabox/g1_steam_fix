Unicode true
SetCompressor lzma
var DirectoryText

!include "MUI.nsh"

###################################
##            ��������           ##
###################################

!define MOD_NAME "Gothic Steam Fix"
!define MOD_VERSION "10.2023"
!define MOD_DETAILED_VERSION "23.10.1.0"
!define MOD_AUTHOR "D36"

Name "${MOD_NAME}"
OutFile "Gothic_Steam_Fix_RU_${MOD_VERSION}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "FileVersion" "${MOD_DETAILED_VERSION}"
VIAddVersionKey "LegalCopyright" "� ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "���������� ${MOD_NAME}"
VIAddVersionKey "ProductVersion" "${MOD_VERSION}"

###################################
##      ��������� ����������     ##
###################################

!define MUI_ICON "icon.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic.bmp"

Caption "${MOD_NAME}"
!define MUI_TEXT_WELCOME_INFO_TITLE "$\t   $\n$\t${MOD_NAME}"
!define MUI_TEXT_WELCOME_INFO_TEXT "������ ������� ����������� ������������ ��� ��������� �� ������ Steam-������ Gothic ��� ������ ������ � �����.$\n$\n��������! ������� � ������� 2023 ���� � ������� �� ���������� ����������� �� Snowball, ��� ��� ��� ����� ���������� �������� � Steam-������ ����. ��������� �������� ���� � ����������, ����� ������� � ����, � ����� ���������� ����������� ��������� ��������. ���� �� �����-�� ������� ��� ����� ����������� � ������� Gothic Steam Fix, �� ����������� ����� ������ �� GitHub �������: https://github.com/dosinabox/g1_steam_fix/releases"

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText $DirectoryText

!define MUI_TEXT_COMPONENTS_TITLE "����� ����������� ��� ���������"
!define MUI_TEXT_COMPONENTS_SUBTITLE " "
!define MUI_COMPONENTSPAGE_TEXT_TOP "�������� ���������� ${MOD_NAME}, ������� �� ������ ����������.$\n������� ������ '����������' ��� �����������." 
!define MUI_COMPONENTSPAGE_TEXT_COMPLIST "���������� ��� ���������:"
!define MUI_COMPONENTSPAGE_SMALLDESC

!define MUI_TEXT_INSTALLING_TITLE "����������� ������ � ���������..."
!define MUI_TEXT_INSTALLING_SUBTITLE " "

!define MUI_TEXT_FINISH_INFO_TITLE "$\t   $\n$\t��������� ���������!"
!define MUI_TEXT_FINISH_INFO_TEXT "������ ���� ����� ��������� �� Steam. ��������� �������������� ���������� ��� ������ �� ��������� � �� �������������.$\n$\n�������� ����!"

BrandingText " "

###################################
##     ��������  ������������    ##
###################################

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_COMPONENTS
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

###################################
##             �����             ##
###################################

!insertmacro MUI_LANGUAGE "Russian"

###################################
##          �����������          ##
###################################

Section "�������� ����� � ����������" SecMain
	SectionIn RO

	Delete "$INSTDIR\VDFS.dmp"
	Delete "$INSTDIR\system\dinput.dll"
	Delete "$INSTDIR\Data\textures_bikini.vdf"
	Delete "$INSTDIR\Data\textures_apostroph_patch_neu.vdf"
	Delete "$INSTDIR\Data\textures_choicebox_32pixel_modialpha.vdf"
	Delete "$INSTDIR\Data\SystemPack.vdf"
	Delete "$INSTDIR\_work\data\video\logo2.bik"

	SetOutPath "$INSTDIR"
	File "GothicModFix_(Snowball)_ReadMe.txt"
	File "Union.url"

	SetOutPath "$INSTDIR\_work\data\video"
	File "logo1.bik"

	SetOutPath "$INSTDIR\Data"
	File "Union.vdf"

	SetOutPath "$INSTDIR\Data\ModVDF"
	File "snowball_fix.mod"
	File "snowball_fix_speech.mod"
	File "snowball_models.mod"

	SetOutPath "$INSTDIR\launcher"
	File "d3d11.dll"

	SetOutPath "$INSTDIR\system"
	File "binkw32.dll"
	File "Gothic.ini"
	File "GothicGame.ini"
	File "Mss32.dll"
	File "msvcp100.dll"
	File "msvcr100.dll"
	File "Shw32.dll"
	File "snowball_fix.ini"
	File "snowball_fix.rtf"
	File "stdhost.exe"
	File "SystemPack.ini"
	File "Union.patch"
	File "vdfs32g.dll"

	SetOutPath "$INSTDIR\system\autorun"
	File "AutoScreenRes.dll"

SectionEnd


Section /o "��������� ��������" SecAdditional_1

	SetOutPath "$INSTDIR\Data\Plugins"
	File "zGamePad.vdf"

SectionEnd


SectionGroup /e "����������� �� ��������-�" Group1


Section /o "����� � ��������" SecAdditional_2

	CreateDirectory "$INSTDIR\saves_russobit_fix\current"

	SetOutPath "$INSTDIR\Data"
	File "russobit_main.vdf"

	SetOutPath "$INSTDIR\Data\ModVDF"
	File "russobit_fix.mod"
	File "russobit_models.mod"

	SetOutPath "$INSTDIR"
	File "GothicModFix_(Russobit-M)_ReadMe.txt"

	SetOutPath "$INSTDIR\_work\data\scripts\_compiled"
	File "MENU.DAT"
	File "GOTHIC.DAT"

	SetOutPath "$INSTDIR\_work\data\scripts\content\cutscene"
	File "OU.BIN"

	SetOutPath "$INSTDIR\system"
	File "russobit_fix.ini"
	File "russobit_fix.rtf"
	File "GothicGame.rtf"

SectionEnd


Section /o "������� � �����" SecAdditional_3
	
	Delete "$INSTDIR\Data\speech_babe_speech_engl.vdf"
	Delete "$INSTDIR\Data\speech_patch2.vdf"

	SetOutPath "$INSTDIR\Data"
	File "speech.vdf"

	SetOutPath "$INSTDIR\Data\ModVDF"
	File "russobit_fix_speech.mod"

	SetOutPath "$INSTDIR\_work\data\video"
	File "greatPrayer.bik"
	File "intro.bik"
	File "playerout.bik"

SectionEnd

SectionGroupEnd


###################################
##     �������� �����������      ##
###################################

LangString DESC_SecMain ${LANG_RUSSIAN} "�������� ���������� �������� (Union 1.0m, ����������� ��������)."
LangString DESC_Group1 ${LANG_RUSSIAN} "����� ����������� ����������� ����."
LangString DESC_SecAdditional_1 ${LANG_RUSSIAN} "�������� ��� �����, ���� ������ ������ �� ��������."
LangString DESC_SecAdditional_2 ${LANG_RUSSIAN} "�������� ��� �����, ���� ������ ���������� ������� ����� � �������� �� ��������-�."
LangString DESC_SecAdditional_3 ${LANG_RUSSIAN} "�������� ��� �����, ���� ������ ���������� ������� ������� � ����� �� ��������-�."

!insertmacro MUI_FUNCTION_DESCRIPTION_BEGIN
!insertmacro MUI_DESCRIPTION_TEXT ${SecMain} $(DESC_SecMain)
!insertmacro MUI_DESCRIPTION_TEXT ${Group1} $(DESC_Group1)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_1} $(DESC_SecAdditional_1)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_2} $(DESC_SecAdditional_2)
!insertmacro MUI_DESCRIPTION_TEXT ${SecAdditional_3} $(DESC_SecAdditional_3)
!insertmacro MUI_FUNCTION_DESCRIPTION_END

###################################
##            �������            ##
###################################

Function .onInit
	SetSilent normal
	StrCpy $DirectoryText "���������� ������������� Steam-������ Gothic. ������� ������ '�����' ��� ����������� ��� '����� ...' ��� ������ ������ �����."
	SetRegView 32
	ReadRegStr $INSTDIR HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 65540" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	SetRegView 64
	ReadRegStr $INSTDIR HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 65540" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	InstallPathIsFound:
	IfFileExists "$INSTDIR\system\Gothic.exe" InstallPathIsGood
	StrCpy $INSTDIR "$PROGRAMFILES\Steam\steamapps\common\Gothic"
	StrCpy $DirectoryText "������� ������ '����� ...' � ������� �����, � ������� ����������� Gothic. ��� �������, ��� Steam\steamapps\common\Gothic.$\n$\n����� ������� ������ '�����' ��� �����������."
	InstallPathIsGood:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\Gothic.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd
