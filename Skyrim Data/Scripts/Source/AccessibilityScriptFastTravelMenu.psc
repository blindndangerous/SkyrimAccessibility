Scriptname AccessibilityScriptFastTravelMenu extends ReferenceAlias

Import UIExtensions
Import UIListMenu

; Pagination variables
Int CurrentPage = 0
Int ItemsPerPage = 8
ObjectReference[] MapMarkers Auto

; Category arrays and their fill counts
ObjectReference[] MiscArray
Int MiscIndex = 0
ObjectReference[] CityArray
Int CityIndex = 0
ObjectReference[] TownArray
Int TownIndex = 0
ObjectReference[] SettlementArray
Int SettlementIndex = 0
ObjectReference[] CaveArray
Int CaveIndex = 0
ObjectReference[] CampArray
Int CampIndex = 0
ObjectReference[] FortArray
Int FortIndex = 0
ObjectReference[] NordicRuinsArray
Int NordicRuinsIndex = 0
ObjectReference[] DwemerRuinArray
Int DwemerRuinIndex = 0
ObjectReference[] ShipwreckArray
Int ShipwreckIndex = 0
ObjectReference[] GroveArray
Int GroveIndex = 0
ObjectReference[] LandmarkArray
Int LandmarkIndex = 0
ObjectReference[] DragonLairArray
Int DragonLairIndex = 0
ObjectReference[] FarmArray
Int FarmIndex = 0
ObjectReference[] WoodMillArray
Int WoodMillIndex = 0
ObjectReference[] MineArray
Int MineIndex = 0
ObjectReference[] ImperialCampArray
Int ImperialCampIndex = 0
ObjectReference[] StormcloakCampArray
Int StormcloakCampIndex = 0
ObjectReference[] DoomstoneArray
Int DoomstoneIndex = 0
ObjectReference[] WheatMillArray
Int WheatMillIndex = 0
ObjectReference[] SmelterArray
Int SmelterIndex = 0
ObjectReference[] StableArray
Int StableIndex = 0
ObjectReference[] ImperialTowerArray
Int ImperialTowerIndex = 0
ObjectReference[] ClearingArray
Int ClearingIndex = 0
ObjectReference[] PassArray
Int PassIndex = 0
ObjectReference[] AlterArray
Int AlterIndex = 0
ObjectReference[] RockArray
Int RockIndex = 0
ObjectReference[] LighthouseArray
Int LighthouseIndex = 0
ObjectReference[] OrcStrongholdArray
Int OrcStrongholdIndex = 0
ObjectReference[] GiantCampArray
Int GiantCampIndex = 0
ObjectReference[] ShackArray
Int ShackIndex = 0
ObjectReference[] NordicTowerArray
Int NordicTowerIndex = 0
ObjectReference[] NordicDwellingArray
Int NordicDwellingIndex = 0
ObjectReference[] DocksArray
Int DocksIndex = 0
ObjectReference[] ShrineArray
Int ShrineIndex = 0
ObjectReference[] CastleArray
Int CastleIndex = 0
ObjectReference[] CapitolArray
Int CapitolIndex = 0
ObjectReference[] DLC02Array
Int DLC02Index = 0
ObjectReference[] BigCaveArray
Int BigCaveIndex = 0
ObjectReference[] LockArray
Int LockIndex = 0
ObjectReference[] FlashingQuestMarkerArray
Int FlashingQuestMarkerIndex = 0

