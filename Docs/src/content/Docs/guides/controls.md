---
title: Controls Reference
description: Every hotkey Skyrim Accessibility adds, including in-menu navigation and helper menu actions.
---


Every hotkey the mod adds, and what each key does inside the mod's menus.

> Many of the keys you will press during normal play (the nearby-object scanner on Page Up / Page Down / Home / End, autowalk on Shift + Home, the enemy locator on X, and the menu / journal reading) come from SkyrimTTS, not from this mod. SkyrimTTS is a required companion mod; see its [GUIDE.md](https://github.com/DioKyrie-Git/SkyrimTTS/blob/main/GUIDE.md) for that full key reference.

The hotkeys assume a US QWERTY keyboard layout. They only work during normal gameplay, not while you are inside a Skyrim menu (inventory, dialogue, pause menu, and so on). Inside the mod's own menus the navigation keys take over.

## Global hotkeys

- `V`. Open or close the Accessibility Menu. While the menu is open, your normal movement and combat controls are paused.
- `L`. Open the helper menu (intro walkthrough, position info, Clairvoyance on/off).

## Accessibility Menu (`V`)

The Accessibility Menu has four levels: a top-level menu, a sub-menu inside it, a list of entries inside that, and an action you do to the current entry.

### Moving through the menu

- `Z` / `C`. Previous / next top-level menu (Accessibility, Travel, Utility, Settings).
- `A` / `D`. Previous / next sub-menu inside the current top-level menu.
- `W` / `S`. Previous / next entry in the current sub-menu.
- The mod speaks the new name through the game's notification area each time you move.

### Doing things to the current entry

- `Space`. Select. The default action for the entry (loot it, activate it, open lock options, and so on).
- `Left Ctrl`. Teleport to the entry.
- `Q`. Place a marker at the entry.
- `E`. Walk to the entry.
- `F`. Follow the entry (people).
- `R`. Lock the camera onto the entry.

### Top-level menu list

1. **Accessibility Menu**. Pickers for nearby containers, people, doors, items, and other interactable objects.
2. **Travel Menu**. Fast travel destinations.
3. **Utility Menu**. Utility actions.
4. **Settings Menu**. Mod settings.

## Helper menu (`L`)

A short list menu with three choices.

- **Walkthroughs**. One choice today: "Main Quest Start", which teleports you past the Helgen intro to a safe spot so you can begin playing.
- **Position info**. Speaks your current position in the world and takes a screenshot. Useful when reporting a bug.
- **Clairvoyance**. Turn the auto-cast Clairvoyance guide spell on or off. When on, the mod casts Clairvoyance every 5 seconds and you hear a sound trail toward your current quest marker.

### Moving through list menus

The helper menu and its sub-menus use Skyrim's standard list-menu controls:

- `Up Arrow` / `Down Arrow`. Previous / next entry.
- `Enter`. Select the current entry.
- `Tab` or `Escape`. Close the list without picking anything.

These controls also apply to the lockpick options menu and any other list dialogue the mod opens.

## Casting Clairvoyance manually

The mod adds Clairvoyance to your spellbook as a regular spell. You can equip it from your magic menu and cast it the same way you cast any other spell, even when auto-cast is off. The auto-cast toggle in the helper menu just saves you from re-casting every few seconds.

## Lockpicking

When you select a locked door or container through the Accessibility Menu, the mod tries to pick it with a 25 percent success chance per attempt. If you fail, the lock options menu re-opens so you can try again or back out.

## Walking-in-place notifier

The mod plays a sound when you hold a movement key (forward, back, or either strafe key) but your character is not actually moving. The mod reads your current key bindings from Skyrim's Controls menu, so this works no matter how you have re-bound those keys.

## Scan code reference

For developers maintaining the mod, the DXScanCode values registered for each key are:

- `L` = 38
- `V` = 47
- `W` = 17, `A` = 30, `S` = 31, `D` = 32
- `Z` = 44, `C` = 46
- `Q` = 16, `E` = 18
- `F` = 33, `R` = 19
- `Space` = 57
- `Left Ctrl` = 29
