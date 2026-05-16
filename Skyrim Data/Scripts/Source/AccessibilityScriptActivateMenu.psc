Scriptname AccessibilityScriptActivateMenu extends ReferenceAlias

;ToDo Real time no pause?
;ToDo Focused target. Will spam message about distance and status to object.c++
;ToDo Realtime update of array. c++
;ToDo Add quest objectives menu c++

;ToDo Add sound for when not enough lockpicks Papyrus
;ToDo Change the lockpick ammount need and exp gain dynamicaly based on lock level instead of hardcoding every time. c++

Import UIExtensions
Import UIListMenu

Sound Property AccessibilityCNDLockPickFail Auto
Sound Property AccessibilityCNDLockPickSuccess Auto

MiscObject Property Lockpick Auto
MiscObject Property SkeletonKey Auto

Event OnInit()
    Debug.Notification("Accessibility Activate Menu Loaded")
    ;RegisterForKey(47) ;V key
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 47 && !Utility.IsInMenuMode()
        Utility.Wait(0.1)
        ShowActivateMenu()
	EndIf
EndEvent

Function ShowActivateMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] ContainersArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 700.0)
    ObjectReference[] DoorsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 700.0)
    ObjectReference[] TotalNPCArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 700.0)
    ObjectReference[] AliveNPCArray = new ObjectReference[128]
    ObjectReference[] DeadNPCArray = new ObjectReference[128]
    If TotalNPCArray.Length > 0
        Int TotalNPCIndex = 0
        Int AliveNPCIndex = 0
        Int DeadNPCIndex = 0
        While TotalNPCIndex < TotalNPCArray.Length
            Actor CurrentNPC = TotalNPCArray[TotalNPCIndex] As Actor
            If !CurrentNPC.IsDead() && (AliveNPCIndex < AliveNPCArray.Length) && (CurrentNPC != Game.GetPlayer())
                AliveNPCArray[AliveNPCIndex] = TotalNPCArray[TotalNPCIndex]
                AliveNPCIndex += 1
            ElseIf CurrentNPC.IsDead() && (DeadNPCIndex < DeadNPCArray.Length)
                DeadNPCArray[DeadNPCIndex] = TotalNPCArray[TotalNPCIndex]
                DeadNPCIndex += 1
            EndIf
            TotalNPCIndex += 1
        EndWhile
    EndIf
    String[] SubMenus = new String[6]
    SubMenus[0] = "Take Item"
    SubMenus[1] = CheckEmptySubMenu(ContainersArray, "Loot Containers")
    SubMenus[2] = CheckEmptySubMenu(DeadNPCArray, "Loot NPC")
    SubMenus[3] = CheckEmptySubMenu(AliveNPCArray, "Talk to/Pickpocket NPC")
    SubMenus[4] = CheckEmptySubMenu(DoorsArray, "Open/Close Door")
    SubMenus[5] = "Activators"
    Int Index = 0
    While Index < SubMenus.Length
        ActivateMenu.AddEntryItem(SubMenus[Index])
        Index += 1
    EndWhile
    ActivateMenu.OpenMenu()
    Int Selection = ActivateMenu.GetResultInt()
    If Selection == 0
        ShowTakeItemSubMenu()
    ElseIf Selection == 1
        ShowLootContainersSubMenu()
    ElseIf Selection == 2
        ShowLootNPCSubMenu()
    ElseIf Selection == 3
        ShowTalkToNPCSubMenu()
    ElseIf Selection == 4
        ShowOpenCloseDoorSubMenu()
    ElseIf Selection == 5
        ShowActivatorsSubMenu()
    EndIf
EndFunction

Function ShowLockpickMenu()
    UIListMenu ShowLockpickMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    String[] LockpickMode = new String[2]
    LockpickMode[0] = "Manual Lockpick"
    LockpickMode[1] = "Attempt Autolockpick"
    Int Index = 0
    While Index < LockpickMode.Length
        ShowLockpickMenu.AddEntryItem(LockpickMode[Index])
        Index += 1
    EndWhile
    ShowLockpickMenu.OpenMenu()
EndFunction

String Function CheckEmptySubMenu(ObjectReference[] TargetArray, string BaseName) ;Should I move this above?
    If TargetArray.Length > 0
        If TargetArray.Length == 128
            Int Index = 0
            Int EmptyIndex = 0
            While Index < TargetArray.Length
                If TargetArray[Index] == None
                    EmptyIndex += 1
                EndIf
                Index += 1
            EndWhile
            If EmptyIndex == 128
                Return BaseName + " (Empty)"
            Else
                Return BaseName
            EndIf
        Else
            Return BaseName
        EndIf
    Else
        Return BaseName + " (Empty)"
    EndIf
