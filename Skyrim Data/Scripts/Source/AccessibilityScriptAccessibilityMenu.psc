Scriptname AccessibilityScriptAccessibilityMenu extends ReferenceAlias

Bool IsAccessibilityMenuOpen Auto

ObjectReference SelectedEntry Auto

String[] MenuList Auto
Int CurrentMenu Auto

String[] SubMenuList Auto
Int CurrentSubMenu Auto

ObjectReference[] EntriesList Auto
Int CurrentEntry Auto
String CurrentEntryName Auto

Bool AutoLockPick Auto ;Add to MCM

Int SingleUpdateInterval Auto

Sound Property AccessibilityCNDLockPickFail Auto ;Add to esp
Sound Property AccessibilityCNDLockPickSuccess Auto ;Add to esp
Sound Property AccessibilityCNDNoLockPicks Auto ;Add to esp
Sound Property AccessibilityCNDWalkInPlace Auto ;Add to esp

Sound Property AccessibilityAMBContainerUnlocked Auto ;Add to esp
Sound Property AccessibilityAMBContainerLocked Auto ;Add to esp
Sound Property AccessibilityAMBNPCNeutral Auto ;Add to esp
Sound Property AccessibilityAMBNPCEnemy Auto ;Add to esp
Sound Property AccessibilityAMBLootNPC Auto ;Add to esp
Sound Property AccessibilityAMBDoorUnlocked Auto ;Add to esp
Sound Property AccessibilityAMBDoorLocked Auto ;Add to esp
Sound Property AccessibilityAMBIngestible Auto ;Add to esp
Sound Property AccessibilityAMBWeapon Auto ;Add to esp
Sound Property AccessibilityAMBAmmo Auto ;Add to esp
Sound Property AccessibilityAMBArmor Auto ;Add to esp
Sound Property AccessibilityAMBBook Auto ;Add to esp
Sound Property AccessibilityAMBKey Auto ;Add to esp
Sound Property AccessibilityAMBSoulGem Auto ;Add to esp
Sound Property AccessibilityAMBIngredient Auto ;Add to esp
Sound Property AccessibilityAMBScroll Auto ;Add to esp
Sound Property AccessibilityAMBMiscItem Auto ;Add to esp
Sound Property AccessibilityAMBFurniture Auto ;Add to esp
Sound Property AccessibilityAMBNatureUnharvested Auto ;Add to esp
Sound Property AccessibilityAMBNatureHarvested Auto ;Add to esp
Sound Property AccessibilityAMBMiscActivator Auto ;Add to esp
Sound Property AccessibilityAMBSelectedEntryMark Auto ;Add to esp

MiscObject Property Lockpick Auto ;Add to esp
MiscObject Property SkeletonKey Auto ;Add to esp


ObjectReference[] MapMarkers Auto
ObjectReference[] MiscArray Auto
ObjectReference[] TownArray Auto
ObjectReference[] SettlementArray Auto
ObjectReference[] CaveArray Auto
ObjectReference[] CampArray Auto
ObjectReference[] FortArray Auto
ObjectReference[] NordicRuinsArray Auto
ObjectReference[] DwemerRuinArray Auto
ObjectReference[] ShipwreckArray Auto
ObjectReference[] GroveArray Auto
ObjectReference[] LandmarkArray Auto
ObjectReference[] DragonLairArray Auto
ObjectReference[] FarmArray Auto
ObjectReference[] WoodMillArray Auto
ObjectReference[] MineArray Auto
ObjectReference[] ImperialCampArray Auto
ObjectReference[] StormcloakCampArray Auto
ObjectReference[] DoomstoneArray Auto
ObjectReference[] WheatMillArray Auto
ObjectReference[] StableArray Auto
ObjectReference[] ImperialTowerArray Auto
ObjectReference[] ClearingArray Auto
ObjectReference[] PassArray Auto
ObjectReference[] LighthouseArray Auto
ObjectReference[] OrcStrongholdArray Auto
ObjectReference[] GiantCampArray Auto
ObjectReference[] ShackArray Auto
ObjectReference[] NordicTowerArray Auto
ObjectReference[] NordicDwellingArray Auto
ObjectReference[] DocksArray Auto
ObjectReference[] ShrineArray Auto
ObjectReference[] CastleArray Auto
ObjectReference[] CapitolArray Auto
ObjectReference[] DLC02Array Auto


ObjectReference[] ContainersArray Auto
ObjectReference[] TotalNPCArray Auto
ObjectReference[] LootNPCArray Auto
ObjectReference[] AliveNPCArray Auto
ObjectReference[] DoorsArray Auto
ObjectReference[] IngestiblesArray Auto
ObjectReference[] WeaponArray Auto
ObjectReference[] AmmoArray Auto
ObjectReference[] ArmorArray Auto
ObjectReference[] BooksArray Auto
ObjectReference[] KeysArray Auto
ObjectReference[] SoulGemsArray Auto
ObjectReference[] IngredientsArray Auto
ObjectReference[] ScrollsArray Auto
ObjectReference[] MiscItemsArray Auto
ObjectReference[] FurnitureArray Auto
ObjectReference[] FloraArray Auto
ObjectReference[] TreesArray Auto
ObjectReference[] NatureArray Auto
ObjectReference[] HalfMiscActivatorsArray Auto
ObjectReference[] TalkingActivatorsArray Auto
ObjectReference[] MiscActivatorsArray Auto