Event OnInit()
    RegisterForKey(24) ; O Key
    MapMarkers = DbSkseFunctions.GetAllMapMarkerRefs(-1, -1)
    Int MapMarkersIndex = 0

    ; Initialize all arrays
    MiscArray = new ObjectReference[128]
    CityArray = new ObjectReference[128]
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
    SmelterArray = new ObjectReference[128]
    StableArray = new ObjectReference[128]
    ImperialTowerArray = new ObjectReference[128]
    ClearingArray = new ObjectReference[128]
    PassArray = new ObjectReference[128]
    AlterArray = new ObjectReference[128]
    RockArray = new ObjectReference[128]
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
    BigCaveArray = new ObjectReference[128]
    LockArray = new ObjectReference[128]
    FlashingQuestMarkerArray = new ObjectReference[128]

    While MapMarkersIndex < MapMarkers.Length
        Int IconType = DbSkseFunctions.GetMapMarkerIconType(MapMarkers[MapMarkersIndex])
        If IconType == 0 || IconType == 60 || IconType == 62 || IconType == 64 || IconType == 65 || IconType == 66 ; Misc
            MiscArray[MiscIndex] = MapMarkers[MapMarkersIndex]
            MiscIndex += 1
        ElseIf IconType == 1 ; City
            CityArray[CityIndex] = MapMarkers[MapMarkersIndex]
            CityIndex += 1
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
        ElseIf IconType == 20 ; Smelter
            SmelterArray[SmelterIndex] = MapMarkers[MapMarkersIndex]
            SmelterIndex += 1
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
        ElseIf IconType == 25 ; Alter
            AlterArray[AlterIndex] = MapMarkers[MapMarkersIndex]
            AlterIndex += 1
        ElseIf IconType == 26 ; Rock
            RockArray[RockIndex] = MapMarkers[MapMarkersIndex]
            RockIndex += 1
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
        ElseIf IconType == 59 ; BigCave
            BigCaveArray[BigCaveIndex] = MapMarkers[MapMarkersIndex]
            BigCaveIndex += 1
        ElseIf IconType == 61 ; Lock
            LockArray[LockIndex] = MapMarkers[MapMarkersIndex]
            LockIndex += 1
        ElseIf IconType == 63 ; FlashingQuestMarker
            FlashingQuestMarkerArray[FlashingQuestMarkerIndex] = MapMarkers[MapMarkersIndex]
            FlashingQuestMarkerIndex += 1
        Else ; BigCircle / any other -> Misc
            MiscArray[MiscIndex] = MapMarkers[MapMarkersIndex]
            MiscIndex += 1
        EndIf
        MapMarkersIndex += 1
    EndWhile
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 24 && !Utility.IsInMenuMode()
        Utility.Wait(0.1)
        ShowFastTravelMenu()
    EndIf
EndEvent

Function ShowFastTravelMenu()
    UIListMenu FastTravelMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    String[] SubMenus = new String[41]
    SubMenus[0] = "Misc"
    SubMenus[1] = "City"
    SubMenus[2] = "Town"
    SubMenus[3] = "Settlement"
    SubMenus[4] = "Cave"
    SubMenus[5] = "Camp"
    SubMenus[6] = "Fort"
    SubMenus[7] = "Nordic Ruins"
    SubMenus[8] = "Dwemer Ruin"
    SubMenus[9] = "Shipwreck"
    SubMenus[10] = "Grove"
    SubMenus[11] = "Landmark"
    SubMenus[12] = "Dragon Lair"
    SubMenus[13] = "Farm"
    SubMenus[14] = "Wood Mill"
    SubMenus[15] = "Mine"
    SubMenus[16] = "Imperial Camp"
    SubMenus[17] = "Stormcloak Camp"
    SubMenus[18] = "Doomstone"
    SubMenus[19] = "Wheat Mill"
    SubMenus[20] = "Smelter"
    SubMenus[21] = "Stable"
    SubMenus[22] = "Imperial Tower"
    SubMenus[23] = "Clearing"
    SubMenus[24] = "Pass"
    SubMenus[25] = "Alter"
    SubMenus[26] = "Rock"
    SubMenus[27] = "Lighthouse"
    SubMenus[28] = "Orc Stronghold"
    SubMenus[29] = "Giant Camp"
    SubMenus[30] = "Shack"
    SubMenus[31] = "Nordic Tower"
    SubMenus[32] = "Nordic Dwelling"
    SubMenus[33] = "Docks"
    SubMenus[34] = "Shrine"
    SubMenus[35] = "Castle"
    SubMenus[36] = "Capitol"
    SubMenus[37] = "DLC02"
    SubMenus[38] = "Big Cave"
    SubMenus[39] = "Lock"
    SubMenus[40] = "Flashing Quest Marker"
    Int Index = 0
    While Index < SubMenus.Length
        FastTravelMenu.AddEntryItem(SubMenus[Index])
        Index += 1
    EndWhile
    FastTravelMenu.OpenMenu()
    Int Selection = FastTravelMenu.GetResultInt()
    If Selection == 0
        Misc()
    ElseIf Selection == 1
        City()
    ElseIf Selection == 2
        Town()
    ElseIf Selection == 3
        Settlement()
    ElseIf Selection == 4
        Cave()
    ElseIf Selection == 5
        Camp()
    ElseIf Selection == 6
        Fort()
    ElseIf Selection == 7
        NordicRuins()
    ElseIf Selection == 8
        DwemerRuin()
    ElseIf Selection == 9
        Shipwreck()
    ElseIf Selection == 10
        Grove()
    ElseIf Selection == 11
        Landmark()
    ElseIf Selection == 12
        DragonLair()
    ElseIf Selection == 13
        Farm()
    ElseIf Selection == 14
        WoodMill()
    ElseIf Selection == 15
        Mine()
    ElseIf Selection == 16
        ImperialCamp()
    ElseIf Selection == 17
        StormcloakCamp()
    ElseIf Selection == 18
        Doomstone()
    ElseIf Selection == 19
        WheatMill()
    ElseIf Selection == 20
        Smelter()
    ElseIf Selection == 21
        Stable()
    ElseIf Selection == 22
        ImperialTower()
    ElseIf Selection == 23
        Clearing()
    ElseIf Selection == 24
        Pass()
    ElseIf Selection == 25
        Alter()
    ElseIf Selection == 26
        Rock()
    ElseIf Selection == 27
        Lighthouse()
    ElseIf Selection == 28
        OrcStronghold()
    ElseIf Selection == 29
        GiantCamp()
    ElseIf Selection == 30
        Shack()
    ElseIf Selection == 31
        NordicTower()
    ElseIf Selection == 32
        NordicDwelling()
    ElseIf Selection == 33
        Docks()
    ElseIf Selection == 34
        Shrine()
    ElseIf Selection == 35
        Castle()
    ElseIf Selection == 36
        Capitol()
    ElseIf Selection == 37
        DLC02()
    ElseIf Selection == 38
        BigCave()
    ElseIf Selection == 39
        Lock()
    ElseIf Selection == 40
        FlashingQuestMarker()
    EndIf
