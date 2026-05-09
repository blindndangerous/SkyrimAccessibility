Scriptname AccessibilityScriptFastTravelMenu extends ReferenceAlias

Import UIExtensions
Import UIListMenu

; Pagination variables
Int CurrentPage = 0
Int ItemsPerPage = 8
ObjectReference[] MapMarkers Auto

Event OnInit()
    RegisterForKey(34) ; G Key
    MapMarkers = DbSkseFunctions.GetAllMapMarkerRefs(-1, -1)
EndEvent

Event OnKeyDown(Int KeyCode)
    If KeyCode == 34 && !Utility.IsInMenuMode()
        Utility.Wait(0.1)
        ShowFastTravelMenu()
    EndIf
EndEvent

Function ShowFastTravelMenu()
    UIListMenu FastTravelMenu = UIExtensions.GetMenu("UIListMenu") as UIListMenu
    FastTravelMenu.ResetMenu()
    If MapMarkers.Length == 0
        Debug.Notification("No map markers found.")
        Return
    EndIf
    ; Calculate range for current page
    Int TotalItems = MapMarkers.Length
    Int StartIndex = CurrentPage * ItemsPerPage
    Int EndIndex = StartIndex + ItemsPerPage - 1
    If EndIndex >= TotalItems
        EndIndex = TotalItems - 1
    EndIf

    ; Add map markers for this page
    Int Index = StartIndex
    While Index <= EndIndex
        String Name = DbSkseFunctions.GetMapMarkerName(MapMarkers[Index])
        FastTravelMenu.AddEntryItem(Name)
        Index += 1
    EndWhile

    ; Add navigation entries
    FastTravelMenu.AddEntryItem("<< Previous Page")
    FastTravelMenu.AddEntryItem("Next Page >>")

    ; Show menu and get selection
    FastTravelMenu.OpenMenu()
    Int Selection = FastTravelMenu.GetResultInt()

    If Selection >= 0
        Int MarkersOnPage = (EndIndex - StartIndex + 1)
        If Selection < MarkersOnPage
            ; User selected a map marker
            Int RealIndex = StartIndex + Selection
            Game.FastTravel(MapMarkers[RealIndex])
        Else
            ; User selected a navigation entry
            Int NavIndex = Selection - MarkersOnPage
            If NavIndex == 0 && CurrentPage > 0
                CurrentPage -= 1
                ShowFastTravelMenu()   ; Show previous page
            ElseIf NavIndex == 0 && CurrentPage == 0
                ShowFastTravelMenu()   ; Show first page
            ElseIf NavIndex == 1 && (EndIndex < TotalItems - 1)
                CurrentPage += 1
                ShowFastTravelMenu()   ; Show next page
            ElseIf NavIndex == 1 && (EndIndex >= TotalItems - 1)
                ShowFastTravelMenu()   ; Show last page
            EndIf
        EndIf
    EndIf
EndFunction
