Scriptname AccessibilityScriptAMBFurniture extends ReferenceAlias

;ToDo Add levers and chains

Sound Property AccessibilityAMBFurnitureContainer Auto
Sound Property AccessibilityAMBFurnitureDoor Auto


Event OnInit()
    RegisterForSingleUpdate(10.0)
EndEvent

Event OnUpdate()
    If IsPlayerReady()
        FindAllContainers()
        FindAllDoors()
    EndIf
    RegisterForSingleUpdate(5.0)
EndEvent

Bool Function IsPlayerReady()
    Actor PlayerRef = Game.GetPlayer()
    If PlayerRef == None
        Return False
    EndIf
    If PlayerRef.GetParentCell() == None
        Return False
    EndIf
    If !PlayerRef.Is3DLoaded()
        Return False
    EndIf
    Return True
EndFunction

Function FindAllContainers()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBFurnitureContainer.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllDoors()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBFurnitureDoor.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction
