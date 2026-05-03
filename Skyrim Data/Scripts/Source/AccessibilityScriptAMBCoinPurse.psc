Scriptname AccessibilityScriptAMBCoinPurse extends ObjectReference

;ToDo should refactor to AMBFlora and update for player centric logic as in AMBItem

Sound Property AccessibilityAMBCoinPurse Auto

Event OnInit()
    Debug.Notification("Accessibility Ambiance Coin Purse Loaded")
    AccessibilityAMBCoinPurse = Game.GetFormFromFile(0x0604761B, "accessibility.esp") As Sound
EndEvent
;Instead of State I can use If Self.IsHarvested() for flora and trees in OnCellAttach() event
Auto State Active
    Event OnCellAttach()
        RegisterForSingleUpdate(5.0)
    EndEvent

    Event OnCellDetach()
        UnregisterForUpdate()
    EndEvent

    Event OnUpdate()
        AccessibilityAMBCoinPurse.Play(Self)
        RegisterForSingleUpdate(5.0)
    EndEvent


    Event OnActivate(ObjectReference akActionRef)
        UnregisterForUpdate()
        GoToState("Activated")
    EndEvent
EndState

State Activated
    Event OnCellAttach()
        ;Do nothing
    EndEvent
EndState