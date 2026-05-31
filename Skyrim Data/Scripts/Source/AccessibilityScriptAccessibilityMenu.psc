Scriptname AccessibilityScriptAccessibilityMenu Extends ReferenceAlias

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

Float LastScanPosX
Float LastScanPosY
Float LastScanPosZ

Sound Property AccessibilityCNDLockPickFail Auto
Sound Property AccessibilityCNDLockPickSuccess Auto
Sound Property AccessibilityCNDNoLockPicks Auto
Sound Property AccessibilityCNDWalkInPlace Auto

Sound Property AccessibilityAMBContainerUnlocked Auto
Sound Property AccessibilityAMBContainerLocked Auto
Sound Property AccessibilityAMBNPCNeutral Auto
Sound Property AccessibilityAMBNPCEnemy Auto
Sound Property AccessibilityAMBLootNPC Auto
Sound Property AccessibilityAMBDoorUnlocked Auto
Sound Property AccessibilityAMBDoorLocked Auto
Sound Property AccessibilityAMBIngestible Auto
Sound Property AccessibilityAMBWeapon Auto
Sound Property AccessibilityAMBAmmo Auto
Sound Property AccessibilityAMBArmor Auto
Sound Property AccessibilityAMBBook Auto
Sound Property AccessibilityAMBKey Auto
Sound Property AccessibilityAMBSoulGem Auto
Sound Property AccessibilityAMBIngredient Auto
Sound Property AccessibilityAMBScroll Auto
Sound Property AccessibilityAMBMiscItem Auto
Sound Property AccessibilityAMBFurniture Auto
Sound Property AccessibilityAMBNatureUnharvested Auto
Sound Property AccessibilityAMBNatureHarvested Auto
Sound Property AccessibilityAMBMiscActivator Auto

Sound Property AccessibilityAMBSelectedEntryMark Auto

MiscObject Property Lockpick Auto
MiscObject Property SkeletonKey Auto


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
    SortActivators(700)
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
        SortActivators(3500)
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