EndFunction

Function ShowTakeItemSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] IngestiblesArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 46, 700.0)
    ObjectReference[] WeaponsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 41, 700.0)
    ObjectReference[] AmmoArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 42, 700.0)
    ObjectReference[] ArmorsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 26, 700.0)
    ObjectReference[] BooksArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 27, 700.0)
    ObjectReference[] KeysArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 45, 700.0)
    ObjectReference[] SoulGemsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 52, 700.0)
    ObjectReference[] IngredientsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 30, 700.0)
    ObjectReference[] ScrollsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 23, 700.0)
    ObjectReference[] MiscArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 32, 700.0)
    String[] SubMenus = new String[10]
    SubMenus[0] = CheckEmptySubMenu(IngestiblesArray, "Ingestibles")
    SubMenus[1] = CheckEmptySubMenu(WeaponsArray, "Weapons")
    SubMenus[2] = CheckEmptySubMenu(AmmoArray, "Ammo")
    SubMenus[3] = CheckEmptySubMenu(ArmorsArray, "Armors")
    SubMenus[4] = CheckEmptySubMenu(BooksArray, "Books")
    SubMenus[5] = CheckEmptySubMenu(KeysArray, "Keys")
    SubMenus[6] = CheckEmptySubMenu(SoulGemsArray, "Soul Gems")
    SubMenus[7] = CheckEmptySubMenu(IngredientsArray, "Ingredients")
    SubMenus[8] = CheckEmptySubMenu(ScrollsArray, "Scrolls")
    SubMenus[9] = CheckEmptySubMenu(MiscArray, "Misc")
    Int Index = 0
    While Index < SubMenus.Length
        ActivateMenu.AddEntryItem(SubMenus[Index])
        Index += 1
    EndWhile
    ActivateMenu.OpenMenu()
    Int Selection = ActivateMenu.GetResultInt()
    If (Selection == 0) && (IngestiblesArray.Length > 0)
        ShowTakeItemIngestiblesSubMenu()
    ElseIf (Selection == 1) && (WeaponsArray.Length > 0)
        ShowTakeItemWeaponsSubMenu()
    ElseIf (Selection == 2) && (AmmoArray.Length > 0)
        ShowTakeItemAmmoSubMenu()
    ElseIf (Selection == 3) && (ArmorsArray.Length > 0)
        ShowTakeItemArmorsSubMenu()
    ElseIf (Selection == 4) && (BooksArray.Length > 0)
        ShowTakeItemBooksSubMenu()
    ElseIf (Selection == 5) && (KeysArray.Length > 0)
        ShowTakeItemKeysSubMenu()
    ElseIf (Selection == 6) && (SoulGemsArray.Length > 0)
        ShowTakeItemSoulGemsSubMenu()
    ElseIf (Selection == 7) && (IngredientsArray.Length > 0)
        ShowTakeItemIngredientsSubMenu()
    ElseIf (Selection == 8) && (ScrollsArray.Length > 0)
        ShowTakeItemScrollsSubMenu()
    ElseIf (Selection == 9) && (MiscArray.Length > 0)
        ShowTakeItemMiscSubMenu()
    EndIf
EndFunction


Function ShowTakeItemIngestiblesSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 46, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemIngestiblesSubMenu()
    EndIf
EndFunction

Function ShowTakeItemWeaponsSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 41, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemWeaponsSubMenu()
    EndIf
EndFunction

Function ShowTakeItemAmmoSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 42, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemAmmoSubMenu()
    EndIf
EndFunction

Function ShowTakeItemArmorsSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 26, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemArmorsSubMenu()
    EndIf
EndFunction

Function ShowTakeItemBooksSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 27, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemBooksSubMenu()
    EndIf
EndFunction

Function ShowTakeItemKeysSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 45, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemKeysSubMenu()
    EndIf
EndFunction

Function ShowTakeItemSoulGemsSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 52, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemSoulGemsSubMenu()
    EndIf
EndFunction

Function ShowTakeItemIngredientsSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 30, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemIngredientsSubMenu()
    EndIf
EndFunction

Function ShowTakeItemScrollsSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 23, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemScrollsSubMenu()
    EndIf
EndFunction