Event OnInit()
    RegisterForKey(47) ;V key
    RegisterForKey(17) ;W key
    RegisterForKey(30) ;A key
    RegisterForKey(31) ;S key
    RegisterForKey(32) ;D key
    RegisterForKey(57) ;Spacebar
    RegisterForKey(29) ;Left Ctrl
    RegisterForKey(16) ;Q key
    RegisterForKey(18) ;E key
    RegisterForKey(33) ;F key
    RegisterForKey(19) ;R key
    RegisterForKey(44) ;Z key
    RegisterForKey(46) ;C key
    RegisterForKey(24) ;O key
    RegisterForKey(38) ;L key
    RegisterForKey(34) ;G key
    RegisterForKey(42) ;Left Shift
    IsAccessibilityMenuOpen = False ;Reset IsAccessibilityMenuOpen
    CurrentMenu = 0 ;Reset CurrentMenu
    CurrentSubMenu = 0 ;Reset CurrentSubMenu
    CurrentEntry = 0 ;Reset CurrentEntry
    SingleUpdateInterval = 5 ;Reset SingleUpdateInterval
    SelectedEntry = None ;Reset SelectedEntry
    AutoLockPick = True ;This should be deleted from here after moving it to MCM.
    SortMapMarkers()
    AmbientSound()
    RegisterForSingleUpdate(SingleUpdateInterval)
    Utility.Wait(5.0)
    DisplayMenuText("Accessibility Menu Ready")
EndEvent

Event OnUpdate()
    AmbientSound()
    SelectedEntryMark()
    RegisterForSingleUpdate(SingleUpdateInterval)
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 47 && !Utility.IsInMenuMode() && IsAccessibilityMenuOpen == False ;V key
        DisplayMenuText("Accessibility Menu Open")
        Utility.Wait(2.0)
        MenuListRefresh()
        CurrentMenuName()
        SortActivators()
        IsAccessibilityMenuOpen = True
        Game.DisablePlayerControls()
    ElseIf KeyCode == 47 && IsAccessibilityMenuOpen == True ;V key
        Game.EnablePlayerControls()
        IsAccessibilityMenuOpen = False
        DisplayMenuText("Accessibility Menu Closed")
    ElseIf KeyCode == 17 && IsAccessibilityMenuOpen == True ;W key
        ScrollCurrentEntryUp()
    ElseIf KeyCode == 30 && IsAccessibilityMenuOpen == True ;A key
        ScrollCurrentSubMenuLeft()
    ElseIf KeyCode == 31 && IsAccessibilityMenuOpen == True ;S key
        ScrollCurrentEntryDown()
    ElseIf KeyCode == 32 && IsAccessibilityMenuOpen == True ;D key
        ScrollCurrentSubMenuRight()
    ElseIf KeyCode == 44 && IsAccessibilityMenuOpen == True ;Z key
        ScrollCurrentMenuLeft()
    ElseIf KeyCode == 46 && IsAccessibilityMenuOpen == True ;C key
        ScrollCurrentMenuRight()
    ElseIf KeyCode == 57 && IsAccessibilityMenuOpen == True ;Spacebar
        Select()
    ElseIf KeyCode == 29 && IsAccessibilityMenuOpen == True ;Left Ctrl
        Teleport()
    ElseIf KeyCode == 16 && IsAccessibilityMenuOpen == True ;Q key
        ;Vacant
    ElseIf KeyCode == 18 && IsAccessibilityMenuOpen == True ;E key
        WalkTo()
    ElseIf KeyCode == 33 && IsAccessibilityMenuOpen == True ;F key
        Follow()
    ElseIf KeyCode == 19 && IsAccessibilityMenuOpen == True ;R key
        LockCameraOn()
    ElseIf KeyCode == 24 ;O key
        SelectEntry()
    ElseIf KeyCode == 42 ;Left Shift
        ;Vacant
    ElseIf KeyCode == 38 ;L key
        ReturnToNavMesh()
    ElseIf KeyCode == 34 ;G key
        PlayerStatus()
    EndIf
EndEvent

Function ScrollCurrentMenuRight()
    If CurrentMenu < MenuList.Length - 1
        CurrentMenu += 1
    Else
        CurrentMenu = 0
    EndIf
    CurrentMenuName()
    CurrentEntry = 0 ;Reset CurrentEntry
EndFunction

Function ScrollCurrentMenuLeft()
    If CurrentMenu > 0
        CurrentMenu -= 1
    Else
        CurrentMenu = MenuList.Length - 1
    EndIf
    CurrentMenuName()
    CurrentEntry = 0 ;Reset CurrentEntry
EndFunction

Function ScrollCurrentEntryDown()
    If CurrentEntry < EntriesList.Length - 1
        CurrentEntry += 1
    Else
        CurrentEntry = 0
    EndIf
    CurrentEntryNameShow()
    EntriesListRefresh()
EndFunction

Function ScrollCurrentEntryUp()
    If CurrentEntry > 0
        CurrentEntry -= 1
    Else
        CurrentEntry = EntriesList.Length - 1
    EndIf
    CurrentEntryNameShow()
    EntriesListRefresh()
EndFunction

Function ScrollCurrentSubMenuLeft()
    If CurrentSubMenu > 0
        CurrentSubMenu -= 1
    Else
        CurrentSubMenu = SubMenuList.Length - 1
    EndIf
    CurrentMenuName()
    CurrentEntry = 0 ;Reset CurrentEntry
EndFunction

Function ScrollCurrentSubMenuRight()
    If CurrentSubMenu < SubMenuList.Length - 1
        CurrentSubMenu += 1
    Else
        CurrentSubMenu = 0
    EndIf
    CurrentMenuName()
    CurrentEntry = 0 ;Reset CurrentEntry
EndFunction

Function MenuListRefresh()
    MenuList = New String[4]
    MenuList[0] = "Accessibility Menu"
    MenuList[1] = "Travel Menu"
    MenuList[2] = "Utility Menu"
    MenuList[3] = "Preferences Menu"
