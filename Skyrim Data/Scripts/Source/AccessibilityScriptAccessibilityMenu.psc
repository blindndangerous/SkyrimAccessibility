Scriptname AccessibilityScriptAccessibilityMenu extends ReferenceAlias

Bool IsAccessibilityMenuOpen Auto

String[] MenuList Auto
Int CurrentMenu Auto

String[] SubMenuList Auto
Int CurrentSubMenu Auto

ObjectReference[] EntriesList Auto
Int CurrentEntry Auto


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
    IsAccessibilityMenuOpen = False ;Reset Bool
    CurrentMenu = 0 ;Reset CurrentMenu
    CurrentSubMenu = 0 ;Reset CurrentSubMenu
    CurrentEntry = 0 ;Reset CurrentEntry
    SortMapMarkers()
    Debug.Notification("Accessibility menu is ready")
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 47 && !Utility.IsInMenuMode() && IsAccessibilityMenuOpen == False ;V key
        MenuListRefresh()
        CurrentMenuName()
        SortActivators()
        CurrentEntryName()
        IsAccessibilityMenuOpen = True
        Game.DisablePlayerControls()
        Debug.Notification("Accessibility menu is open")
    ElseIf KeyCode == 47 && IsAccessibilityMenuOpen == True ;V key
        Game.EnablePlayerControls()
        IsAccessibilityMenuOpen = False
        Debug.Notification("Accessibility menu is closed")
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
        PlaceMark()
    ElseIf KeyCode == 18 && IsAccessibilityMenuOpen == True ;E key
        WalkTo()
    ElseIf KeyCode == 33 && IsAccessibilityMenuOpen == True ;F key
        Follow()
    ElseIf KeyCode == 19 && IsAccessibilityMenuOpen == True ;R key
        LockCameraOn()
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
    CurrentEntryName()
EndFunction

Function ScrollCurrentEntryUp()
    If CurrentEntry > 0
        CurrentEntry -= 1
    Else
        CurrentEntry = EntriesList.Length - 1
    EndIf
    CurrentEntryName()
EndFunction

Function ScrollCurrentSubMenuLeft()
    If CurrentSubMenu > 0
        CurrentSubMenu -= 1
    Else
        CurrentSubMenu = SubMenuList.Length - 1
    EndIf
    CurrentMenuName()
    EntriesListRefresh()
    CurrentEntry = 0 ;Reset CurrentEntry
EndFunction

Function ScrollCurrentSubMenuRight()
    If CurrentSubMenu < SubMenuList.Length - 1
        CurrentSubMenu += 1
    Else
        CurrentSubMenu = 0
    EndIf
    CurrentMenuName()
    EntriesListRefresh()
    CurrentEntry = 0 ;Reset CurrentEntry
EndFunction

Function MenuListRefresh()
    MenuList = New String[4]
    MenuList[0] = "Accessibility Menu"
    MenuList[1] = "Travel Menu"
    MenuList[2] = "Utility Menu"
    MenuList[3] = "Settings Menu"
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
        SubMenuList[0] = "2 menu"
    ElseIf CurrentMenu == 3
        SubMenuList = New String[1]
        SubMenuList[0] = "3 menu"
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
    EndIf
EndFunction

Function CurrentMenuName()
    SubMenuListRefresh()
    EntriesListRefresh()
    Debug.Notification(SubMenuList[CurrentSubMenu] + " : " + MenuList[CurrentMenu])
EndFunction