EndFunction

Function ShowCategoryFastTravel(ObjectReference[] CategoryArray, Int ItemCount)
    UIListMenu FastTravelMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    FastTravelMenu.ResetMenu()
    If ItemCount <= 0
        Debug.Notification("No markers in this category.")
        Return
    EndIf
    Int TotalItems = ItemCount
    Int StartIndex = CurrentPage * ItemsPerPage
    Int EndIndex = StartIndex + ItemsPerPage - 1
    If EndIndex >= TotalItems
        EndIndex = TotalItems - 1
    EndIf

    Int Index = StartIndex
    While Index <= EndIndex
        String Name = DbSkseFunctions.GetMapMarkerName(CategoryArray[Index])
        If (CategoryArray[Index].IsMapMarkerVisible() == True && CategoryArray[Index].CanFastTravelToMarker() == True)
            Name = Name + " Discovered"
        ElseIf (CategoryArray[Index].IsMapMarkerVisible() == True && CategoryArray[Index].CanFastTravelToMarker() == False)
            Name = Name + " Known"
        Else
            Name = Name + " Unknown"
        EndIf
        FastTravelMenu.AddEntryItem(Name)
        Index += 1
    EndWhile

    FastTravelMenu.AddEntryItem("<< Previous Page")
    FastTravelMenu.AddEntryItem("Next Page >>")

    FastTravelMenu.OpenMenu()
    Int Selection = FastTravelMenu.GetResultInt()

    If Selection >= 0
        Int MarkersOnPage = (EndIndex - StartIndex + 1)
        If Selection < MarkersOnPage
            Int RealIndex = StartIndex + Selection
            Game.FastTravel(CategoryArray[RealIndex])
        Else
            Int NavIndex = Selection - MarkersOnPage
            If NavIndex == 0 && CurrentPage > 0
                CurrentPage -= 1
                ShowCategoryFastTravel(CategoryArray, ItemCount)
            ElseIf NavIndex == 0 && CurrentPage == 0
                ShowCategoryFastTravel(CategoryArray, ItemCount)
            ElseIf NavIndex == 1 && (EndIndex < TotalItems - 1)
                CurrentPage += 1
                ShowCategoryFastTravel(CategoryArray, ItemCount)
            ElseIf NavIndex == 1 && (EndIndex >= TotalItems - 1)
                ShowCategoryFastTravel(CategoryArray, ItemCount)
            EndIf
        EndIf
    EndIf
EndFunction

Function Misc()
    CurrentPage = 0
    ShowCategoryFastTravel(MiscArray, MiscIndex)
EndFunction

Function City()
    CurrentPage = 0
    ShowCategoryFastTravel(CityArray, CityIndex)
EndFunction

Function Town()
    CurrentPage = 0
    ShowCategoryFastTravel(TownArray, TownIndex)
EndFunction

Function Settlement()
    CurrentPage = 0
    ShowCategoryFastTravel(SettlementArray, SettlementIndex)
EndFunction

Function Cave()
    CurrentPage = 0
    ShowCategoryFastTravel(CaveArray, CaveIndex)
EndFunction

Function Camp()
    CurrentPage = 0
    ShowCategoryFastTravel(CampArray, CampIndex)
EndFunction

Function Fort()
    CurrentPage = 0
    ShowCategoryFastTravel(FortArray, FortIndex)
EndFunction

Function NordicRuins()
    CurrentPage = 0
    ShowCategoryFastTravel(NordicRuinsArray, NordicRuinsIndex)
EndFunction