Function SortActivators(Int ActivatorsDistance)
    ContainersArray         = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, ActivatorsDistance)
    TotalNPCArray           = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, ActivatorsDistance)
    AliveNPCArray = PapyrusUtil.ResizeObjRefArray(AliveNPCArray, 0)
    LootNPCArray = PapyrusUtil.ResizeObjRefArray(LootNPCArray, 0)
    DoorsArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 29, ActivatorsDistance)
    IngestiblesArray        = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 46, ActivatorsDistance)
    WeaponArray             = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 41, ActivatorsDistance)
    AmmoArray               = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 42, ActivatorsDistance)
    ArmorArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 26, ActivatorsDistance)
    BooksArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 27, ActivatorsDistance)
    KeysArray               = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 45, ActivatorsDistance)
    SoulGemsArray           = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 52, ActivatorsDistance)
    IngredientsArray        = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 30, ActivatorsDistance)
    ScrollsArray            = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 23, ActivatorsDistance)
    MiscItemsArray          = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 32, ActivatorsDistance)
    FurnitureArray          = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 40, ActivatorsDistance)
    FloraArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 39, ActivatorsDistance)
    TreesArray              = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 38, ActivatorsDistance)
    NatureArray             = PapyrusUtil.MergeObjRefArray(FloraArray, TreesArray)
    HalfMiscActivatorsArray = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 24, ActivatorsDistance)
    TalkingActivatorsArray  = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 25, ActivatorsDistance)
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
    Float ScanPosX = Game.GetPlayer().GetPositionX()
    Float ScanPosY = Game.GetPlayer().GetPositionY()
    Float ScanPosZ = Game.GetPlayer().GetPositionZ()

    If Math.abs(ScanPosX - LastScanPosX) > 70.0 || Math.abs(ScanPosY - LastScanPosY) > 70.0 || Math.abs(ScanPosZ - LastScanPosZ) > 70.0
        SortActivators(700)
        LastScanPosX = ScanPosX
        LastScanPosY = ScanPosY
        LastScanPosZ = ScanPosZ
    EndIf

    Int LongestArrayLength = 0

    If ContainersArray.Length > LongestArrayLength
        LongestArrayLength = ContainersArray.Length
    EndIf
    If AliveNPCArray.Length > LongestArrayLength
        LongestArrayLength = AliveNPCArray.Length
    EndIf
    If LootNPCArray.Length > LongestArrayLength
        LongestArrayLength = LootNPCArray.Length
    EndIf
    If DoorsArray.Length > LongestArrayLength
        LongestArrayLength = DoorsArray.Length
    EndIf
    If IngestiblesArray.Length > LongestArrayLength
        LongestArrayLength = IngestiblesArray.Length
    EndIf
    If WeaponArray.Length > LongestArrayLength
        LongestArrayLength = WeaponArray.Length
    EndIf
    If AmmoArray.Length > LongestArrayLength
        LongestArrayLength = AmmoArray.Length
    EndIf
    If ArmorArray.Length > LongestArrayLength
        LongestArrayLength = ArmorArray.Length
    EndIf
    If BooksArray.Length > LongestArrayLength
        LongestArrayLength = BooksArray.Length
    EndIf
    If KeysArray.Length > LongestArrayLength
        LongestArrayLength = KeysArray.Length
    EndIf
    If SoulGemsArray.Length > LongestArrayLength
        LongestArrayLength = SoulGemsArray.Length
    EndIf
    If IngredientsArray.Length > LongestArrayLength
        LongestArrayLength = IngredientsArray.Length
    EndIf
    If ScrollsArray.Length > LongestArrayLength
        LongestArrayLength = ScrollsArray.Length
    EndIf
    If MiscItemsArray.Length > LongestArrayLength
        LongestArrayLength = MiscItemsArray.Length
    EndIf
    If FurnitureArray.Length > LongestArrayLength
        LongestArrayLength = FurnitureArray.Length
    EndIf
    If NatureArray.Length > LongestArrayLength
        LongestArrayLength = NatureArray.Length
    EndIf
    If MiscActivatorsArray.Length > LongestArrayLength
        LongestArrayLength = MiscActivatorsArray.Length
    EndIf

    Int Index = 0

    Int ContainersIndex = 0
    Int AliveNPCIndex = 0
    Int LootNPCIndex = 0
    Int DoorsIndex = 0
    Int IngestiblesIndex = 0
    Int WeaponIndex = 0
    Int AmmoIndex = 0
    Int ArmorIndex = 0
    Int BooksIndex = 0
    Int KeysIndex = 0
    Int SoulGemsIndex = 0
    Int IngredientsIndex = 0
    Int ScrollsIndex = 0
    Int MiscItemsIndex = 0
    Int FurnitureIndex = 0
    Int NatureIndex = 0
    Int MiscActivatorsIndex = 0

    While Index < LongestArrayLength
        If ContainersArray[Index] != None
            AddAmbientSound(ContainersArray, ContainersIndex, AccessibilityAMBContainerUnlocked, AccessibilityAMBContainerLocked)
            ContainersIndex += 1
        EndIf
        If AliveNPCArray[Index] != None
            AddAmbientSound(AliveNPCArray, AliveNPCIndex, AccessibilityAMBNPCNeutral, AccessibilityAMBNPCEnemy)
            AliveNPCIndex += 1
        EndIf
        If LootNPCArray[Index] != None
            AddAmbientSound(LootNPCArray, LootNPCIndex, AccessibilityAMBLootNPC, None)
            LootNPCIndex += 1
        EndIf
        If DoorsArray[Index] != None
            AddAmbientSound(DoorsArray, DoorsIndex, AccessibilityAMBDoorUnlocked, AccessibilityAMBDoorLocked)
            DoorsIndex += 1
        EndIf
        If IngestiblesArray[Index] != None
            AddAmbientSound(IngestiblesArray, IngestiblesIndex, AccessibilityAMBIngestible, None)
            IngestiblesIndex += 1
        EndIf
        If WeaponArray[Index] != None
            AddAmbientSound(WeaponArray, WeaponIndex, AccessibilityAMBWeapon, None)
            WeaponIndex += 1
        EndIf
        If AmmoArray[Index] != None
            AddAmbientSound(AmmoArray, AmmoIndex, AccessibilityAMBAmmo, None)
            AmmoIndex += 1
        EndIf
        If ArmorArray[Index] != None
            AddAmbientSound(ArmorArray, ArmorIndex, AccessibilityAMBArmor, None)
            ArmorIndex += 1
        EndIf
        If BooksArray[Index] != None
            AddAmbientSound(BooksArray, BooksIndex, AccessibilityAMBBook, None)
            BooksIndex += 1
        EndIf
        If KeysArray[Index] != None
            AddAmbientSound(KeysArray, KeysIndex, AccessibilityAMBKey, None)
            KeysIndex += 1
        EndIf
        If SoulGemsArray[Index] != None
            AddAmbientSound(SoulGemsArray, SoulGemsIndex, AccessibilityAMBSoulGem, None)
            SoulGemsIndex += 1
        EndIf
        If IngredientsArray[Index] != None
            AddAmbientSound(IngredientsArray, IngredientsIndex, AccessibilityAMBIngredient, None)
            IngredientsIndex += 1
        EndIf
        If ScrollsArray[Index] != None
            AddAmbientSound(ScrollsArray, ScrollsIndex, AccessibilityAMBScroll, None)
            ScrollsIndex += 1
        EndIf
        If MiscItemsArray[Index] != None
            AddAmbientSound(MiscItemsArray, MiscItemsIndex, AccessibilityAMBMiscItem, None)
            MiscItemsIndex += 1
        EndIf
        If FurnitureArray[Index] != None
            AddAmbientSound(FurnitureArray, FurnitureIndex, AccessibilityAMBFurniture, None)
            FurnitureIndex += 1
        EndIf
        If NatureArray[Index] != None
            AddAmbientSound(NatureArray, NatureIndex, AccessibilityAMBNatureUnharvested, AccessibilityAMBNatureHarvested)
            NatureIndex += 1
        EndIf
        If MiscActivatorsArray[Index] != None
            AddAmbientSound(MiscActivatorsArray, MiscActivatorsIndex, AccessibilityAMBMiscActivator, None)
            MiscActivatorsIndex += 1
        EndIf
        Index += 1
    EndWhile
