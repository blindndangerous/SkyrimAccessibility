Scriptname AccessibilityScriptAccessibilityMenu extends ReferenceAlias

Bool IsAccessibilityMenuOpen Auto

String[] MenuList Auto
Int CurrentMenu Auto

Int CurrentSubMenuDepth Auto
String CurrentSubMenuName Auto

Int CurrentSelection Auto
Int MenuEntriesLimit Auto

Event OnInit()
    RegisterForKey(47) ;V key
    RegisterForKey(17) ;W key
    RegisterForKey(30) ;A key
    RegisterForKey(31) ;S key
    RegisterForKey(32) ;D key
    RegisterForKey(29) ;Left Ctrl
    RegisterForKey(57) ;Spacebar
    IsAccessibilityMenuOpen = False ;Reset Bool
    MenuList = New String[4] ;Set Length of MenuList
    CurrentMenu = 0 ;Reset CurrentMenu
    CurrentSubMenuDepth = 0 ;Reset CurrentSubMenuDepth
    CurrentSubMenuName = "" ;Reset CurrentSubMenuName
    CurrentSelection = 0 ;Reset CurrentSelection
    MenuEntriesLimit = 10 ;Set MenuEntriesLimit
    MenuList() ;Populate MenuList
    Debug.Notification("Accessibility menu is ready")
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 47 && !Utility.IsInMenuMode() && IsAccessibilityMenuOpen == False ;V key
        Utility.Wait(0.1)
        IsAccessibilityMenuOpen = True
        Game.DisablePlayerControls()
        Debug.Notification("Accessibility menu is open")
    ElseIf KeyCode == 47 && IsAccessibilityMenuOpen == True ;V key
        Game.EnablePlayerControls()
        IsAccessibilityMenuOpen = False
        Debug.Notification("Accessibility menu is closed")
    ElseIf KeyCode == 17 && IsAccessibilityMenuOpen == True ;W key
        ScrollCurrentSelectionUp()
    ElseIf KeyCode == 30 && IsAccessibilityMenuOpen == True ;A key
        ScrollCurrentMenuLeft()
    ElseIf KeyCode == 31 && IsAccessibilityMenuOpen == True ;S key
        ScrollCurrentSelectionDown()
    ElseIf KeyCode == 32 && IsAccessibilityMenuOpen == True ;D key
        ScrollCurrentMenuRight()
    ElseIf KeyCode == 29 && IsAccessibilityMenuOpen == True ;Left Ctrl
        CurrentSubMenuDepthUp()
    ElseIf KeyCode == 57 && IsAccessibilityMenuOpen == True ;Spacebar
        Select()
    EndIf
EndEvent

Function ScrollCurrentMenuRight()
    If CurrentMenu < MenuList.Length - 1
        CurrentMenu += 1
    Else
        CurrentMenu = 0
    EndIf
    CurrentMenuName()
EndFunction

Function ScrollCurrentMenuLeft()
    If CurrentMenu > 0
        CurrentMenu -= 1
    Else
        CurrentMenu = MenuList.Length - 1
    EndIf
    CurrentMenuName()
EndFunction

Function ScrollCurrentSelectionDown()
    If CurrentSelection < MenuEntriesLimit - 1
        CurrentSelection += 1
    Else
        CurrentSelection = 0
    EndIf
    CurrentMenuName()
EndFunction

Function ScrollCurrentSelectionUp()
    If CurrentSelection > 0
        CurrentSelection -= 1
    Else
        CurrentSelection = MenuEntriesLimit - 1
    EndIf
    CurrentMenuName()
EndFunction

Function CurrentSubMenuDepthUp()
    If CurrentSubMenuDepth > 0
        CurrentSubMenuDepth -= 1
    EndIf
    CurrentMenuName()
EndFunction

Function CurrentSubMenuDepthDown()
    CurrentSubMenuDepth += 1
    CurrentMenuName()
EndFunction

Function MenuList()
    MenuList[0] = "Accessibility Menu"
    MenuList[1] = "Travel Menu"
    MenuList[2] = "Utility Menu"
    MenuList[3] = "Settings Menu"
EndFunction

Function CurrentMenuName()
    Debug.Notification(CurrentSubMenuName + " : " + MenuList[CurrentMenu])
EndFunction

Function Select()
    If CurrentMenu == 0

    ElseIf CurrentMenu == 1

    ElseIf CurrentMenu == 2

    ElseIf CurrentMenu == 3

    EndIf
EndFunction

