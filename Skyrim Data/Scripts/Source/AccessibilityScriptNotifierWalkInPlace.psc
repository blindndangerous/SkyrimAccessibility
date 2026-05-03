Scriptname AccessibilityScriptNotifierWalkInPlace extends ReferenceAlias

Static Property AccessibilityXMarkerHeadingWalkInPlace Auto
ObjectReference Property FormerPosition Auto
Sound Property AccessibilityCNDWalkInPlace Auto

Event OnInit()
EndEvent

Event OnPlayerLoadGame()
    RegisterForSingleUpdate(3.0)
EndEvent

Event OnUpdate()
    WalkInPlace()
    RegisterForSingleUpdate(3.0)
EndEvent

Function WalkInPlace()
    FormerPosition = Game.GetPlayer().PlaceAtMe(AccessibilityXMarkerHeadingWalkInPlace) As ObjectReference
    FormerPosition.MoveTo(Game.GetPlayer())
    Utility.Wait(1.0)
    Int ForwardKey = Input.GetMappedKey("Forward")
    Int BackwardKey = Input.GetMappedKey("Back")
    Int LeftwardKey = Input.GetMappedKey("Strafe Left")
    Int RightwardKey = Input.GetMappedKey("Strafe Right")
    If (Input.IsKeyPressed(ForwardKey) || Input.IsKeyPressed(BackwardKey) || Input.IsKeyPressed(LeftwardKey) || Input.IsKeyPressed(RightwardKey))
        If ((FormerPosition.GetDistance(Game.GetPlayer()) < 45) && !Utility.IsInMenuMode())
            AccessibilityCNDWalkInPlace.Play(Game.GetPlayer())
        EndIf
    EndIf
EndFunction