EndFunction

Function SubMenuListRefresh()
    If CurrentMenu == 0
        SubMenuList = New String[17]
        SubMenuList[0] = "Containers"
        SubMenuList[1] = "Loot NPC"
        SubMenuList[2] = "Alive NPC"
        SubMenuList[3] = "Doors"
        SubMenuList[4] = "Ingestibles"
        SubMenuList[5] = "Weapon"
        SubMenuList[6] = "Ammo"
        SubMenuList[7] = "Armor"
        SubMenuList[8] = "Books"
        SubMenuList[9] = "Keys"
        SubMenuList[10] = "Soul Gems"
        SubMenuList[11] = "Ingredients"
        SubMenuList[12] = "Scrolls"
        SubMenuList[13] = "Misc Items"
        SubMenuList[14] = "Furniture"
        SubMenuList[15] = "Nature"
        SubMenuList[16] = "Misc Activators"
    ElseIf CurrentMenu == 1
        SubMenuList = New String[34]
        SubMenuList[0] = "Misc Locations"
        SubMenuList[1] = "Town"
        SubMenuList[2] = "Settlement"
        SubMenuList[3] = "Cave"
        SubMenuList[4] = "Camp"
        SubMenuList[5] = "Fort"
        SubMenuList[6] = "Nordic Ruins"
        SubMenuList[7] = "Dwemer Ruins"
        SubMenuList[8] = "Shipwreck"
        SubMenuList[9] = "Grove"
        SubMenuList[10] = "Landmark"
        SubMenuList[11] = "Dragon Lair"
        SubMenuList[12] = "Farm"
        SubMenuList[13] = "Wood Mill"
        SubMenuList[14] = "Mine"
        SubMenuList[15] = "Imperial Camp"
        SubMenuList[16] = "Stormcloack Camp"
        SubMenuList[17] = "Doomstone"
        SubMenuList[18] = "Wheat Mill"
        SubMenuList[19] = "Stable"
        SubMenuList[20] = "Imperial Tower"
        SubMenuList[21] = "Clearing"
        SubMenuList[22] = "Pass"
        SubMenuList[23] = "Lighthouse"
        SubMenuList[24] = "Orc Stronghold"
        SubMenuList[25] = "Giant Camp"
        SubMenuList[26] = "Shack"
        SubMenuList[27] = "Nordic Tower"
        SubMenuList[28] = "Nordic Dwelling"
        SubMenuList[29] = "Docks"
        SubMenuList[30] = "Shrine"
        SubMenuList[31] = "Castle"
        SubMenuList[32] = "Capitol"
        SubMenuList[33] = "DLC02"
    ElseIf CurrentMenu == 2
        SubMenuList = New String[1]
        SubMenuList[0] = "2 menu's submenu"
    ElseIf CurrentMenu == 3
        SubMenuList = New String[1]
        SubMenuList[0] = "General Preferences"
    EndIf
EndFunction

Function EntriesListRefresh()
    If CurrentMenu == 0
        If CurrentSubMenu == 0
            EntriesList = ContainersArray
        ElseIf CurrentSubMenu == 1
            EntriesList = LootNPCArray
        ElseIf CurrentSubMenu == 2
            EntriesList = AliveNPCArray
        ElseIf CurrentSubMenu == 3
            EntriesList = DoorsArray
        ElseIf CurrentSubMenu == 4
            EntriesList = IngestiblesArray
        ElseIf CurrentSubMenu == 5
            EntriesList = WeaponArray
        ElseIf CurrentSubMenu == 6
            EntriesList = AmmoArray
        ElseIf CurrentSubMenu == 7
            EntriesList = ArmorArray
        ElseIf CurrentSubMenu == 8
            EntriesList = BooksArray
        ElseIf CurrentSubMenu == 9
            EntriesList = KeysArray
        ElseIf CurrentSubMenu == 10
            EntriesList = SoulGemsArray
        ElseIf CurrentSubMenu == 11
            EntriesList = IngredientsArray
        ElseIf CurrentSubMenu == 12
            EntriesList = ScrollsArray
        ElseIf CurrentSubMenu == 13
            EntriesList = MiscItemsArray
        ElseIf CurrentSubMenu == 14
            EntriesList = FurnitureArray
        ElseIf CurrentSubMenu == 15
            EntriesList = NatureArray
        ElseIf CurrentSubMenu == 16
            EntriesList = MiscActivatorsArray
        EndIf
    ElseIf CurrentMenu == 1
        If CurrentSubMenu == 0
            EntriesList = MiscArray
        ElseIf CurrentSubMenu == 1
            EntriesList = TownArray
        ElseIf CurrentSubMenu == 2
            EntriesList = SettlementArray
        ElseIf CurrentSubMenu == 3
            EntriesList = CaveArray
        ElseIf CurrentSubMenu == 4
            EntriesList = CampArray
        ElseIf CurrentSubMenu == 5
            EntriesList = FortArray
        ElseIf CurrentSubMenu == 6
            EntriesList = NordicRuinsArray
        ElseIf CurrentSubMenu == 7
            EntriesList = DwemerRuinArray
        ElseIf CurrentSubMenu == 8
            EntriesList = ShipwreckArray
        ElseIf CurrentSubMenu == 9
            EntriesList = GroveArray
        ElseIf CurrentSubMenu == 10
            EntriesList = LandmarkArray
        ElseIf CurrentSubMenu == 11
            EntriesList = DragonLairArray
        ElseIf CurrentSubMenu == 12
            EntriesList = FarmArray
        ElseIf CurrentSubMenu == 13
            EntriesList = WoodMillArray
        ElseIf CurrentSubMenu == 14
            EntriesList = MineArray
        ElseIf CurrentSubMenu == 15
            EntriesList = ImperialCampArray
        ElseIf CurrentSubMenu == 16
            EntriesList = StormcloakCampArray
        ElseIf CurrentSubMenu == 17
            EntriesList = DoomstoneArray
        ElseIf CurrentSubMenu == 18
            EntriesList = WheatMillArray
        ElseIf CurrentSubMenu == 19
            EntriesList = StableArray
        ElseIf CurrentSubMenu == 20
            EntriesList = ImperialTowerArray
        ElseIf CurrentSubMenu == 21
            EntriesList = ClearingArray
        ElseIf CurrentSubMenu == 22
            EntriesList = PassArray
        ElseIf CurrentSubMenu == 23
            EntriesList = LighthouseArray
        ElseIf CurrentSubMenu == 24
            EntriesList = OrcStrongholdArray
        ElseIf CurrentSubMenu == 25
            EntriesList = GiantCampArray
        ElseIf CurrentSubMenu == 26
            EntriesList = ShackArray
        ElseIf CurrentSubMenu == 27
            EntriesList = NordicTowerArray
        ElseIf CurrentSubMenu == 28
            EntriesList = NordicDwellingArray
        ElseIf CurrentSubMenu == 29
            EntriesList = DocksArray
        ElseIf CurrentSubMenu == 30
            EntriesList = ShrineArray
        ElseIf CurrentSubMenu == 31
            EntriesList = CastleArray
        ElseIf CurrentSubMenu == 32
            EntriesList = CapitolArray
        ElseIf CurrentSubMenu == 33
            EntriesList = DLC02Array
        EndIf
    ElseIf CurrentMenu == 2
    ElseIf CurrentMenu == 3
        If CurrentSubMenu == 0
        EndIf
    EndIf
