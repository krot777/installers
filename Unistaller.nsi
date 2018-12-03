


Section -Post
  WriteUninstaller "$INSTDIR\uninstall.exe"
  WriteRegStr HKLM "${PRODUCT_DIR_REGKEY}" "" "$INSTDIR\${PRODUCT_EXEx32}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayName" "$(^Name)"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "UninstallString" "$INSTDIR\uninstall.exe"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayIcon" "$INSTDIR\${PRODUCT_EXEx32}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "DisplayVersion" "${PRODUCT_VERSION}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "URLInfoAbout" "${PRODUCT_WEB_SITE}"
  WriteRegStr ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}" "Publisher" "${PRODUCT_PUBLISHER}"
SectionEnd


Function un.onUninstSuccess
  HideWindow
  MessageBox MB_ICONINFORMATION|MB_OK "$(^Name) was successfully removed from your computer."
FunctionEnd

Function un.onInit
!insertmacro MUI_UNGETLANGUAGE
  MessageBox MB_ICONQUESTION|MB_YESNO|MB_DEFBUTTON2 "Are you sure you want to completely remove $(^Name) and all of its components?" IDYES +2
  Abort
FunctionEnd

Section Uninstall
SetDetailsPrint listonly
DetailPrint "Unistalling"
  RMDir /r "$INSTDIR"
  Delete "$INSTDIR\${PRODUCT_NAME}.url"
  Delete "$INSTDIR\uninstall.exe"
  Delete "$INSTDIR\${PRODUCT_EXEx32}"
  Delete "$INSTDIR\${PRODUCT_EXEx64}"

 
  Delete "$SMPROGRAMS\${START_MENU}\Uninstall ${PRODUCT_NAME}.lnk"
  Delete "$SMPROGRAMS\${START_MENU}\Website.lnk"
  Delete "$Desktop\${PRODUCT_NAME}x32.lnk"
  Delete "$Desktop\${PRODUCT_NAME}x64.lnk"

  RMDir /r "$SMPROGRAMS\${START_MENU}"
 Delete "$SMPROGRAMS\${START_MENU}"
  Delete "$SMPROGRAMS\${START_MENU}\${PRODUCT_NAME}x32.lnk"
  Delete "$SMPROGRAMS\${START_MENU}\${PRODUCT_NAME}x64.lnk"

  RMDir "$INSTDIR"

 
DeleteRegKey ${PRODUCT_UNINST_ROOT_KEY} "${PRODUCT_UNINST_KEY}"
  DeleteRegKey HKLM "${PRODUCT_DIR_REGKEY}"
  SetAutoClose true
  

SectionEnd
