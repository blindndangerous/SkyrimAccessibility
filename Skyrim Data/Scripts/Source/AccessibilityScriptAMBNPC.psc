Scriptname AccessibilityScriptAMBNPC extends ReferenceAlias


Sound Property AccessibilityAMBNPCEnemy Auto

Event OnInit()
    RegisterForSingleUpdate(2.0)
EndEvent

Event OnUpdate()
    FindNPCEnemy()
    RegisterForSingleUpdate(2.0)
EndEvent

Function FindNPCEnemy()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            If (Array[Index] As Actor).IsHostileToActor(Game.GetPlayer()) == True
                AccessibilityAMBNPCEnemy.Play(Array[Index])
            EndIf
        EndIf
        Index += 1
    EndWhile
EndFunction