Function CurrentEntryName()
    If CurrentMenu == 1
        If EntriesList.Length == 0
            Debug.Notification("No entries")
        Else
            String Name = DbSkseFunctions.GetMapMarkerName(EntriesList[CurrentEntry])
            String Status = ""
            If (EntriesList[CurrentEntry].IsMapMarkerVisible() == True && EntriesList[CurrentEntry].CanFastTravelToMarker() == True)
                Status = "Discovered"
            ElseIf (EntriesList[CurrentEntry].IsMapMarkerVisible() == True && EntriesList[CurrentEntry].CanFastTravelToMarker() == False)
                Status = "Undiscovered"
            Else
                Status = "Unknown"
            EndIf
            String OutOf = CurrentEntry As String + "/" + (EntriesList.Length - 1) As String
            String Distance = ((Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) / 70) + " Meters"
            String Units = (Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) + " Units"
            Debug.Notification(Name + " " + OutOf + " " + Status + " " + Distance + " " + Units)
        EndIf
    Else
        If EntriesList.Length == 0
            Debug.Notification("No entries")
        Else
            String Name = EntriesList[CurrentEntry].GetDisplayName()
            String OutOf = CurrentEntry As String + "/" + (EntriesList.Length - 1) As String
            String Distance = ((Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) / 70) + " Meters"
            String Units = (Game.GetPlayer().GetDistance(EntriesList[CurrentEntry]) As Int) + " Units"
            Debug.Notification(Name + " " + OutOf + " " + Distance + " " + Units)
        EndIf
    EndIf
EndFunction














Function Select()

EndFunction

Function Teleport()
    If CurrentMenu == 0

    ElseIf CurrentMenu == 1
        Game.FastTravel(EntriesList[CurrentEntry])
    EndIf
EndFunction

Function PlaceMark() ;60 Seconds of sound mark. Only one can exist.

EndFunction

Function WalkTo() ;Stop when Near or WASD key pressed

EndFunction

Function Follow() ;Stop only when wasd key pressed

EndFunction

Function LockCameraOn() ;30 Seconds of Camera Lock On

EndFunction


