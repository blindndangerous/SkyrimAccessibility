# Skyrim Accessibility Mod By Dio Kyrie

An accessibility mod for The Elder Scrolls V: Skyrim Special Edition / Anniversary Edition. It adds keyboard-driven menus, sound cues, and assistive features so blind and low-vision players can play the game.

## Contact

Join the Discord server to test the mod, ask for help, or follow development: <https://discord.gg/ncREHq4cmx>

## Features

- **Intro walkthrough**. Skip past the Helgen opening to a known safe position.
- **Clairvoyance**. A guiding spell that leads you to your current quest marker via a sound trail. Can be toggled to auto-cast every 5 seconds.
- **Accessibility Menu**. A four-level menu (top menu / sub-menu / entry list / per-entry action) covering containers, items, NPCs, doors, activators, fast travel destinations, and settings. Each entry can be selected, teleported to, marked, walked to, followed, or camera-locked.
- **Auto Lockpicking**. Open locks from the Accessibility Menu with a 25% chance per attempt. On failure, the menu re-opens so you can try again.
- **Walking-in-Place notifier**. A sound cue when you hold a movement key without actually moving.
- **Ambient sound markers**. Audio cues for nearby enemies, items, containers, doors, and furniture (rolled out gradually; see [CHANGELOG.md](CHANGELOG.md) for what is shipped per version).

## Hotkeys

- `V`. Open or close the Accessibility Menu (containers, NPCs, items, fast travel, etc.).
- `L`. Open the Initialisation Menu (intro walkthrough, debug info, Clairvoyance toggle).

Inside the Accessibility Menu:

- `Z` / `C`. Previous / next top-level menu.
- `A` / `D`. Previous / next sub-menu.
- `W` / `S`. Previous / next entry in the current sub-menu.
- `Space`. Select. Default action for the current entry.
- `Left Ctrl`. Teleport to the current entry.
- `Q`. Place a marker at the current entry.
- `E`. Walk to the current entry.
- `F`. Follow the current entry (NPCs).
- `R`. Lock the camera onto the current entry.

For the full controls reference, including DXScanCode values, see [Docs/Controls.md](Docs/Controls.md).

## Install

Pick your mod manager and follow the matching guide. Each guide is self-contained, end-to-end.

1. [Mod Organizer 2 install guide](Docs/InstallGuideMO2.md)
2. [Vortex install guide](Docs/InstallGuideVortex.md)

If something does not work, see [Docs/Troubleshooting.md](Docs/Troubleshooting.md).

## Project files

- [CHANGELOG.md](CHANGELOG.md). Version history.
- [Contributing.md](Contributing.md). How to contribute, build the mod from source, and submit changes.
- [License.md](License.md). Per-asset license terms.

## Licenses Notice

Files of Skyrim Accessibility Mod By Dio Kyrie are licensed under different licenses. See [License.md](License.md) for the per-file terms.
