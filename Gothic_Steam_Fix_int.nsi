###################################
##      Подключенные хидеры      ##
###################################

!include "MUI.nsh"
!include "FileFunc.nsh"
!include "GothicFixesCommon.nsh"

###################################
##            Основное           ##
###################################

!define MOD_NAME "Gothic Steam Fix"
!define MOD_VERSION "01.2020"
!define MOD_DETAILED_VERSION "20.1.9.0"
!define MOD_AUTHOR "D36"

Name "${MOD_NAME}"
OutFile "Gothic_Steam_Fix_${MOD_VERSION}.exe"

VIProductVersion "${MOD_DETAILED_VERSION}"
VIAddVersionKey "FileVersion" "${MOD_DETAILED_VERSION}"
VIAddVersionKey "LegalCopyright" "© ${MOD_AUTHOR}"
VIAddVersionKey "FileDescription" "${MOD_NAME} Install"
VIAddVersionKey "ProductVersion" "${MOD_VERSION}"

###################################
##      Настройки интерфейса     ##
###################################

!define MUI_ICON "icon.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "logo_int.bmp"
!define MUI_WELCOMEFINISHPAGE_BITMAP "pic_int.bmp"

Caption "${MOD_NAME}"
!define MUI_TEXT_WELCOME_INFO_TITLE "$\t   $\n$\tGothic Steam Fix"
!define MUI_TEXT_WELCOME_INFO_TEXT "Gothic Steam Fix is a comprehensive solution of the most known 'Gothic' problems on modern PCs. This pack includes official 1.08k patch, latest versions of SystemPack and Player Kit and fully compatible with english, deutsch, spanish and polish versions of the game."

!define MUI_TEXT_DIRECTORY_SUBTITLE " "
DirText $DirectoryText

!define MUI_TEXT_INSTALLING_TITLE "Please wait..."
!define MUI_TEXT_INSTALLING_SUBTITLE " "

!define MUI_TEXT_FINISH_INFO_TITLE "$\t   $\n$\tInstallation complete!"
!define MUI_TEXT_FINISH_INFO_TEXT "You can now launch the game using your Steam account."

BrandingText " "

###################################
##     Страницы  инсталлятора    ##
###################################

!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

###################################
##             Языки             ##
###################################

!insertmacro MUI_LANGUAGE "English"

###################################
##          Инсталляция          ##
###################################

Section "Main" SecMain
	SectionIn RO

	!insertmacro GMF_Delete "$INSTDIR\VDFS.dmp"
	!insertmacro GMF_Delete "$INSTDIR\delsaves.exe"
	!insertmacro GMF_Delete "$INSTDIR\Gothic.url"
	!insertmacro GMF_Delete "$INSTDIR\install.log"
	!insertmacro GMF_Delete "$INSTDIR\JoWooD.url"
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
	!insertmacro GMF_Delete "$INSTDIR\_work\data\video\logo1.bik"
	!insertmacro GMF_Delete "$INSTDIR\_work\data\video\logo2.bik"

	CreateDirectory "$INSTDIR\_work\data\textures\_compiled"
	CreateDirectory "$INSTDIR\Saves\Current"
	CreateDirectory "$INSTDIR\Data\ModVDF"

	SetOutPath "$INSTDIR"
	File "VDFS.cfg"

	SetOutPath "$INSTDIR\Data"
	File "SystemPack.vdf"
	File "textures_widescreen.vdf"

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
	File "dinput.dll"
	File "Flange.flt"
	File "Gothic.exe"
	File "Gothic.ini"
	File "GothicMod.exe"
	File "GothicStarter.exe"
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
	File "vdfs32g.dll"
	File "original.rtf"
	!insertmacro _ReplaceInFile "Gothic.ini" "1280" "$RESX"
	!insertmacro _ReplaceInFile "Gothic.ini" "1024" "$RESY"
	!insertmacro GMF_File_Rename "GothicGame_original.ini" "GothicGame.ini"
	!insertmacro GMF_File_Rename "SystemPack_int.ini" "SystemPack.ini"

SectionEnd

###################################
##            Функции            ##
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
	System::Call 'user32::GetSystemMetrics(i 0) i .r0'
	System::Call 'user32::GetSystemMetrics(i 1) i .r1'
	StrCpy $RESX $0
	StrCpy $RESY $1
	System::Call kernel32::GetSystemDEPPolicy()i.r3
	StrCmp $3 "error" skipDEP
	IntCmp $3 ${DEP_SYSTEM_POLICY_TYPE_ALWAYSOFF} skipDEP
	IntCmp $3 ${DEP_SYSTEM_POLICY_TYPE_OPTIN} skipDEP
	MessageBox MB_OK|MB_ICONEXCLAMATION "Windows Data Execution Prevention (DEP) is currently enabled. Please disable it and restart your computer to avoid 'Access Violation' error."
	skipDEP:
FunctionEnd

Function .onVerifyInstDir
	IfFileExists "$INSTDIR\system\Gothic.exe" CheckIsSuccessful
	Abort
	CheckIsSuccessful:
FunctionEnd