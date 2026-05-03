Scriptname AccessibilityScriptAMBItem extends ReferenceAlias

;ToDo Sounds, Sounds, and Sounds....
;ToDo Add more Items
;ToDo Add keyword specific sounds later.


Sound Property AccessibilityAMBItemIngestible Auto
Sound Property AccessibilityAMBItemWeapon Auto
Sound Property AccessibilityAMBItemAmmo Auto
Sound Property AccessibilityAMBItemArmor Auto
Sound Property AccessibilityAMBItemBook Auto
Sound Property AccessibilityAMBItemKey Auto
Sound Property AccessibilityAMBItemSoulGem Auto
Sound Property AccessibilityAMBItemIngredient Auto
Sound Property AccessibilityAMBItemScroll Auto
Sound Property AccessibilityAMBItemMisc Auto

Event OnInit()
    RegisterForSingleUpdate(5.0)
EndEvent

Event OnUpdate()
    FindAllIngestible()
    FindAllWeapons()
    FindAllAmmo()
    FindAllArmors()
    FindAllBooks()
    FindAllKeys()
    FindAllSoulGems()
    FindAllIngredients()
    FindAllScrolls()
    FindAllMisc()
    RegisterForSingleUpdate(5.0)
EndEvent

Function FindAllIngestible()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 46, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemIngestible.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllWeapons()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 41, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemWeapon.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllAmmo()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 42, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemAmmo.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllArmors()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 26, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemArmor.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllBooks()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 27, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemBook.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllKeys()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 45, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemKey.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllSoulGems()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 52, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemSoulGem.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllIngredients()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 30, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemIngredient.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllScrolls()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 23, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemScroll.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction

Function FindAllMisc()
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 32, 3000.0)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            AccessibilityAMBItemMisc.Play(Array[Index])
        EndIf
        Index += 1
    EndWhile
EndFunction