EndFunction

Function CurrentEntryNameFind()
    CurrentEntryName = ""
    If CurrentMenu == 0
        If CurrentSubMenu == 15
            If EntriesList.Length == 0
                CurrentEntryName = ("No entries")
            Else
                String Name
                If EntriesList[CurrentEntry].GetDisplayName() != ""
                    Name = EntriesList[CurrentEntry].GetDisplayName()
                Else
                    Name = DbSkseFunctions.GetFormEditorId(EntriesList[CurrentEntry].GetBaseObject())
                EndIf
                If EntriesList[CurrentEntry].IsHarvested() == True
                    Name = Name + ", Harvested"
                EndIf
                String OutOf = CurrentEntry As String + "/" + (EntriesList.Length - 1) As String
                String Distance = ((Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) / 70) + " Meters"
                CurrentEntryName = (Name + ", " + Distance + ", " + OutOf)
            EndIf
        Else
            If EntriesList.Length == 0
                CurrentEntryName = ("No entries")
            Else
                String Name
                If EntriesList[CurrentEntry].GetDisplayName() != ""
                    Name = EntriesList[CurrentEntry].GetDisplayName()
                Else
                    Name = DbSkseFunctions.GetFormEditorId(EntriesList[CurrentEntry].GetBaseObject())
                EndIf
                String OutOf = CurrentEntry As String + "/" + (EntriesList.Length - 1) As String
                String Distance = ((Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) / 70) + " Meters"
                CurrentEntryName = (Name + ", " + Distance + ", " + OutOf)
            EndIf
        EndIf
    ElseIf CurrentMenu == 1
        If EntriesList.Length == 0
            CurrentEntryName = ("No entries")
        Else
            String Name = DbSkseFunctions.GetMapMarkerName(EntriesList[CurrentEntry])
            String Status
            If (EntriesList[CurrentEntry].IsMapMarkerVisible() == True && EntriesList[CurrentEntry].CanFastTravelToMarker() == True)
                Status = "Discovered"
            ElseIf (EntriesList[CurrentEntry].IsMapMarkerVisible() == True && EntriesList[CurrentEntry].CanFastTravelToMarker() == False)
                Status = "Undiscovered"
            Else
                Status = "Unknown"
            EndIf
            String OutOf = CurrentEntry As String + "/" + (EntriesList.Length - 1) As String
            String Distance = ((Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) / 70) + " Meters"
            CurrentEntryName = (Name + ", " + Status + ", " + Distance + ", " + OutOf)
        EndIf
    Else
        If EntriesList.Length == 0
            CurrentEntryName = ("No entries")
        Else
            String Name
            If EntriesList[CurrentEntry].GetDisplayName() != ""
                String Name = EntriesList[CurrentEntry].GetDisplayName()
            Else
                String Name = DbSkseFunctions.GetFormEditorId(EntriesList[CurrentEntry].GetBaseObject())
            EndIf
            String OutOf = CurrentEntry As String + "/" + (EntriesList.Length - 1) As String
            String Distance = ((Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) / 70) + " Meters"
            CurrentEntryName = (Name + ", " + Distance + ", " + OutOf)
        EndIf
    EndIf
EndFunction

Function CurrentEntryNameShow()
    CurrentEntryNameFind()
    DisplayMenuText(CurrentEntryName)
EndFunction

Function CurrentMenuName()
    SubMenuListRefresh()
    EntriesListRefresh()
    CurrentEntryNameFind()
    DisplayMenuText(SubMenuList[CurrentSubMenu] + " : " + CurrentEntryName + " : " + MenuList[CurrentMenu])
EndFunction

Function Select()
    If CurrentMenu == 0
        If CurrentSubMenu == 0 || CurrentSubMenu == 3
            AutoLockPick()
        Else
            If Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) <= 70
                EntriesList[CurrentEntry].Activate(Game.GetPlayer())
            Else
                DisplayMenuText("Too far to interact")
            EndIf
        EndIf
    ElseIf CurrentMenu == 1

    ElseIf CurrentMenu == 2

    ElseIf CurrentMenu == 3
    EndIf
    EntriesListRefresh()
