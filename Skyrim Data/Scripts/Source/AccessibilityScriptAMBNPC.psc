Scriptname AccessibilityScriptAMBNPC extends ReferenceAlias


Sound Property AccessibilityAMBNPCEnemy Auto

Event OnInit()
    RegisterForSingleUpdate(30.0)
EndEvent

Event OnUpdate()
    If IsPlayerReady()
        FindNPCEnemy()
    EndIf
    RegisterForSingleUpdate(2.0)
EndEvent

Bool Function IsPlayerReady()
    Actor PlayerRef = Game.GetPlayer()
    If PlayerRef == None
        Return False
    EndIf
    Cell PlayerCell = PlayerRef.GetParentCell()
    If PlayerCell == None
        Return False
    EndIf
    If !PlayerCell.IsAttached()
        Return False
    EndIf
    If !PlayerRef.Is3DLoaded()
        Return False
    EndIf
    Return True
EndFunction

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
