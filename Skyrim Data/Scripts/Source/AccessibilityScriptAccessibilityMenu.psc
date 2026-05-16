Scriptname AccessibilityScriptAccessibilityMenu extends ReferenceAlias

Bool IsAccessibilityMenuOpen Auto

Event OnInit()
    Debug.Notification("ASAM Init")
    RegisterForKey(47) ;V key
    RegisterForKey(17) ;W key
    RegisterForKey(30) ;A key
    RegisterForKey(31) ;S key
    RegisterForKey(32) ;D key
    RegisterForKey(29) ;Left Ctrl key
    RegisterForKey(57) ;Spacebar
    IsAccessibilityMenuOpen = False ;Reset Bool
    Debug.Notification("Accessibility menu is ready")
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 47 && !Utility.IsInMenuMode()
        Utility.Wait(0.1)
        IsAccessibilityMenuOpen = True
        Debug.Notification("Accessibility menu is open")
        AccessibilityMenu()
        Debug.Notification("Accessibility menu is closed")
    EndIf
EndEvent

Function AccessibilityMenu()
    While IsAccessibilityMenuOpen == True
        Game.DisablePlayerControls()
        Debug.Notification("Controls disabled")
        Utility.Wait(5.0)
        Game.EnablePlayerControls()
        Debug.Notification("Controls enabled")
        IsAccessibilityMenuOpen = False
    EndWhile
EndFunction