EndFunction

Function AutoLockPick()
    Int LockPickingSkillBasedRandom
    Float LockPickingSkill = Game.GetPlayer().GetActorValue("Lockpicking")

    LockPickingSkillBasedRandom = EntriesList[CurrentEntry].GetLockLevel() / LockPickingSkill As Int

    If LockPickingSkillBasedRandom < 1
        LockPickingSkillBasedRandom = 1
    EndIf

    Int LockPickingSkillBasedExperience = 2 + (EntriesList[CurrentEntry].GetLockLevel() + 16) / 48 + LockPickingSkill As Int / 3

    If EntriesList[CurrentEntry].IsLocked() == 0
        EntriesList[CurrentEntry].Activate(Game.GetPlayer())
    ElseIf EntriesList[CurrentEntry].IsLocked() == 1 && EntriesList[CurrentEntry].GetLockLevel() < 255
        If AutoLockPick == False
            EntriesList[CurrentEntry].Activate(Game.GetPlayer())
        Else
            If Game.GetPlayer().GetItemCount(SkeletonKey) >= 1
                EntriesList[CurrentEntry].Lock(False)
                AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer())
            ElseIf Game.GetPlayer().GetItemCount(Lockpick) >= 1
                While EntriesList[CurrentEntry].IsLocked() == 1 && Game.GetPlayer().GetItemCount(Lockpick) >= 1
                    If Utility.RandomInt(0, LockPickingSkillBasedRandom) == 0
                        EntriesList[CurrentEntry].Lock(False)
                        AccessibilityCNDLockPickSuccess.Play(Game.GetPlayer())
                        Game.AdvanceSkill("Lockpicking", LockPickingSkillBasedExperience)
                        DisplayMenuText("Success")
                    Else
                        Game.AdvanceSkill("Lockpicking", 1.0)
                        AccessibilityCNDLockPickFail.Play(Game.GetPlayer())
                        DisplayMenuText("Fail")
                    EndIf
                    Game.GetPlayer().RemoveItem(Lockpick, 1)
                    Utility.Wait(0.5)
                EndWhile
                If EntriesList[CurrentEntry].IsLocked() == 1 && Game.GetPlayer().GetItemCount(Lockpick) < 1
                    DisplayMenuText("Not enough Lockpicks")
                    AccessibilityCNDNoLockPicks.Play(Game.GetPlayer())
                EndIf
            Else
                DisplayMenuText("Not enough Lockpicks")
                AccessibilityCNDNoLockPicks.Play(Game.GetPlayer())
            EndIf
        EndIf
    ElseIf EntriesList[CurrentEntry].IsLocked() == 1 && EntriesList[CurrentEntry].GetLockLevel() == 255
        EntriesList[CurrentEntry].Activate(Game.GetPlayer())
    EndIf
EndFunction

Function Teleport()
    If CurrentMenu == 0
        If Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) > 3500
            DisplayMenuText("Too far to teleport")
        Else
            Game.GetPlayer().MoveTo(EntriesList[CurrentEntry])
        EndIf
    ElseIf CurrentMenu == 1
        Game.FastTravel(EntriesList[CurrentEntry])
    EndIf
EndFunction

Function WalkTo() ;Stop when Near or WASD key pressed

EndFunction

Function Follow() ;Stop only when wasd key pressed

EndFunction

Function LockCameraOn() ;30 Seconds of Camera Lock On. !!!Vertical Angle Not Working
    ;If !EntriesList[CurrentEntry].IsDisabled()
    ;    Int LockCameraTimer = 0
    ;    While LockCameraTimer < 60
    ;        Float XAngle = Game.GetPlayer().GetAngleX()
    ;        Float YAngle = Game.GetPlayer().GetAngleY()
    ;        Float ZAngle = Game.GetPlayer().GetAngleZ() + Game.GetPlayer().GetHeadingAngle(EntriesList[CurrentEntry])
    ;        Game.GetPlayer().SetAngle(XAngle, YAngle, ZAngle)
    ;        Utility.Wait(0.5)
    ;        LockCameraTimer += 1
    ;    EndWhile
    ;EndIf
EndFunction

Function SelectEntry()
    If IsAccessibilityMenuOpen == True
        SelectedEntry = EntriesList[CurrentEntry]
        DisplayMenuText("Entry Selected: " + CurrentEntryName)
    ElseIf IsAccessibilityMenuOpen == False && SelectedEntry != None && Input.IsKeyPressed(42)
        SelectedEntry = None
    ElseIf IsAccessibilityMenuOpen == False && SelectedEntry != None
        String PlayerPos = "X: " + Game.GetPlayer().GetPositionX() As Int + ", Y: " + Game.GetPlayer().GetPositionY() As Int + ", Z: " + Game.GetPlayer().GetPositionZ() As Int
        String SelectedEntryPos = "X: " + SelectedEntry.GetPositionX() As Int + ", Y: " + SelectedEntry.GetPositionY() As Int + ", Z: " + SelectedEntry.GetPositionZ() As Int
        Float AltitudeDifference = SelectedEntry.GetPositionZ() As Int - Game.GetPlayer().GetPositionZ() As Int
        Float SelectedEntryAngle = Game.GetPlayer().GetHeadingAngle(EntriesList[CurrentEntry])
        String SelectedEntryDirection
        String Altitude
        If SelectedEntry.GetPositionZ() > Game.GetPlayer().GetPositionZ()
            Altitude = (", Entry up by: " + (AltitudeDifference / 0.7) As Int + " Centimeters")
        Else
            Altitude = (", Entry down by: " + ((AltitudeDifference / 0.7) As Int * -1) + " Centimeters")
        EndIf
        If SelectedEntryAngle > -45.0 && SelectedEntryAngle < 45.0
            SelectedEntryDirection = "Front"
        ElseIf SelectedEntryAngle >= 45.0 && SelectedEntryAngle <= 135.0
            SelectedEntryDirection = "Right"
        ElseIf SelectedEntryAngle <= -45.0 && SelectedEntryAngle >= -135.0
            SelectedEntryDirection = "Left"
        Else
            SelectedEntryDirection = "Back"
        EndIf
        DisplayMenuText("Direction: " + SelectedEntryDirection + ", Angle: " + SelectedEntryAngle As Int + Altitude + ", Player: " + PlayerPos + ", Entry: " + SelectedEntryPos)
    ElseIf IsAccessibilityMenuOpen == False && SelectedEntry == None
        DisplayMenuText("No Entry Selected")
    EndIf
