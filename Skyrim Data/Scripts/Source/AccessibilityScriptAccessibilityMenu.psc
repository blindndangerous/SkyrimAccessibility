Scriptname AccessibilityScriptAccessibilityMenu extends ReferenceAlias

Bool IsAccessibilityMenuOpen Auto
Int CurrentMenu Auto
Int MenuCount Auto
Int CurrentSubMenu Auto
Int CurrentSelection Auto
Int SelectionCount Auto
String[] MenuList Auto

Event OnInit()
    RegisterForKey(47) ;V key
    RegisterForKey(17) ;W key
    RegisterForKey(30) ;A key
    RegisterForKey(31) ;S key
    RegisterForKey(32) ;D key
    RegisterForKey(29) ;Left Ctrl
    RegisterForKey(57) ;Spacebar
    IsAccessibilityMenuOpen = False ;Reset Bool
    CurrentMenu = 0 ;Reset CurrentMenu
    CurrentSubMenu = 0 ;Reset CurrentSubMenu
    CurrentSelection = 0 ;Reset CurrentSelection
    String[] MenuList = New String[4] ;Set MenuCount
    MenuCount = MenuList.Length ;Set MenuCount
    Debug.Notification("Accessibility menu is ready")
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 47 && !Utility.IsInMenuMode() && IsAccessibilityMenuOpen == False
        Utility.Wait(0.1)
        IsAccessibilityMenuOpen = True
        Debug.Notification("Accessibility menu is open")
        AccessibilityMenu()
        Debug.Notification("Accessibility menu is closed")
    EndIf
EndEvent

Function AccessibilityMenu()
    While IsAccessibilityMenuOpen == True
        Utility.Wait(0.5)
        Debug.Notification(CurrentSelection As String + " : " + CurrentMenu As String)
    EndWhile
    While IsAccessibilityMenuOpen == True
        Game.DisablePlayerControls()
        If Input.IsKeyPressed(47) ;V key
            Game.EnablePlayerControls()
            IsAccessibilityMenuOpen = False
            Utility.Wait(1.0)
        ElseIf Input.IsKeyPressed(17) ;W key
            ScrollCurrentSelectionUp()
        ElseIf Input.IsKeyPressed(30) ;A key
            ScrollCurrentMenuLeft()
        ElseIf Input.IsKeyPressed(31) ;S key
            ScrollCurrentSelectionDown()
        ElseIf Input.IsKeyPressed(32) ;D key
            ScrollCurrentMenuRight()
        ElseIf Input.IsKeyPressed(29) ;Left Ctrl
            CurrentSubMenuDepthUp()
        ElseIf Input.IsKeyPressed(57) ;Spacebar
            Select()
        EndIf
    EndWhile
EndFunction

Function ScrollCurrentMenuRight()
    If CurrentMenu != MenuCount
        CurrentMenu += 1
    Else
        CurrentMenu = 0
    EndIf
EndFunction

Function ScrollCurrentMenuLeft()
    If CurrentMenu > 0
        CurrentMenu -= 1
    Else
        CurrentMenu = MenuCount
    EndIf
EndFunction

Function ScrollCurrentSelectionDown()
    If CurrentSelection != SelectionCount
        CurrentSelection += 1
    Else
        CurrentSelection = 0
    EndIf
EndFunction

Function ScrollCurrentSelectionUp()
    If CurrentSelection > 0
        CurrentSelection -= 1
    Else
        CurrentSelection = SelectionCount
    EndIf
EndFunction

Function CurrentSubMenuDepthUp()
    If CurrentSubMenu > 0
        CurrentSubMenu -= 1
    EndIf
EndFunction

Function CurrentSubMenuDepthDown()
    CurrentSubMenu += 1
EndFunction

Function MenuList()
    MenuList[0] = "Accessibility Menu"
    MenuList[1] = "Travel Menu"
    MenuList[2] = "Utility Menu"
    MenuList[3] = "Settings Menu"
EndFunction

Function Select()
    If CurrentMenu == 0

    ElseIf CurrentMenu == 1

    ElseIf CurrentMenu == 2

    ElseIf CurrentMenu == 3

    EndIf
EndFunction