Function ShowTakeItemMiscSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 32, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsOffLimits()
                Name = "(Steal) " + Name
            EndIf
            ActivateMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
    EndIf
    If Array.Length > 0
        ActivateMenu.OpenMenu()
    EndIf
    Int Selection = ActivateMenu.GetResultInt()
    If Selection >= 0
        Array[Selection].Activate(Game.GetPlayer())
        ShowTakeItemMiscSubMenu()
    EndIf
EndFunction

Function ShowLootContainersSubMenu()
    UIListMenu ShowLootContainersSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    UIListMenu ShowLockpickMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].GetNumItems() == 0
                Name = "(Empty) " + Name
            EndIf
            If Array[Index].IsLocked() == 1
                If Array[Index].GetLockLevel() < 255
                    Name = "(Locked) " + Name
                ElseIf Array[Index].GetLockLevel() == 255
                    Name = "(Key Required) " + Name
                EndIf
            EndIf
            ShowLootContainersSubMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
        If Array.Length > 0
            ShowLootContainersSubMenu.OpenMenu()
        EndIf
        Int Selection = ShowLootContainersSubMenu.GetResultInt()
        If (Selection >= 0 && Array[Selection].IsLocked() == 0)
            Array[Selection].Activate(Game.GetPlayer())
        ElseIf (Selection >= 0 && Array[Selection].IsLocked() == 1 && Array[Selection].GetLockLevel() < 255)
            ShowLockpickMenu()
            Int SelectionLockpickMode = ShowLockpickMenu.GetResultInt()
            If SelectionLockpickMode == 0
                Array[Selection].Activate(Game.GetPlayer())
            ElseIf SelectionLockpickMode == 1
                If (Game.GetPlayer().GetItemCount(SkeletonKey) >= 1)
                    (Array[Selection].Lock(false))
                    (AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer()))
                Else
                    If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                        If (Utility.RandomInt(0, 3) == 0)
                            (Array[Selection].Lock(false))
                            (AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer()))
                            (Game.GetPlayer().RemoveItem(Lockpick, 1))
                            (Game.AdvanceSkill("Lockpicking", 2.0))
                        Else
                            (Game.GetPlayer().RemoveItem(Lockpick, 1))
                            (Game.AdvanceSkill("Lockpicking", 1.0))
                            (AccessibilityCNDLockPickFail.Play(Game.GetPlayer()))

                        EndIf
                    Else
                        Debug.Notification("Not enough Lockpicks")
                    EndIf
                EndIf
            EndIf
        ElseIf (Selection >= 0 && Array[Selection].IsLocked() == 1 && Array[Selection].GetLockLevel() == 255)
            Array[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowOpenCloseDoorSubMenu()
    UIListMenu ShowOpenCloseDoorSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    UIListMenu ShowLockpickMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
            If Array[Index].IsLocked() == 1
                If Array[Index].GetLockLevel() < 255
                    Name = "(Locked) " + Name
                ElseIf Array[Index].GetLockLevel() == 255
                    Name = "(Key Required) " + Name
                EndIf
            EndIf
            ShowOpenCloseDoorSubMenu.AddEntryItem(Name)
            Index += 1
        EndWhile
        If Array.Length > 0
            ShowOpenCloseDoorSubMenu.OpenMenu()
        EndIf
        Int Selection = ShowOpenCloseDoorSubMenu.GetResultInt()
        If (Selection >= 0 && Array[Selection].IsLocked() == 0)
            Array[Selection].Activate(Game.GetPlayer())
        ElseIf (Selection >= 0 && Array[Selection].IsLocked() == 1 && Array[Selection].GetLockLevel() < 255)
            ShowLockpickMenu()
            Int SelectionLockpickMode = ShowLockpickMenu.GetResultInt()
            If SelectionLockpickMode == 0
                Array[Selection].Activate(Game.GetPlayer())
            ElseIf SelectionLockpickMode == 1
                If (Game.GetPlayer().GetItemCount(SkeletonKey) >= 1)
                    (Array[Selection].Lock(false))
                    (AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer()))
                Else
                    If (Game.GetPlayer().GetItemCount(Lockpick) >= 1)
                        If (Utility.RandomInt(0, 3) == 0)
                            (Array[Selection].Lock(false))
                            (AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer()))
                            (Game.GetPlayer().RemoveItem(Lockpick, 1))
                            (Game.AdvanceSkill("Lockpicking", 2.0))
                        Else
                            (Game.GetPlayer().RemoveItem(Lockpick, 1))
                            (Game.AdvanceSkill("Lockpicking", 1.0))
                            (AccessibilityCNDLockPickFail.Play(Game.GetPlayer()))
                        EndIf
                    Else
                        Debug.Notification("Not enough Lockpicks")
                    EndIf
                EndIf
            EndIf
        ElseIf (Selection >= 0 && Array[Selection].IsLocked() == 1 && Array[Selection].GetLockLevel() == 255)
            Array[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowLootNPCSubMenu()
    UIListMenu ShowLootNPCSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] TotalNPCArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 700.0)
    If TotalNPCArray.Length > 0
        Int TotalNPCIndex = 0
        Int DeadNPCIndex = 0
        ObjectReference[] DeadNPCArray = new ObjectReference[128]
        While TotalNPCIndex < TotalNPCArray.Length
            Actor CurrentNPC = TotalNPCArray[TotalNPCIndex] As Actor
            If CurrentNPC.IsDead() && (DeadNPCIndex < DeadNPCArray.Length)
                DeadNPCArray[DeadNPCIndex] = TotalNPCArray[TotalNPCIndex]
                DeadNPCIndex += 1
            EndIf
            TotalNPCIndex += 1
        EndWhile
        Int MenuEntryIndex = 0
        While MenuEntryIndex < DeadNPCIndex
            String Name = (DeadNPCArray[MenuEntryIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(DeadNPCArray[MenuEntryIndex]) As Int)) 
            If DeadNPCArray[MenuEntryIndex].GetNumItems() == 0
                Name = "(Empty) " + Name
            EndIf
            ShowLootNPCSubMenu.AddEntryItem(Name)
            MenuEntryIndex += 1
        EndWhile
        If MenuEntryIndex > 0
            ShowLootNPCSubMenu.OpenMenu()
        EndIf
        Int Selection = ShowLootNPCSubMenu.GetResultInt()
        If Selection >= 0
            DeadNPCArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowTalkToNPCSubMenu()
    UIListMenu ShowTalkToNPCSubMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] TotalNPCArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 700.0)
    If TotalNPCArray.Length > 0
        Int TotalNPCIndex = 0
        Int AliveNPCIndex = 0
        ObjectReference[] AliveNPCArray = new ObjectReference[128]
        While TotalNPCIndex < TotalNPCArray.Length
            Actor CurrentNPC = TotalNPCArray[TotalNPCIndex] As Actor
            If !CurrentNPC.IsDead() && (AliveNPCIndex < AliveNPCArray.Length) && (CurrentNPC != Game.GetPlayer())
                AliveNPCArray[AliveNPCIndex] = TotalNPCArray[TotalNPCIndex]
                AliveNPCIndex += 1
            EndIf
            TotalNPCIndex += 1
        EndWhile
        Int MenuEntryIndex = 0
        While MenuEntryIndex < AliveNPCIndex
            String Name = (AliveNPCArray[MenuEntryIndex].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(AliveNPCArray[MenuEntryIndex]) As Int))
            Actor CurrentNPC = AliveNPCArray[MenuEntryIndex] As Actor
            If CurrentNPC.IsHostileToActor(Game.GetPlayer())
                Name = "(Hostile) " + Name
            EndIf
            If (Game.GetPlayer().GetCombatState() == 0) && (Game.GetPlayer().IsSneaking())
                Name = "(Pickpocket) " + Name
            EndIf
            ShowTalkToNPCSubMenu.AddEntryItem(Name)
            MenuEntryIndex += 1
        EndWhile
        If MenuEntryIndex > 0
            ShowTalkToNPCSubMenu.OpenMenu()
        EndIf
        Int Selection = ShowTalkToNPCSubMenu.GetResultInt()
        If Selection >= 0
            AliveNPCArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowActivatorsSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] TreesArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 38, 700.0)
    ObjectReference[] FloraArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 39, 700.0)
    ObjectReference[] FurnitureArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 40, 700.0)
    ObjectReference[] MiscArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 24, 700.0)
    ObjectReference[] TalkingArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 25, 700.0)
    String[] SubMenus = new String[5]
    SubMenus[0] = CheckEmptySubMenu(FurnitureArray, "Furniture")
    SubMenus[1] = CheckEmptySubMenu(FloraArray, "Flora")
    SubMenus[2] = CheckEmptySubMenu(TreesArray, "Trees")
    SubMenus[3] = CheckEmptySubMenu(MiscArray, "Misc")
    SubMenus[4] = CheckEmptySubMenu(TalkingArray, "Talking")
    Int Index = 0
    While Index < SubMenus.Length
        ActivateMenu.AddEntryItem(SubMenus[Index])
        Index += 1
    EndWhile
    ActivateMenu.OpenMenu()
    Int Selection = ActivateMenu.GetResultInt()
    If Selection == 0
        ShowActivatorsFurnitureSubMenu()
    ElseIf Selection == 1
        ShowActivatorsFloraSubMenu()
    ElseIf Selection == 2
        ShowActivatorsTreesSubMenu()
    ElseIf Selection == 3
        ShowActivatorsMiscSubMenu()
    ElseIf Selection == 4
        ShowActivatorsTalkingSubMenu()
    EndIf
