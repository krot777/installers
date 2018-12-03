;2018-11-05 21:54:00
!define PRODUCT_NAME "Total Commander"
!define PRODUCT_VERSION "9.21.0.0"
!define PRODUCT_PUBLISHER "Ghisler Software GmbH"
!define PRODUCT_EXEx32 "TOTALCMD.EXE"
!define PRODUCT_EXEx64 "TOTALCMD64.EXE"
!define START_MENU "${PRODUCT_NAME}"
!define PRODUCT_WEB_SITE "http://www.Ghisler.com/"
!define PRODUCT_DIR_REGKEY "Software\Microsoft\Windows\CurrentVersion\App Paths\${PRODUCT_EXEx32}"
!define PRODUCT_UNINST_KEY "Software\Microsoft\Windows\CurrentVersion\Uninstall\${PRODUCT_NAME}"
!define PRODUCT_UNINST_ROOT_KEY "HKLM"
!define PRODUCT_RePacked "Shen0x440"

SetCompressor lzma

; MUI 1.67 compatible ------
!include "MUI2.nsh"
!include "FileFunc.nsh"
BrandingText "${PRODUCT_RePacked}"
; MUI Settings
!define MUI_ABORTWARNING
!define MUI_ICON "other\TC_in.ico"
!define MUI_UNICON "other\TC_un.ico"
!define MUI_HEADERIMAGE
!define MUI_HEADERIMAGE_BITMAP "other\header.bmp"
Unicode true
; Language Selection Dialog Settings
!define MUI_LANGDLL_REGISTRY_ROOT "${PRODUCT_UNINST_ROOT_KEY}"
!define MUI_LANGDLL_REGISTRY_KEY "${PRODUCT_UNINST_KEY}"
!define MUI_LANGDLL_REGISTRY_VALUENAME "NSIS:Language"

;!define MUI_CUSTOMFUNCTION_GUIINIT onGUIInit
var dlg
var Label
var Check
var Check1
var Check2
;var Check3
var CheckBox
var CheckBox1
;var CheckBox2
var Radio
var Radio1
var RadioButton
;var RadioButton1
var ImageHandle
var Image

var GroupBox1
var GroupBox2
var GroupBox3
;Var product_version


; Welcome page
!define MUI_WELCOMEFINISHPAGE_BITMAP "other\Wizard.bmp"
!define MUI_WELCOMEPAGE_TITLE_3LINES
!insertmacro MUI_PAGE_WELCOME
;NMSDVDXU.dll
Page custom PageInit PageDestroy
; Directory page
!insertmacro MUI_PAGE_DIRECTORY
; Instfiles page
!insertmacro MUI_PAGE_INSTFILES
; Finish page
;!define MUI_FINISHPAGE_RUN "$INSTDIR\${PRODUCT_EXE}"
;!define MUI_FINISHPAGE_TITLE_3LINES
;!insertmacro MUI_PAGE_FINISH
AutoCloseWindow true

; Uninstaller pages
!insertmacro MUI_UNPAGE_INSTFILES

; Language files
!insertmacro MUI_LANGUAGE "English"
!insertmacro MUI_LANGUAGE "Russian"

; Reserve files
;!insertmacro MUI_RESERVEFILE_INSTALLOPTIONS

; MUI end ------

Name "${PRODUCT_NAME} ${PRODUCT_VERSION}"
OutFile "./Build/${PRODUCT_NAME}.exe"
UninstallCaption "${PRODUCT_NAME} ${PRODUCT_VERSION}"
InstallDir "$PROGRAMFILES\${PRODUCT_NAME}"
InstallDirRegKey HKLM "${PRODUCT_DIR_REGKEY}" ""
ShowInstDetails nevershow
ShowUnInstDetails nevershow


VIProductVersion "${PRODUCT_VERSION}"
!define /date date "%H:%M %d %b, %Y"
VIAddVersionKey /LANG=${LANG_ENGLISH} "ProductName" "${PRODUCT_NAME}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "Comments" "TC"
VIAddVersionKey /LANG=${LANG_ENGLISH} "CompanyName" "${PRODUCT_PUBLISHER}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalTrademarks" "Ghisler Software GmbH"
VIAddVersionKey /LANG=${LANG_ENGLISH} "LegalCopyright" "${PRODUCT_PUBLISHER} All rights reserved"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileDescription" "Ghisler Software GmbH"
VIAddVersionKey /LANG=${LANG_ENGLISH} "FileVersion" "${PRODUCT_VERSION}"
VIAddVersionKey /LANG=${LANG_ENGLISH} "RePackBuild" " by shen0x440"




Function .onInit
  !insertmacro MUI_LANGDLL_DISPLAY
  InitPluginsDir ;
  File "/oname=$PLUGINSDIR\1.bmp" "other\1.bmp"
 File "/oname=$PLUGINSDIR\2.bmp" "other\2.bmp"

FunctionEnd



!include "Lang.nsi"