Function DwemerRuin()
    CurrentPage = 0
    ShowCategoryFastTravel(DwemerRuinArray, DwemerRuinIndex)
EndFunction

Function Shipwreck()
    CurrentPage = 0
    ShowCategoryFastTravel(ShipwreckArray, ShipwreckIndex)
EndFunction

Function Grove()
    CurrentPage = 0
    ShowCategoryFastTravel(GroveArray, GroveIndex)
EndFunction

Function Landmark()
    CurrentPage = 0
    ShowCategoryFastTravel(LandmarkArray, LandmarkIndex)
EndFunction

Function DragonLair()
    CurrentPage = 0
    ShowCategoryFastTravel(DragonLairArray, DragonLairIndex)
EndFunction

Function Farm()
    CurrentPage = 0
    ShowCategoryFastTravel(FarmArray, FarmIndex)
EndFunction

Function WoodMill()
    CurrentPage = 0
    ShowCategoryFastTravel(WoodMillArray, WoodMillIndex)
EndFunction

Function Mine()
    CurrentPage = 0
    ShowCategoryFastTravel(MineArray, MineIndex)
EndFunction

Function ImperialCamp()
    CurrentPage = 0
    ShowCategoryFastTravel(ImperialCampArray, ImperialCampIndex)
EndFunction

Function StormcloakCamp()
    CurrentPage = 0
    ShowCategoryFastTravel(StormcloakCampArray, StormcloakCampIndex)
EndFunction

Function Doomstone()
    CurrentPage = 0
    ShowCategoryFastTravel(DoomstoneArray, DoomstoneIndex)
EndFunction

Function WheatMill()
    CurrentPage = 0
    ShowCategoryFastTravel(WheatMillArray, WheatMillIndex)
EndFunction

Function Smelter()
    CurrentPage = 0
    ShowCategoryFastTravel(SmelterArray, SmelterIndex)
EndFunction

Function Stable()
    CurrentPage = 0
    ShowCategoryFastTravel(StableArray, StableIndex)
EndFunction

Function ImperialTower()
    CurrentPage = 0
    ShowCategoryFastTravel(ImperialTowerArray, ImperialTowerIndex)
EndFunction

Function Clearing()
    CurrentPage = 0
    ShowCategoryFastTravel(ClearingArray, ClearingIndex)
EndFunction

Function Pass()
    CurrentPage = 0
    ShowCategoryFastTravel(PassArray, PassIndex)
EndFunction

Function Alter()
    CurrentPage = 0
    ShowCategoryFastTravel(AlterArray, AlterIndex)
EndFunction

Function Rock()
    CurrentPage = 0
    ShowCategoryFastTravel(RockArray, RockIndex)
EndFunction

Function Lighthouse()
    CurrentPage = 0
    ShowCategoryFastTravel(LighthouseArray, LighthouseIndex)
EndFunction

Function OrcStronghold()
    CurrentPage = 0
    ShowCategoryFastTravel(OrcStrongholdArray, OrcStrongholdIndex)
EndFunction

Function GiantCamp()
    CurrentPage = 0
    ShowCategoryFastTravel(GiantCampArray, GiantCampIndex)
EndFunction

Function Shack()
    CurrentPage = 0
    ShowCategoryFastTravel(ShackArray, ShackIndex)
EndFunction

Function NordicTower()
    CurrentPage = 0
    ShowCategoryFastTravel(NordicTowerArray, NordicTowerIndex)
EndFunction

Function NordicDwelling()
    CurrentPage = 0
    ShowCategoryFastTravel(NordicDwellingArray, NordicDwellingIndex)
EndFunction

Function Docks()
    CurrentPage = 0
    ShowCategoryFastTravel(DocksArray, DocksIndex)
EndFunction

Function Shrine()
    CurrentPage = 0
    ShowCategoryFastTravel(ShrineArray, ShrineIndex)
EndFunction

Function Castle()
    CurrentPage = 0
    ShowCategoryFastTravel(CastleArray, CastleIndex)
EndFunction

Function Capitol()
    CurrentPage = 0
    ShowCategoryFastTravel(CapitolArray, CapitolIndex)
EndFunction

Function DLC02()
    CurrentPage = 0
    ShowCategoryFastTravel(DLC02Array, DLC02Index)
EndFunction

Function BigCave()
    CurrentPage = 0
    ShowCategoryFastTravel(BigCaveArray, BigCaveIndex)
EndFunction

Function Lock()
    CurrentPage = 0
    ShowCategoryFastTravel(LockArray, LockIndex)
EndFunction

Function FlashingQuestMarker()
    CurrentPage = 0
    ShowCategoryFastTravel(FlashingQuestMarkerArray, FlashingQuestMarkerIndex)
EndFunction
