# Skyrim Accessibility Controls

Reference for every hotkey and in-menu action shipped by Skyrim Accessibility.

All hotkeys use US QWERTY scan codes and are registered while you are in normal gameplay (not inside a Skyrim menu). Inside the mod's own menus you can move with the keys listed under each menu section.

## Global hotkeys

- `V`. Open or close the Accessibility Menu. While the menu is open, the player's normal controls are disabled.
- `L`. Open the Initialisation Menu (walkthroughs, debug info, Clairvoyance toggle).

## Accessibility Menu (`V`)

The Accessibility Menu is a four-level browser: top-level menu, sub-menu, entry list, and per-entry action.

### Navigation

- `Z` / `C`. Previous / next top-level menu (Accessibility, Travel, Utility, Settings).
- `A` / `D`. Previous / next sub-menu within the current top-level menu.
- `W` / `S`. Previous / next entry in the current sub-menu's list.
- Each key press speaks the new name through Skyrim's notification channel.

### Entry actions

- `Space`. Select. Default action for the current entry (loot, activate, open lock options, etc.).
- `Left Ctrl`. Teleport. Move the player to the current entry's location.
- `Q`. Place a marker at the current entry's position.
- `E`. Walk to the current entry.
- `F`. Follow the current entry (NPCs).
- `R`. Lock the camera onto the current entry.

### Top-level menu layout

The MenuListRefresh function in `AccessibilityScriptAccessibilityMenu.psc` populates the four menus:

1. Accessibility Menu (containers, NPCs, doors, items, activators, and similar pickers).
2. Travel Menu (replaces the older standalone Fast Travel Menu).
3. Utility Menu.
4. Settings Menu.

## Initialisation Menu (`L`)

A UIExtensions list menu with three entries.

- **Walkthroughs**. Sub-menu with one entry today: "Main Quest Start", which teleports the player past the Helgen intro to a known safe position.
- **Debug Menu**. Sub-menu with one entry: "Debug Info", which speaks the player's current X, Y, Z and then triggers the mapped Screenshot key.
- **Clairvoyance**. Sub-menu with two entries: "Enable" and "Disable". Enabling starts a 5-second auto-cast loop of the AccessibilityClairvoyance spell. Disabling stops it.

## Lockpicking

When you open a lock entry through the Accessibility Menu, the lockpick action runs from the menu with a 25 percent success chance per attempt. On failure, the lockpick menu re-opens so you can try again or step out.

## Walk-in-Place notifier

`AccessibilityScriptNotifierWalkInPlace.psc` watches the player's mapped Forward, Back, Strafe Left, and Strafe Right keys and emits a sound when the player is "walking in place" (input held without movement). The keys come from `Input.GetMappedKey`, so they follow whatever you have bound in Skyrim's Controls menu.

## Scan code reference

For maintainers and contributors. These are the DXScanCode values used in `RegisterForKey` calls.

- `L` = 38
- `V` = 47
- `W` = 17, `A` = 30, `S` = 31, `D` = 32
- `Z` = 44, `C` = 46
- `Q` = 16, `E` = 18
- `F` = 33, `R` = 19
- `Space` = 57
- `Left Ctrl` = 29