Function SortMapMarkers()
    MapMarkers = DbSkseFunctions.GetAllMapMarkerRefs(-1, -1)
    MiscArray = new ObjectReference[128]
    TownArray = new ObjectReference[128]
    SettlementArray = new ObjectReference[128]
    CaveArray = new ObjectReference[128]
    CampArray = new ObjectReference[128]
    FortArray = new ObjectReference[128]
    NordicRuinsArray = new ObjectReference[128]
    DwemerRuinArray = new ObjectReference[128]
    ShipwreckArray = new ObjectReference[128]
    GroveArray = new ObjectReference[128]
    LandmarkArray = new ObjectReference[128]
    DragonLairArray = new ObjectReference[128]
    FarmArray = new ObjectReference[128]
    WoodMillArray = new ObjectReference[128]
    MineArray = new ObjectReference[128]
    ImperialCampArray = new ObjectReference[128]
    StormcloakCampArray = new ObjectReference[128]
    DoomstoneArray = new ObjectReference[128]
    WheatMillArray = new ObjectReference[128]
    StableArray = new ObjectReference[128]
    ImperialTowerArray = new ObjectReference[128]
    ClearingArray = new ObjectReference[128]
    PassArray = new ObjectReference[128]
    LighthouseArray = new ObjectReference[128]
    OrcStrongholdArray = new ObjectReference[128]
    GiantCampArray = new ObjectReference[128]
    ShackArray = new ObjectReference[128]
    NordicTowerArray = new ObjectReference[128]
    NordicDwellingArray = new ObjectReference[128]
    DocksArray = new ObjectReference[128]
    ShrineArray = new ObjectReference[128]
    CastleArray = new ObjectReference[128]
    CapitolArray = new ObjectReference[128]
    DLC02Array = new ObjectReference[128]

    Int MapMarkersIndex = 0
    Int MiscIndex = 0
    Int TownIndex = 0
    Int SettlementIndex = 0
    Int CaveIndex = 0
    Int CampIndex = 0
    Int FortIndex = 0
    Int NordicRuinsIndex = 0
    Int DwemerRuinIndex = 0
    Int ShipwreckIndex = 0
    Int GroveIndex = 0
    Int LandmarkIndex = 0
    Int DragonLairIndex = 0
    Int FarmIndex = 0
    Int WoodMillIndex = 0
    Int MineIndex = 0
    Int ImperialCampIndex = 0
    Int StormcloakCampIndex = 0
    Int DoomstoneIndex = 0
    Int WheatMillIndex = 0
    Int StableIndex = 0
    Int ImperialTowerIndex = 0
    Int ClearingIndex = 0
    Int PassIndex = 0
    Int LighthouseIndex = 0
    Int OrcStrongholdIndex = 0
    Int GiantCampIndex = 0
    Int ShackIndex = 0
    Int NordicTowerIndex = 0
    Int NordicDwellingIndex = 0
    Int DocksIndex = 0
    Int ShrineIndex = 0
    Int CastleIndex = 0
    Int CapitolIndex = 0
    Int DLC02Index = 0

    While MapMarkersIndex < MapMarkers.Length
        Int IconType = DbSkseFunctions.GetMapMarkerIconType(MapMarkers[MapMarkersIndex])

        If IconType == 0 || IconType == 1 || IconType == 20 || IconType == 25 || IconType == 26 || IconType == 59 || IconType == 60 || IconType == 61 || IconType == 62 || IconType == 63 || IconType == 64 || IconType == 65 || IconType == 66
            MiscArray[MiscIndex] = MapMarkers[MapMarkersIndex]
            MiscIndex += 1
        ElseIf IconType == 2 ; Town
            TownArray[TownIndex] = MapMarkers[MapMarkersIndex]
            TownIndex += 1
        ElseIf IconType == 3 ; Settlement
            SettlementArray[SettlementIndex] = MapMarkers[MapMarkersIndex]
            SettlementIndex += 1
        ElseIf IconType == 4 ; Cave
            CaveArray[CaveIndex] = MapMarkers[MapMarkersIndex]
            CaveIndex += 1
        ElseIf IconType == 5 ; Camp
            CampArray[CampIndex] = MapMarkers[MapMarkersIndex]
            CampIndex += 1
        ElseIf IconType == 6 ; Fort
            FortArray[FortIndex] = MapMarkers[MapMarkersIndex]
            FortIndex += 1
        ElseIf IconType == 7 ; NordicRuins
            NordicRuinsArray[NordicRuinsIndex] = MapMarkers[MapMarkersIndex]
            NordicRuinsIndex += 1
        ElseIf IconType == 8 ; DwemerRuin
            DwemerRuinArray[DwemerRuinIndex] = MapMarkers[MapMarkersIndex]
            DwemerRuinIndex += 1
        ElseIf IconType == 9 ; Shipwreck
            ShipwreckArray[ShipwreckIndex] = MapMarkers[MapMarkersIndex]
            ShipwreckIndex += 1
        ElseIf IconType == 10 ; Grove
            GroveArray[GroveIndex] = MapMarkers[MapMarkersIndex]
            GroveIndex += 1
        ElseIf IconType == 11 ; Landmark
            LandmarkArray[LandmarkIndex] = MapMarkers[MapMarkersIndex]
            LandmarkIndex += 1
        ElseIf IconType == 12 ; DragonLair
            DragonLairArray[DragonLairIndex] = MapMarkers[MapMarkersIndex]
            DragonLairIndex += 1
        ElseIf IconType == 13 ; Farm
            FarmArray[FarmIndex] = MapMarkers[MapMarkersIndex]
            FarmIndex += 1
        ElseIf IconType == 14 ; WoodMill
            WoodMillArray[WoodMillIndex] = MapMarkers[MapMarkersIndex]
            WoodMillIndex += 1
        ElseIf IconType == 15 ; Mine
            MineArray[MineIndex] = MapMarkers[MapMarkersIndex]
            MineIndex += 1
        ElseIf IconType == 16 ; ImperialCamp
            ImperialCampArray[ImperialCampIndex] = MapMarkers[MapMarkersIndex]
            ImperialCampIndex += 1
        ElseIf IconType == 17 ; StormcloakCamp
            StormcloakCampArray[StormcloakCampIndex] = MapMarkers[MapMarkersIndex]
            StormcloakCampIndex += 1
        ElseIf IconType == 18 ; Doomstone
            DoomstoneArray[DoomstoneIndex] = MapMarkers[MapMarkersIndex]
            DoomstoneIndex += 1
        ElseIf IconType == 19 ; WheatMill
            WheatMillArray[WheatMillIndex] = MapMarkers[MapMarkersIndex]
            WheatMillIndex += 1
        ElseIf IconType == 21 ; Stable
            StableArray[StableIndex] = MapMarkers[MapMarkersIndex]
            StableIndex += 1
        ElseIf IconType == 22 ; ImperialTower
            ImperialTowerArray[ImperialTowerIndex] = MapMarkers[MapMarkersIndex]
            ImperialTowerIndex += 1
        ElseIf IconType == 23 ; Clearing
            ClearingArray[ClearingIndex] = MapMarkers[MapMarkersIndex]
            ClearingIndex += 1
        ElseIf IconType == 24 ; Pass
            PassArray[PassIndex] = MapMarkers[MapMarkersIndex]
            PassIndex += 1
        ElseIf IconType == 27 ; Lighthouse
            LighthouseArray[LighthouseIndex] = MapMarkers[MapMarkersIndex]
            LighthouseIndex += 1
        ElseIf IconType == 28 ; OrcStronghold
            OrcStrongholdArray[OrcStrongholdIndex] = MapMarkers[MapMarkersIndex]
            OrcStrongholdIndex += 1
        ElseIf IconType == 29 ; GiantCamp
            GiantCampArray[GiantCampIndex] = MapMarkers[MapMarkersIndex]
            GiantCampIndex += 1
        ElseIf IconType == 30 ; Shack
            ShackArray[ShackIndex] = MapMarkers[MapMarkersIndex]
            ShackIndex += 1
        ElseIf IconType == 31 ; NordicTower
            NordicTowerArray[NordicTowerIndex] = MapMarkers[MapMarkersIndex]
            NordicTowerIndex += 1
        ElseIf IconType == 32 ; NordicDwelling
            NordicDwellingArray[NordicDwellingIndex] = MapMarkers[MapMarkersIndex]
            NordicDwellingIndex += 1
        ElseIf IconType == 33 ; Docks
            DocksArray[DocksIndex] = MapMarkers[MapMarkersIndex]
            DocksIndex += 1
        ElseIf IconType == 34 ; Shrine
            ShrineArray[ShrineIndex] = MapMarkers[MapMarkersIndex]
            ShrineIndex += 1
        ElseIf IconType == 35 || IconType == 37 || IconType == 39 || IconType == 41 || IconType == 43 || IconType == 45 || IconType == 47 || IconType == 49 || IconType == 51 ; Castles
            CastleArray[CastleIndex] = MapMarkers[MapMarkersIndex]
            CastleIndex += 1
        ElseIf IconType == 36 || IconType == 38 || IconType == 40 || IconType == 42 || IconType == 44 || IconType == 46 || IconType == 48 || IconType == 50 || IconType == 52 ; Capitols
            CapitolArray[CapitolIndex] = MapMarkers[MapMarkersIndex]
            CapitolIndex += 1
        ElseIf IconType == 53 || IconType == 54 || IconType == 55 || IconType == 56 || IconType == 57 || IconType == 58 ; DLC02
            DLC02Array[DLC02Index] = MapMarkers[MapMarkersIndex]
            DLC02Index += 1
        Else ; any other -> Misc
            MiscArray[MiscIndex] = MapMarkers[MapMarkersIndex]
            MiscIndex += 1
        EndIf
        MapMarkersIndex += 1
    EndWhile

    MiscArray           = PapyrusUtil.ResizeObjRefArray(MiscArray, MiscIndex)
    TownArray           = PapyrusUtil.ResizeObjRefArray(TownArray, TownIndex)
    SettlementArray     = PapyrusUtil.ResizeObjRefArray(SettlementArray, SettlementIndex)
    CaveArray           = PapyrusUtil.ResizeObjRefArray(CaveArray, CaveIndex)
    CampArray           = PapyrusUtil.ResizeObjRefArray(CampArray, CampIndex)
    FortArray           = PapyrusUtil.ResizeObjRefArray(FortArray, FortIndex)
    NordicRuinsArray    = PapyrusUtil.ResizeObjRefArray(NordicRuinsArray, NordicRuinsIndex)
    DwemerRuinArray     = PapyrusUtil.ResizeObjRefArray(DwemerRuinArray, DwemerRuinIndex)
    ShipwreckArray      = PapyrusUtil.ResizeObjRefArray(ShipwreckArray, ShipwreckIndex)
    GroveArray          = PapyrusUtil.ResizeObjRefArray(GroveArray, GroveIndex)
    LandmarkArray       = PapyrusUtil.ResizeObjRefArray(LandmarkArray, LandmarkIndex)
    DragonLairArray     = PapyrusUtil.ResizeObjRefArray(DragonLairArray, DragonLairIndex)
    FarmArray           = PapyrusUtil.ResizeObjRefArray(FarmArray, FarmIndex)
    WoodMillArray       = PapyrusUtil.ResizeObjRefArray(WoodMillArray, WoodMillIndex)
    MineArray           = PapyrusUtil.ResizeObjRefArray(MineArray, MineIndex)
    ImperialCampArray   = PapyrusUtil.ResizeObjRefArray(ImperialCampArray, ImperialCampIndex)
    StormcloakCampArray = PapyrusUtil.ResizeObjRefArray(StormcloakCampArray, StormcloakCampIndex)
    DoomstoneArray      = PapyrusUtil.ResizeObjRefArray(DoomstoneArray, DoomstoneIndex)
    WheatMillArray      = PapyrusUtil.ResizeObjRefArray(WheatMillArray, WheatMillIndex)
    StableArray         = PapyrusUtil.ResizeObjRefArray(StableArray, StableIndex)
    ImperialTowerArray  = PapyrusUtil.ResizeObjRefArray(ImperialTowerArray, ImperialTowerIndex)
    ClearingArray       = PapyrusUtil.ResizeObjRefArray(ClearingArray, ClearingIndex)
    PassArray           = PapyrusUtil.ResizeObjRefArray(PassArray, PassIndex)
    LighthouseArray     = PapyrusUtil.ResizeObjRefArray(LighthouseArray, LighthouseIndex)
    OrcStrongholdArray  = PapyrusUtil.ResizeObjRefArray(OrcStrongholdArray, OrcStrongholdIndex)
    GiantCampArray      = PapyrusUtil.ResizeObjRefArray(GiantCampArray, GiantCampIndex)
    ShackArray          = PapyrusUtil.ResizeObjRefArray(ShackArray, ShackIndex)
    NordicTowerArray    = PapyrusUtil.ResizeObjRefArray(NordicTowerArray, NordicTowerIndex)
    NordicDwellingArray = PapyrusUtil.ResizeObjRefArray(NordicDwellingArray, NordicDwellingIndex)
    DocksArray          = PapyrusUtil.ResizeObjRefArray(DocksArray, DocksIndex)
    ShrineArray         = PapyrusUtil.ResizeObjRefArray(ShrineArray, ShrineIndex)
    CastleArray         = PapyrusUtil.ResizeObjRefArray(CastleArray, CastleIndex)
    CapitolArray        = PapyrusUtil.ResizeObjRefArray(CapitolArray, CapitolIndex)
    DLC02Array          = PapyrusUtil.ResizeObjRefArray(DLC02Array, DLC02Index)
EndFunction

Function SortActivators()
    ContainersArray         = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 28, 3500.0)
    TotalNPCArray           = PO3_SKSEFunctions.FindAllReferencesOfFormType(Game.GetPlayer(), 43, 3500.0)
    LootNPCArray            = new ObjectReference[1]
    AliveNPCArray           = new ObjectReference[1]
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
