Scriptname AccessibilityScriptAMBClairvoyance extends ReferenceAlias

Import UIExtensions
Import UIListMenu

Spell Property AccessibilityClairvoyance Auto
Bool Property IsAutoCastEnabled Auto

Event OnInit()
    RegisterForSingleUpdate(5.0)
    RegisterForKey(24)
EndEvent

Event OnUpdate()
    If IsAutoCastEnabled == True
        AccessibilityClairvoyance.Cast(Game.GetPlayer())
    EndIf
    RegisterForSingleUpdate(5.0) 
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 24 && !Utility.IsInMenuMode()
        Utility.Wait(0.1)
        ShowClairvoyanceMenu()
    EndIf
EndEvent

Function ShowClairvoyanceMenu()
    UIListMenu ClairvoyanceMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    String[] SubMenus = new String[2]
    SubMenus[0] = "Enable"
    SubMenus[1] = "Disable"
    Int Index = 0
    While Index < SubMenus.Length
        ClairvoyanceMenu.AddEntryItem(SubMenus[Index])
        Index += 1
    EndWhile
    ClairvoyanceMenu.OpenMenu()
    Int Selection = ClairvoyanceMenu.GetResultInt()
    If Selection == 0
        IsAutoCastEnabled = True
        RegisterForSingleUpdate(5.0)
    ElseIf Selection == 1
        IsAutoCastEnabled = False
        UnregisterForUpdate()
    EndIf
EndFunction