EndFunction

Function ShowActivatorsTreesSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 38, 700.0)
    If Array.Length > 0
        Int Index = 0
        Int MenuEntryIndex = 0
        ObjectReference[] MenuEntryArray = new ObjectReference[128]
        While Index < Array.Length
            If (!Array[Index].GetDisplayName() == "") && (!Array[Index].IsHarvested())
                String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
                ActivateMenu.AddEntryItem(Name)
                MenuEntryArray[MenuEntryIndex] = Array[Index]
                MenuEntryIndex += 1
            EndIf
            Index += 1
        EndWhile
        If MenuEntryArray.Length > 0
            ActivateMenu.OpenMenu()
        EndIf
        Int Selection = ActivateMenu.GetResultInt()
        If Selection >= 0
            MenuEntryArray[Selection].Activate(Game.GetPlayer())
            ShowActivatorsTreesSubMenu()
        EndIf
    EndIf
EndFunction

Function ShowActivatorsFloraSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 39, 700.0)
    If Array.Length > 0
        Int Index = 0
        Int MenuEntryIndex = 0
        ObjectReference[] MenuEntryArray = new ObjectReference[128]
        While Index < Array.Length
            If !Array[Index].IsHarvested()
                String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
                ActivateMenu.AddEntryItem(Name)
                MenuEntryArray[MenuEntryIndex] = Array[Index]
                MenuEntryIndex += 1
            EndIf
            Index += 1
        EndWhile
        If MenuEntryArray.Length > 0
            ActivateMenu.OpenMenu()
        EndIf
        Int Selection = ActivateMenu.GetResultInt()
        If Selection >= 0
            MenuEntryArray[Selection].Activate(Game.GetPlayer())
            ShowActivatorsFloraSubMenu()
        EndIf
    EndIf
