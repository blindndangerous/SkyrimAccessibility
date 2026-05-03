Scriptname AccessibilityScriptInitialisation extends ReferenceAlias

Import UIExtensions
Import UIListMenu

Static Property AccessibilityReferenceXMarkerHeading Auto
ObjectReference Property AccessibilityReferenceXMarkerHeadingMQ101 Auto

Event OnInit()
    RegisterForKey(38) ;L Key
EndEvent

Event OnPlayerLoadGame()
    Debug.Notification("Accessibility Mod V1 By Dio Kyrie Loaded")
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 38 && !Utility.IsInMenuMode()
        Utility.Wait(0.1)
        ShowInitialisationMenu()
	EndIf
EndEvent

Function ShowInitialisationMenu()
    UIListMenu InitialisationMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    String[] SubMenus = new String[2]
    SubMenus[0] = "Walkthroughs"
    SubMenus[1] = "Debug Menu"
    Int Index = 0
    While Index < SubMenus.Length
        InitialisationMenu.AddEntryItem(SubMenus[Index])
        Index += 1
    EndWhile
    InitialisationMenu.OpenMenu()
    Int Selection = InitialisationMenu.GetResultInt()
    If Selection == 0
        ShowWalkthroughsSubMenu()
    ElseIf Selection == 1
        ShowDebugSubMenu()
    EndIf
EndFunction

Function ShowWalkthroughsSubMenu()
    UIListMenu InitialisationMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    String[] SubMenus = new String[1]
    SubMenus[0] = "Main Quest Start"
    Int Index = 0
    While Index < SubMenus.Length
        InitialisationMenu.AddEntryItem(SubMenus[Index])
        Index += 1
    EndWhile
    InitialisationMenu.OpenMenu()
    Int Selection = InitialisationMenu.GetResultInt()
    If Selection == 0
        MainQuestStart()
    EndIf
EndFunction

Function ShowDebugSubMenu()
    UIListMenu InitialisationMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    String[] SubMenus = new String[1]
    SubMenus[0] = "Debug Info"
    Int Index = 0
    While Index < SubMenus.Length
        InitialisationMenu.AddEntryItem(SubMenus[Index])
        Index += 1
    EndWhile
    InitialisationMenu.OpenMenu()
    Int Selection = InitialisationMenu.GetResultInt()
    If Selection == 0
        DebugInfo()
    EndIf
EndFunction

Function DebugInfo()
    Debug.Notification("Current x position: " + Game.GetPlayer().GetPositionX())
    Debug.Notification("Current y position: " + Game.GetPlayer().GetPositionY())
    Debug.Notification("Current z position: " + Game.GetPlayer().GetPositionZ())
    Utility.Wait(3.0)
    Int ScreenshotKey = Input.GetMappedKey("Screenshot")
    Input.TapKey(ScreenshotKey)
EndFunction

Function MainQuestStart()
    AccessibilityReferenceXMarkerHeadingMQ101 =  Game.GetPlayer().PlaceAtMe(AccessibilityReferenceXMarkerHeading) As ObjectReference
    Utility.Wait(3.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(15018.0, -82548.0, 8247.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(5.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(14768.0, -83012.0, 8297.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(22.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(14442.0, -83341.0, 8681.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(6.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(14786.0, -83521.0, 8894.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(16.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(15025.0, -83126.0, 9071.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(10.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(15831.0, -83710.0, 8712.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(6.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(17363.0, -82853.0, 8378.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(30.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(17927.0, -79966.0, 8251.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(20.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(18580.0, -79945.0, 8415.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(5.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(19482.0, -79063.0, 8448.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(10.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(18850.0, -77850.0, 8453.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(5.0)
    AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(15927.0, -79342.0, 8188.0)
    Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
    Utility.Wait(20.0)

    UIListMenu InitialisationMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    String[] SubMenus = new String[2]
    SubMenus[0] = "Hadvar"
    SubMenus[1] = "Ralof"
    Int Index = 0
    While Index < SubMenus.Length
        InitialisationMenu.AddEntryItem(SubMenus[Index])
        Index += 1
    EndWhile
    InitialisationMenu.OpenMenu()
    Int Selection = InitialisationMenu.GetResultInt()
    If Selection == 0
        AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(14800.0, -79100.0, 8203.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
        Utility.Wait(3.0)
    ElseIf Selection == 1
        AccessibilityReferenceXMarkerHeadingMQ101.SetPosition(15800.0, -77900.0, 8215.0)
        Game.GetPlayer().TranslateToRef(AccessibilityReferenceXMarkerHeadingMQ101, 300)
        Utility.Wait(3.0)
    EndIf
EndFunction