EndFunction

Function SelectedEntryMark()
    If SelectedEntry != None
        AccessibilityAMBSelectedEntryMark.Play(SelectedEntry)
    EndIf
EndFunction

Function SortMapMarkers()
    MapMarkers = DbSkseFunctions.GetAllMapMarkerRefs(-1, -1)

    MiscArray            = PapyrusUtil.ResizeObjRefArray(MiscArray, 0)
    TownArray            = PapyrusUtil.ResizeObjRefArray(TownArray, 0)
    SettlementArray      = PapyrusUtil.ResizeObjRefArray(SettlementArray, 0)
    CaveArray            = PapyrusUtil.ResizeObjRefArray(CaveArray, 0)
    CampArray            = PapyrusUtil.ResizeObjRefArray(CampArray, 0)
    FortArray            = PapyrusUtil.ResizeObjRefArray(FortArray, 0)
    NordicRuinsArray     = PapyrusUtil.ResizeObjRefArray(NordicRuinsArray, 0)
    DwemerRuinArray      = PapyrusUtil.ResizeObjRefArray(DwemerRuinArray, 0)
    ShipwreckArray       = PapyrusUtil.ResizeObjRefArray(ShipwreckArray, 0)
    GroveArray           = PapyrusUtil.ResizeObjRefArray(GroveArray, 0)
    LandmarkArray        = PapyrusUtil.ResizeObjRefArray(LandmarkArray, 0)
    DragonLairArray      = PapyrusUtil.ResizeObjRefArray(DragonLairArray, 0)
    FarmArray            = PapyrusUtil.ResizeObjRefArray(FarmArray, 0)
    WoodMillArray        = PapyrusUtil.ResizeObjRefArray(WoodMillArray, 0)
    MineArray            = PapyrusUtil.ResizeObjRefArray(MineArray, 0)
    ImperialCampArray    = PapyrusUtil.ResizeObjRefArray(ImperialCampArray, 0)
    StormcloakCampArray  = PapyrusUtil.ResizeObjRefArray(StormcloakCampArray, 0)
    DoomstoneArray       = PapyrusUtil.ResizeObjRefArray(DoomstoneArray, 0)
    WheatMillArray       = PapyrusUtil.ResizeObjRefArray(WheatMillArray, 0)
    StableArray          = PapyrusUtil.ResizeObjRefArray(StableArray, 0)
    ImperialTowerArray   = PapyrusUtil.ResizeObjRefArray(ImperialTowerArray, 0)
    ClearingArray        = PapyrusUtil.ResizeObjRefArray(ClearingArray, 0)
    PassArray            = PapyrusUtil.ResizeObjRefArray(PassArray, 0)
    LighthouseArray      = PapyrusUtil.ResizeObjRefArray(LighthouseArray, 0)
    OrcStrongholdArray   = PapyrusUtil.ResizeObjRefArray(OrcStrongholdArray, 0)
    GiantCampArray       = PapyrusUtil.ResizeObjRefArray(GiantCampArray, 0)
    ShackArray           = PapyrusUtil.ResizeObjRefArray(ShackArray, 0)
    NordicTowerArray     = PapyrusUtil.ResizeObjRefArray(NordicTowerArray, 0)
    NordicDwellingArray  = PapyrusUtil.ResizeObjRefArray(NordicDwellingArray, 0)
    DocksArray           = PapyrusUtil.ResizeObjRefArray(DocksArray, 0)
    ShrineArray          = PapyrusUtil.ResizeObjRefArray(ShrineArray, 0)
    CastleArray          = PapyrusUtil.ResizeObjRefArray(CastleArray, 0)
    CapitolArray         = PapyrusUtil.ResizeObjRefArray(CapitolArray, 0)
    DLC02Array           = PapyrusUtil.ResizeObjRefArray(DLC02Array, 0)

    Int MapMarkersIndex = 0

    While MapMarkersIndex < MapMarkers.Length
        Int IconType = DbSkseFunctions.GetMapMarkerIconType(MapMarkers[MapMarkersIndex])

        If IconType == 0 || IconType == 1 || IconType == 20 || IconType == 25 || IconType == 26 || IconType == 59 || IconType == 60 || IconType == 61 || IconType == 62 || IconType == 63 || IconType == 64 || IconType == 65 || IconType == 66 ; Misc
            MiscArray = PapyrusUtil.PushObjRef(MiscArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 2 ; Town
            TownArray = PapyrusUtil.PushObjRef(TownArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 3 ; Settlement
            SettlementArray = PapyrusUtil.PushObjRef(SettlementArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 4 ; Cave
            CaveArray = PapyrusUtil.PushObjRef(CaveArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 5 ; Camp
            CampArray = PapyrusUtil.PushObjRef(CampArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 6 ; Fort
            FortArray = PapyrusUtil.PushObjRef(FortArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 7 ; NordicRuins
            NordicRuinsArray = PapyrusUtil.PushObjRef(NordicRuinsArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 8 ; DwemerRuin
            DwemerRuinArray = PapyrusUtil.PushObjRef(DwemerRuinArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 9 ; Shipwreck
            ShipwreckArray = PapyrusUtil.PushObjRef(ShipwreckArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 10 ; Grove
            GroveArray = PapyrusUtil.PushObjRef(GroveArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 11 ; Landmark
            LandmarkArray = PapyrusUtil.PushObjRef(LandmarkArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 12 ; DragonLair
            DragonLairArray = PapyrusUtil.PushObjRef(DragonLairArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 13 ; Farm
            FarmArray = PapyrusUtil.PushObjRef(FarmArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 14 ; WoodMill
            WoodMillArray = PapyrusUtil.PushObjRef(WoodMillArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 15 ; Mine
            MineArray = PapyrusUtil.PushObjRef(MineArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 16 ; ImperialCamp
            ImperialCampArray = PapyrusUtil.PushObjRef(ImperialCampArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 17 ; StormcloakCamp
            StormcloakCampArray = PapyrusUtil.PushObjRef(StormcloakCampArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 18 ; Doomstone
            DoomstoneArray = PapyrusUtil.PushObjRef(DoomstoneArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 19 ; WheatMill
            WheatMillArray = PapyrusUtil.PushObjRef(WheatMillArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 21 ; Stable
            StableArray = PapyrusUtil.PushObjRef(StableArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 22 ; ImperialTower
            ImperialTowerArray = PapyrusUtil.PushObjRef(ImperialTowerArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 23 ; Clearing
            ClearingArray = PapyrusUtil.PushObjRef(ClearingArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 24 ; Pass
            PassArray = PapyrusUtil.PushObjRef(PassArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 27 ; Lighthouse
            LighthouseArray = PapyrusUtil.PushObjRef(LighthouseArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 28 ; OrcStronghold
            OrcStrongholdArray = PapyrusUtil.PushObjRef(OrcStrongholdArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 29 ; GiantCamp
            GiantCampArray = PapyrusUtil.PushObjRef(GiantCampArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 30 ; Shack
            ShackArray = PapyrusUtil.PushObjRef(ShackArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 31 ; NordicTower
            NordicTowerArray = PapyrusUtil.PushObjRef(NordicTowerArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 32 ; NordicDwelling
            NordicDwellingArray = PapyrusUtil.PushObjRef(NordicDwellingArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 33 ; Docks
            DocksArray = PapyrusUtil.PushObjRef(DocksArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 34 ; Shrine
            ShrineArray = PapyrusUtil.PushObjRef(ShrineArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 35 || IconType == 37 || IconType == 39 || IconType == 41 || IconType == 43 || IconType == 45 || IconType == 47 || IconType == 49 || IconType == 51 ; Castles
            CastleArray = PapyrusUtil.PushObjRef(CastleArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 36 || IconType == 38 || IconType == 40 || IconType == 42 || IconType == 44 || IconType == 46 || IconType == 48 || IconType == 50 || IconType == 52 ; Capitols
            CapitolArray = PapyrusUtil.PushObjRef(CapitolArray, MapMarkers[MapMarkersIndex])
        ElseIf IconType == 53 || IconType == 54 || IconType == 55 || IconType == 56 || IconType == 57 || IconType == 58 ; DLC02
            DLC02Array = PapyrusUtil.PushObjRef(DLC02Array, MapMarkers[MapMarkersIndex])
        Else ; any other -> Misc
            MiscArray = PapyrusUtil.PushObjRef(MiscArray, MapMarkers[MapMarkersIndex])
        EndIf

        MapMarkersIndex += 1
    EndWhile
EndFunction

Function SortActivators()
    ContainersArray         = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 3500.0)
    TotalNPCArray           = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 3500.0)
    AliveNPCArray = PapyrusUtil.ResizeObjRefArray(AliveNPCArray, 0)
    LootNPCArray = PapyrusUtil.ResizeObjRefArray(LootNPCArray, 0)
    DoorsArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, 3500.0)
    IngestiblesArray        = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 46, 3500.0)
    WeaponArray             = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 41, 3500.0)
    AmmoArray               = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 42, 3500.0)
    ArmorArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 26, 3500.0)
    BooksArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 27, 3500.0)
    KeysArray               = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 45, 3500.0)
    SoulGemsArray           = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 52, 3500.0)
    IngredientsArray        = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 30, 3500.0)
    ScrollsArray            = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 23, 3500.0)
    MiscItemsArray          = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 32, 3500.0)
    FurnitureArray          = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 40, 3500.0)
    FloraArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 39, 3500.0)
    TreesArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 38, 3500.0)
    NatureArray             = PapyrusUtil.MergeObjRefArray(FloraArray, TreesArray)
    HalfMiscActivatorsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 24, 3500.0)
    TalkingActivatorsArray  = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 25, 3500.0)
    MiscActivatorsArray     = PapyrusUtil.MergeObjRefArray(HalfMiscActivatorsArray, TalkingActivatorsArray)

    If TotalNPCArray.Length > 0
        Int TotalNPCIndex = 0
        While TotalNPCIndex < TotalNPCArray.Length
            Actor CurrentNPC = TotalNPCArray[TotalNPCIndex] As Actor
            If !CurrentNPC.IsDead() && (CurrentNPC != Game.GetPlayer())
                AliveNPCArray   = PapyrusUtil.PushObjRef(AliveNPCArray, CurrentNPC)
            ElseIf CurrentNPC.IsDead()
                LootNPCArray    = PapyrusUtil.PushObjRef(LootNPCArray, CurrentNPC)
            EndIf
            TotalNPCIndex += 1
        EndWhile
    EndIf
EndFunction

Function ReturnToNavMesh()
    PO3_SKSEFunctions.MoveToNearestNavmeshLocation(Game.GetPlayer())
EndFunction

Function PlayerStatus()
    Int Health = Game.GetPlayer().GetActorValue("Health") As Int
    Int Stamina = Game.GetPlayer().GetActorValue("Stamina") As Int
    Int Magicka = Game.GetPlayer().GetActorValue("Magicka") As Int
    Int Gold = Game.GetPlayer().GetGoldAmount()
    Int CarryWeight = Game.GetPlayer().GetActorValue("InventoryWeight") As Int
    Int MaxCarryWeight = Game.GetPlayer().GetActorValue("CarryWeight") As Int
    DisplayMenuText("Halth: " + Health + " Stamina: " + Stamina + " Magicka: " + Magicka + " Gold: " + Gold + " Carry Weight: " + CarryWeight + "/" + MaxCarryWeight)
EndFunction

Function AmbientSound()
    AddAmbientSound(ContainersArray, AccessibilityAMBContainerUnlocked, AccessibilityAMBContainerLocked)
    AddAmbientSound(AliveNPCArray, AccessibilityAMBNPCNeutral, AccessibilityAMBNPCEnemy)
    AddAmbientSound(LootNPCArray, AccessibilityAMBLootNPC, None)
    AddAmbientSound(DoorsArray, AccessibilityAMBDoorUnlocked, AccessibilityAMBDoorLocked)
    AddAmbientSound(IngestiblesArray, AccessibilityAMBIngestible, None)
    AddAmbientSound(WeaponArray, AccessibilityAMBWeapon, None)
    AddAmbientSound(AmmoArray, AccessibilityAMBAmmo, None)
    AddAmbientSound(ArmorArray, AccessibilityAMBArmor, None)
    AddAmbientSound(BooksArray, AccessibilityAMBBook, None)
    AddAmbientSound(KeysArray, AccessibilityAMBKey, None)
    AddAmbientSound(SoulGemsArray, AccessibilityAMBSoulGem, None)
    AddAmbientSound(IngredientsArray, AccessibilityAMBIngredient, None)
    AddAmbientSound(ScrollsArray, AccessibilityAMBScroll, None)
    AddAmbientSound(MiscItemsArray, AccessibilityAMBMiscItem, None)
    AddAmbientSound(FurnitureArray, AccessibilityAMBFurniture, None)
    AddAmbientSound(NatureArray, AccessibilityAMBNatureUnharvested, AccessibilityAMBNatureHarvested)
    AddAmbientSound(MiscActivatorsArray, AccessibilityAMBMiscActivator, None)
EndFunction

Function AddAmbientSound(ObjectReference[] Array, Sound AMBSound, Sound AMBSoundAlt)
    Int Index = 0
    While Index < Array.Length
        If Array[Index] != None
            Utility.Wait(Utility.RandomFloat())
            If Array == ContainersArray && Array[Index].IsLocked() == False
                AMBSound.Play(Array[Index])
            ElseIf Array == ContainersArray && Array[Index].IsLocked() == True
                AMBSoundAlt.Play(Array[Index])
            ElseIf Array == LootNPCArray
                AMBSound.Play(Array[Index])
            ElseIf Array == AliveNPCArray && (Array[Index] As Actor).IsHostileToActor(Game.GetPlayer()) == False
                AMBSound.Play(Array[Index])
            ElseIf Array == AliveNPCArray && (Array[Index] As Actor).IsHostileToActor(Game.GetPlayer()) == True
                AMBSoundAlt.Play(Array[Index])
            ElseIf Array == DoorsArray && Array[Index].IsLocked() == False
                AMBSound.Play(Array[Index])
            ElseIf Array == DoorsArray && Array[Index].IsLocked() == True
                AMBSoundAlt.Play(Array[Index])
            ElseIf Array == IngestiblesArray
                AMBSound.Play(Array[Index])
            ElseIf Array == WeaponArray
                AMBSound.Play(Array[Index])
            ElseIf Array == AmmoArray
                AMBSound.Play(Array[Index])
            ElseIf Array == ArmorArray
                AMBSound.Play(Array[Index])
            ElseIf Array == BooksArray
                AMBSound.Play(Array[Index])
            ElseIf Array == KeysArray
                AMBSound.Play(Array[Index])
            ElseIf Array == SoulGemsArray
                AMBSound.Play(Array[Index])
            ElseIf Array == IngredientsArray
                AMBSound.Play(Array[Index])
            ElseIf Array == ScrollsArray
                AMBSound.Play(Array[Index])
            ElseIf Array == MiscItemsArray
                AMBSound.Play(Array[Index])
            ElseIf Array == FurnitureArray
                AMBSound.Play(Array[Index])
            ElseIf Array == NatureArray && Array[Index].IsHarvested() == False
                AMBSound.Play(Array[Index])
            ElseIf Array == NatureArray && Array[Index].IsHarvested() == True
                AMBSoundAlt.Play(Array[Index])
            ElseIf Array == MiscActivatorsArray
                AMBSound.Play(Array[Index])
            EndIf
        EndIf
        Index += 1
    EndWhile
EndFunction

Function DisplayMenuText(String Text)
	UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShowNotification", Text)
EndFunction