EndFunction

Function ShowActivatorsFurnitureSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 40, 700.0)
    If Array.Length > 0
        Int Index = 0
        Int MenuEntryIndex = 0
        ObjectReference[] MenuEntryArray = new ObjectReference[128]
        While Index < Array.Length
            If (!Array[Index].GetDisplayName() == "")
                String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
                ActivateMenu.AddEntryItem(Name)
                MenuEntryArray[MenuEntryIndex] = Array[Index]
                MenuEntryIndex += 1
            EndIf
            Index += 1
        EndWhile
        If MenuEntryArray.Length > 0
            ActivateMenu.OpenMenu()
        EndIf
        Int Selection = ActivateMenu.GetResultInt()
        If Selection >= 0
            MenuEntryArray[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowActivatorsMiscSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 24, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            If Array[Index].GetDisplayName() == ""
                String Name = (PO3_SKSEFunctions.GetFormEditorID(Array[Index].GetBaseObject()) + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
                ActivateMenu.AddEntryItem(Name)
            Else
                String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
                ActivateMenu.AddEntryItem(Name)
            EndIf
            Index += 1
        EndWhile
        If Array.Length > 0
            ActivateMenu.OpenMenu()
        EndIf
        Int Selection = ActivateMenu.GetResultInt()
        If Selection >= 0
            Array[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

Function ShowActivatorsTalkingSubMenu()
    UIListMenu ActivateMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    ObjectReference[] Array = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 25, 700.0)
    If Array.Length > 0
        Int Index = 0
        While Index < Array.Length
            If Array[Index].GetDisplayName() == ""
                String Name = (PO3_SKSEFunctions.GetFormEditorID(Array[Index].GetBaseObject()) + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
                ActivateMenu.AddEntryItem(Name)
            Else
                String Name = (Array[Index].GetDisplayName() + " " + (Game.GetPlayer().GetDistance(Array[Index]) As Int))
                ActivateMenu.AddEntryItem(Name)
            EndIf
            Index += 1
        EndWhile
        If Array.Length > 0
            ActivateMenu.OpenMenu()
        EndIf
        Int Selection = ActivateMenu.GetResultInt()
        If Selection >= 0
            Array[Selection].Activate(Game.GetPlayer())
        EndIf
    EndIf
EndFunction

