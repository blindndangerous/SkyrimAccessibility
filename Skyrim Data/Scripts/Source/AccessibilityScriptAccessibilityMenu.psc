Scriptname AccessibilityScriptAccessibilityMenu extends ReferenceAlias

Bool IsAccessibilityMenuOpen Auto

String[] MenuList Auto
Int CurrentMenu Auto

String[] SubMenuList Auto
Int CurrentSubMenu Auto

ObjectReference[] EntriesList Auto
Int CurrentEntry Auto


Event OnInit()
    RegisterForKey(47) ;V key
    RegisterForKey(17) ;W key
    RegisterForKey(30) ;A key
    RegisterForKey(31) ;S key
    RegisterForKey(32) ;D key
    RegisterForKey(29) ;Left Ctrl
    RegisterForKey(57) ;Spacebar
    RegisterForKey(20) ;T key
    RegisterForKey(16) ;Q key
    RegisterForKey(18) ;E key
    RegisterForKey(33) ;F key
    RegisterForKey(19) ;R key
    RegisterForKey(44) ;Z key
    RegisterForKey(46) ;C key
    IsAccessibilityMenuOpen = False ;Reset Bool
    CurrentMenu = 0 ;Reset CurrentMenu
    CurrentSubMenu = 0 ;Reset CurrentSubMenu
    CurrentEntry = 0 ;Reset CurrentEntry
    Debug.Notification("Accessibility menu is ready")
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 47 && !Utility.IsInMenuMode() && IsAccessibilityMenuOpen == False ;V key
        MenuListRefresh()
        Utility.Wait(0.1)
        IsAccessibilityMenuOpen = True
        Game.DisablePlayerControls()
        Debug.Notification("Accessibility menu is open")
    ElseIf KeyCode == 47 && IsAccessibilityMenuOpen == True ;V key
        Game.EnablePlayerControls()
        IsAccessibilityMenuOpen = False
        Debug.Notification("Accessibility menu is closed")
    ElseIf KeyCode == 17 && IsAccessibilityMenuOpen == True ;W key
        ScrollCurrentEntryUp()
    ElseIf KeyCode == 30 && IsAccessibilityMenuOpen == True ;A key
        ScrollCurrentSubMenuLeft()
    ElseIf KeyCode == 31 && IsAccessibilityMenuOpen == True ;S key
        ScrollCurrentEntryDown()
    ElseIf KeyCode == 32 && IsAccessibilityMenuOpen == True ;D key
        ScrollCurrentSubMenuRight()
    ElseIf KeyCode == 44 && IsAccessibilityMenuOpen == True ;Z key
        ScrollCurrentMenuLeft()
    ElseIf KeyCode == 46 && IsAccessibilityMenuOpen == True ;C key
        ScrollCurrentMenuRight()
    ElseIf KeyCode == 57 && IsAccessibilityMenuOpen == True ;Spacebar
        Select()
    ElseIf KeyCode == 20 && IsAccessibilityMenuOpen == True ;T key
        Teleport()
    ElseIf KeyCode == 16 && IsAccessibilityMenuOpen == True ;Q key
        PlaceSoundMark()
    ElseIf KeyCode == 18 && IsAccessibilityMenuOpen == True ;E key
        WalkTo()
    ElseIf KeyCode == 33 && IsAccessibilityMenuOpen == True ;F key
        Follow()
    ElseIf KeyCode == 19 && IsAccessibilityMenuOpen == True ;R key
        LockCameraOn()
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

Function ScrollCurrentEntryDown()
    If CurrentEntry < EntriesList.Length - 1
        CurrentEntry += 1
    Else
        CurrentEntry = 0
    EndIf
    CurrentEntryName()
EndFunction

Function ScrollCurrentEntryUp()
    If CurrentEntry > 0
        CurrentEntry -= 1
    Else
        CurrentEntry = EntriesList.Length - 1
    EndIf
    CurrentEntryName()
EndFunction

Function ScrollCurrentSubMenuLeft()
    If CurrentSubMenu > 0
        CurrentSubMenu -= 1
    Else
        CurrentSubMenu = SubMenuList.Length - 1
    EndIf
    CurrentMenuName()
EndFunction

Function ScrollCurrentSubMenuRight()
    If CurrentSubMenu < SubMenuList.Length - 1
        CurrentSubMenu += 1
    Else
        CurrentSubMenu = 0
    EndIf
    CurrentMenuName()
EndFunction

Function MenuListRefresh()
    MenuList = New String[4]
    MenuList[0] = "Accessibility Menu"
    MenuList[1] = "Travel Menu"
    MenuList[2] = "Utility Menu"
    MenuList[3] = "Settings Menu"
EndFunction

Function SubMenuListRefresh()
    If CurrentMenu == 0
        SubMenuList = New String[1]
        SubMenuList[0] = "0 menu"
    ElseIf CurrentMenu == 1
        SubMenuList = New String[2]
        SubMenuList[0] = "Abc"
        SubMenuList[1] = "Cba"
    ElseIf CurrentMenu == 2
        SubMenuList = New String[1]
        SubMenuList[0] = "2 menu"
    ElseIf CurrentMenu == 3
        SubMenuList = New String[1]
        SubMenuList[0] = "3 menu"
    EndIf
EndFunction

Function EntriesListRefresh()
    ObjectReference[] TotalNPCArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 700.0)

    If CurrentMenu == 1 && CurrentSubMenu == 1
        EntriesList = TotalNPCArray
    EndIf
EndFunction

Function CurrentMenuName()
    SubMenuListRefresh()
    Debug.Notification(SubMenuList[CurrentSubMenu] + " : " + MenuList[CurrentMenu])
EndFunction

Function CurrentEntryName()
    EntriesListRefresh()
    String Name = EntriesList[CurrentEntry].GetDisplayName()
    String OutOf = CurrentEntry As String + "/" + (EntriesList.Length - 1) As String
    String Distance = ((Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) / 70) + " Meters"
    String Units = (Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) + " Units"
    Debug.Notification(Name + " " + OutOf + " " + Distance + " " + Units)
EndFunction












Function Select()

EndFunction

Function Teleport()

EndFunction

Function PlaceSoundMark() ;60 Seconds of sound mark. Only one can exist.

EndFunction

Function WalkTo() ;Stop when Near or WASD key pressed

EndFunction

Function Follow() ;Stop only when wasd key pressed

EndFunction

Function LockCameraOn() ;30 Seconds of Camera Lock On

EndFunction
