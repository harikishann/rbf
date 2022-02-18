*** Settings ***
Library           SapGuiLibrary
Library           OperatingSystem
Library           Process

*** Variables ***
${SAP_Statusbar}    wnd[0]/sbar

*** Test Cases ***
Create Standard Order
    [Documentation]    Create an Standard Order
    Start SAP
    Connect to SAP session
    Enter login details
    Enter transaction code
    Enter Order type details
    Enter Order details
    Enter Material Details
    Click Save button

*** Keywords ***
Start SAP
    Start Process    C:/Program Files (x86)/SAP/FrontEnd/SAPgui/saplogon.exe    program
    Sleep    2s

Connect to SAP session
    Connect to Session    3
    Open Connection    demo

Enter login details
    SapGuiLibrary.Input Text    wnd[0]/usr/txtRSYST-BNAME    TRAINEE120
    SapGuiLibrary.Input Password    wnd[0]/usr/pwdRSYST-BCODE    test123
    Send Vkey    0
    Sleep    3s

Enter transaction code
    SapGuiLibrary.Run Transaction    VA01

Enter Order type details
    SapGuiLibrary.Input Text    wnd[0]/usr/ctxtVBAK-AUART    ZSOR
    SapGuiLibrary.Input Text    wnd[0]/usr/ctxtVBAK-VKORG    ZR01
    SapGuiLibrary.Input Text    wnd[0]/usr/ctxtVBAK-VTWEG    ZU
    SapGuiLibrary.Input Text    wnd[0]/usr/ctxtVBAK-SPART    ZF
    Send Vkey    0

Enter Order details
    SapGuiLibrary.Input Text    wnd[0]/usr/subSUBSCREEN_HEADER:SAPMV45A:4021/txtVBKD-BSTKD    test
    SapGuiLibrary.Input Text    wnd[0]/usr/subSUBSCREEN_HEADER:SAPMV45A:4021/subPART-SUB:SAPMV45A:4701/ctxtKUAGV-KUNNR    201059
    SapGuiLibrary.Input Text    wnd[0]/usr/subSUBSCREEN_HEADER:SAPMV45A:4021/subPART-SUB:SAPMV45A:4701/ctxtKUWEV-KUNNR    201059
    Send Vkey    0
    Send Vkey    0

Enter Material Details
    SapGuiLibrary.Input Text    wnd[0]/usr/tabsTAXI_TABSTRIP_OVERVIEW/tabpT\\01/ssubSUBSCREEN_BODY:SAPMV45A:4400/subSUBSCREEN_TC:SAPMV45A:4900/tblSAPMV45ATCTRL_U_ERF_AUFTRAG/ctxtRV45A-MABNR[1,0]    710609
    SapGuiLibrary.Input Text    wnd[0]/usr/tabsTAXI_TABSTRIP_OVERVIEW/tabpT\\01/ssubSUBSCREEN_BODY:SAPMV45A:4400/subSUBSCREEN_TC:SAPMV45A:4900/tblSAPMV45ATCTRL_U_ERF_AUFTRAG/txtRV45A-KWMENG[2,0]    5
    Send Vkey    0

Click Save button
    SapGuiLibrary.Click Element    wnd[0]/tbar[0]/btn[11]
    ${Text}    Get Value    ${SAP_Statusbar}
    Take Screenshot    sap-screenshot