Function PageInit
  !insertmacro MUI_HEADER_TEXT "$(Header)" "..."
  nsDialogs::Create 1018
  Pop $dlg
  ${NSD_CreateLabel} 0u 0u 120u 12u "$()"
  Pop $Label
  ;;
    ${NSD_CreateGroupBox} 122.43u 7.38u 159.29u 72u ""
  Pop $GroupBox3
    ${NSD_CreateGroupBox} 7.9u 7.38u 273.82u 72u "$(inop)"
  Pop $GroupBox1


  ${NSD_CreateRadioButton} 19.09u 19.08u 77.01u 20.92u "$(install) ${PRODUCT_NAME}"
  Pop $RadioButton
  ${NSD_SetState} $RadioButton 1            ;������ ���������� ����������
  ${NSD_OnClick} $RadioButton RadioButton   ;������� ������� �����������
  ;;
  ; ${NSD_CreateRadioButton} 19.09u 43.69u 77.01u 24.62u "1.30"
  ; Pop $RadioButton1
  ; ${NSD_SetState} $RadioButton 1            ;������ ���������� ����������
  ; ${NSD_OnClick} $RadioButton1 RadioButton1   ;������� ������� ����������� */
  ; ;;


    ${NSD_CreateGroupBox} 7.9u 89.23u 273.82u 43.69u "$(ShortCut1)"
  Pop $GroupBox2

  ${NSD_CreateCheckBox} 19.09u 106.46u 68.46u 14.77u "$(ShortCutD)"
  Pop $CheckBox
  ${NSD_SetState} $CheckBox 1
  ;;
  ${NSD_CreateCheckBox} 98.08u 106.46u 68.46u 14.77u "$(ShortCutM)"
  Pop $CheckBox1
  ${NSD_SetState} $CheckBox1 1
  ;;;;;;;;;;
  ;  ${NSD_CreateCheckBox} 182.33u 100.92u 95.44u 28.31u "$(integ)"
  ; Pop $CheckBox2
  ; ${NSD_SetState} $CheckBox2 1
  ;;;;;;;;
  ;;;;;;;;;;;;4
  ${NSD_CreateBitmap} 153.37u 19.08u 46.08u 27.69u "" ;������� ������� ��� ��������
  Pop $Image
  ${NSD_SetImage} $Image "$PLUGINSDIR\1.bmp" $ImageHandle ;��������� ��������
  nsDialogs::Show
  ${NSD_FreeImage} $ImageHandle ;������� ��������
FunctionEnd

Function switching
  ${NSD_GetState} $RadioButton $Radio ;������� ������ ������� ������������
  ${If} $Radio == 1                   ;���� ���������� "��������� ������� ������" ���������� ��...
                     ;������� ��������
      ${NSD_SetImage} $Image "$PLUGINSDIR\1.bmp" $ImageHandle  ;��������� ��������
  ${Else}                          ;���� ���������� "��������� ������� ������" ������������ ��...

      ${NSD_FreeImage} $ImageHandle               ;������� ��������
      ${NSD_SetImage} $Image "$PLUGINSDIR\2.bmp" $ImageHandle  ;��������� ��������
  ${EndIf}
FunctionEnd
 ;������� ������� ������� �������������


Function RadioButton
  Pop $RadioButton
  Call switching
FunctionEnd


/* Function RadioButton1
  Pop $RadioButton1
  Call switching
FunctionEnd */


Function PageDestroy

  ${NSD_GetState} $RadioButton $Radio
  ${NSD_GetState} $RadioButton1 $Radio1
  ${NSD_GetState} $CheckBox $Check
  ${NSD_GetState} $CheckBox1 $Check1
  ${NSD_GetState} $CheckBox2 $Check2

FunctionEnd


Section "INSTALL_APP"
${If} $Radio == 1

SetOutPath "$INSTDIR"
SetDetailsPrint textonly
DetailPrint "$(InstallationAPP).............."

File "/oname=$PLUGINSDIR\TotalCommander.jar" "TotalCommander.7z"
DetailPrint "$(InstallationAPP).............."

;File "Everlasting.Summer-1.2.*"

 Nsis7z::ExtractWithCallback "$PLUGINSDIR\TotalCommander.jar" $R9
DetailPrint "$(InstallationAPP).............."

  ${EndIf}
SectionEnd




Section -AdditionalIcons ;Shorcuts

     ${If} $Check == 1
  CreateShortCut "$Desktop\${PRODUCT_NAME}x32.lnk" "$INSTDIR\${PRODUCT_EXEx32}"
  CreateShortCut "$Desktop\${PRODUCT_NAME}x64.lnk" "$INSTDIR\${PRODUCT_EXEx64}"
       ;;;
       DetailPrint "$(ShortCut)"
       ;;;

   ${EndIf}

   ${If} $Check1 == 1

  WriteIniStr "$INSTDIR\${PRODUCT_NAME}.url" "InternetShortcut" "URL" "${PRODUCT_WEB_SITE}"
  CreateDirectory "$SMPROGRAMS\${START_MENU}"
  CreateShortCut "$SMPROGRAMS\${START_MENU}\${PRODUCT_NAME}x32.lnk" "$INSTDIR\${PRODUCT_EXEx32}"
  CreateShortCut "$SMPROGRAMS\${START_MENU}\${PRODUCT_NAME}x64.lnk" "$INSTDIR\${PRODUCT_EXEx64}"
  CreateShortCut "$SMPROGRAMS\${START_MENU}\Website.lnk" "$INSTDIR\${PRODUCT_NAME}.url"
  CreateShortCut "$SMPROGRAMS\${START_MENU}\Uninstall ${PRODUCT_NAME}.lnk" "$INSTDIR\uninstall.exe"
  ${EndIf}

SectionEnd



!include "Unistaller.nsi"
!include "Mes.nsi"