EndFunction

Function AddAmbientSound(ObjectReference[] Array, Int AmbientIndex, Sound AMBSound, Sound AMBSoundAlt)
    Utility.Wait(0.2)
    If Array[AmbientIndex] != None
        If Array == ContainersArray && Array[AmbientIndex].IsLocked() == False
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == ContainersArray && Array[AmbientIndex].IsLocked() == True
            AMBSoundAlt.Play(Array[AmbientIndex])
        ElseIf Array == LootNPCArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == AliveNPCArray && (Array[AmbientIndex] As Actor).IsHostileToActor(Game.GetPlayer()) == False
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == AliveNPCArray && (Array[AmbientIndex] As Actor).IsHostileToActor(Game.GetPlayer()) == True
            AMBSoundAlt.Play(Array[AmbientIndex])
        ElseIf Array == DoorsArray && Array[AmbientIndex].IsLocked() == False
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == DoorsArray && Array[AmbientIndex].IsLocked() == True
            AMBSoundAlt.Play(Array[AmbientIndex])
        ElseIf Array == IngestiblesArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == WeaponArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == AmmoArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == ArmorArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == BooksArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == KeysArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == SoulGemsArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == IngredientsArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == ScrollsArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == MiscItemsArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == FurnitureArray
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == NatureArray && Array[AmbientIndex].IsHarvested() == False
            AMBSound.Play(Array[AmbientIndex])
        ElseIf Array == NatureArray && Array[AmbientIndex].IsHarvested() == True
            AMBSoundAlt.Play(Array[AmbientIndex])
        ElseIf Array == MiscActivatorsArray
            AMBSound.Play(Array[AmbientIndex])
        EndIf
    EndIf
EndFunction

Function DisplayMenuText(String Text)
	UI.InvokeString("HUD Menu", "_root.HUDMovieBaseInstance.QuestUpdateBaseInstance.ShowNotification", Text)
EndFunction
