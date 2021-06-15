SetCompressor lzma
var DirectoryText

!include "MUI.nsh"
!include "FileFunc.nsh"

###################################
##            �������            ##
###################################

!macro GMF_File_Rename FILENAME_1 FILENAME_2
	File "${FILENAME_1}"
	IfFileExists "${FILENAME_2}" "" +2
	Delete "${FILENAME_2}"
	Rename "${FILENAME_1}" "${FILENAME_2}"
!macroend

###################################
##            ��������           ##
###################################

!define MOD_NAME "Gothic Steam Fix"
!define MOD_VERSION "06.2021"
!define MOD_DETAILED_VERSION "21.6.15.0"
!define MOD_AUTHOR "D36"

Name "${MOD_NAME}"
OutFile "Gothic_Steam_Fix_${MOD_VERSION}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "FileVersion" "${MOD_DETAILED_VERSION}"
VIAddVersionKey "LegalCopyright" "� ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "${MOD_NAME} Install"
VIAddVersionKey "ProductVersion" "${MOD_VERSION}"

###################################
##      ��������� ����������     ##
###################################

!define MUI_ICON "icon.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo_int.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic_int.bmp"

Caption "${MOD_NAME}"
!define MUI_TEXT_WELCOME_INFO_TITLE "$\t   $\n$\t${MOD_NAME}"
!define MUI_TEXT_WELCOME_INFO_TEXT "'Gothic Steam Fix' is an all-in-one solution of the most known 'Gothic' problems on modern PCs. This pack includes official 1.08k patch, Union 1.0k, SystemPack 1.9 and Player Kit 2.8 and fully compatible with english, deutsch, spanish and polish versions of the game."

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText $DirectoryText

!define MUI_TEXT_INSTALLING_TITLE "Please wait..."
!define MUI_TEXT_INSTALLING_SUBTITLE " "

!define MUI_TEXT_FINISH_INFO_TITLE "$\t   $\n$\tInstallation complete!"
!define MUI_TEXT_FINISH_INFO_TEXT "You can now launch the game using your Steam account."

BrandingText " "

###################################
##     ��������  ������������    ##
###################################

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

###################################
##             �����             ##
###################################

!insertmacro MUI_LANGUAGE "English"

###################################
##          �����������          ##
###################################

Section "Main" SecMain
	SectionIn RO

	Delete "$INSTDIR\VDFS.dmp"
	Delete "$INSTDIR\system\ddraw.dll"
	Delete "$INSTDIR\system\dinput.dll"
	Delete "$INSTDIR\Data\textures_bikini.vdf"
	Delete "$INSTDIR\Data\textures_apostroph_patch_neu.vdf"
	Delete "$INSTDIR\Data\textures_choicebox_32pixel_modialpha.vdf"
	Delete "$INSTDIR\Data\Gothic_Mod_Fix_Beta.vdf"
	Delete "$INSTDIR\Data\SystemPack.vdf"
	Delete "$INSTDIR\_work\data\video\logo1.bik"
	Delete "$INSTDIR\_work\data\video\logo2.bik"

	CreateDirectory "$INSTDIR\_work\data\textures\_compiled"
	CreateDirectory "$INSTDIR\Saves\Current"
	CreateDirectory "$INSTDIR\Data\ModVDF"

	SetOutPath "$INSTDIR"
	File "vcredist_2010_x86.exe"
	Exec "vcredist_2010_x86.exe /q /norestart"

	SetOutPath "$INSTDIR\Data"
	File "Union.vdf"

	SetOutPath "$INSTDIR\system"
	File "binkw32.dll"
	File "Gothic.exe"
	File "Gothic.ini"
	File "GothicMod.exe"
	File "GothicStarter.exe"
	File "Shw32.dll"
	File "vdfs32g.dll"
	File "Union.patch"
	File "original.rtf"
	!insertmacro GMF_File_Rename "GothicGame_original.ini" "GothicGame.ini"
	!insertmacro GMF_File_Rename "SystemPack_int.ini" "SystemPack.ini"

	SetOutPath "$INSTDIR\system\autorun"
	File "AutoScreenRes.dll"

SectionEnd

###################################
##            �������            ##
###################################

Function .onInit
	SetSilent normal
	StrCpy $DirectoryText "Gothic installation folder is found, press 'Install' button to continue or 'Browse...' to select another install location."
	SetRegView 32
	ReadRegStr $INSTDIR HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 65540" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	SetRegView 64
	ReadRegStr $INSTDIR HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Steam App 65540" "InstallLocation"
	StrCmp $INSTDIR "" "" InstallPathIsFound
	InstallPathIsFound:
	IfFileExists "$INSTDIR\system\Gothic.exe" InstallPathIsGood
	StrCpy $INSTDIR "$PROGRAMFILES\Steam\steamapps\common\Gothic"
	StrCpy $DirectoryText "Please select your Gothic installation folder (e.g. Steam\steamapps\common\Gothic)."
	InstallPathIsGood:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\Gothic.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd
