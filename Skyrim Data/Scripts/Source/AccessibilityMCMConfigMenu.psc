Scriptname AccessibilityMCMConfigMenu extends SKI_ConfigBase

; Private variables

; Initialisation
Event OnConfigInit()
    Pages = New String[3]
    Pages[0] = "General"
    Pages[1] = "Sound"
    Pages[2] = "Keybinds"
EndEvent

; Events
Event OnPageReset(String Page)
    If Page == ""

    ElseIf Page == "General"

    ElseIf Page == "Sound"
    ElseIf Page == "Keybinds"
    EndIf
EndEvent

