---
title: Troubleshooting
description: Common problems with Skyrim Accessibility install and first launch, and how to fix them.
---


Common problems and how to fix them. If your problem is not here, ask on the project Discord: <https://discord.gg/ncREHq4cmx>.

## NVDA does not speak in the game

- Make sure NVDA is running before you start Skyrim.
- The `nvdaControllerClient.dll` file must sit next to `SkyrimSE.exe` (the game's main executable), not inside any sub-folder.
- Use the 64-bit version of the file (named `nvdaControllerClient64.dll` in the NV Access download). If you have the 32-bit version, replace it.

## The game launches but the mod does nothing

- Make sure you launched the game through `skse64_loader.exe`, not through the Steam shortcut or `SkyrimSE.exe` directly. The mod only works under SKSE.
- Make sure Address Library is installed and matches your game version. Anniversary Edition (1.6.x) needs the "All in one (Anniversary Edition)" file; Special Edition (1.5.97) needs the "All in one (Special Edition)" file. Picking the wrong one silently stops the mod from loading.

## Crash near the start of the game (Helgen intro)

There is a known crash early in the game tied to the mod's nearby-object scanner. The author is working on a fix. For now, if you hit this, ask on the Discord for the current recommended workaround.

## The mod says "not loaded" or "incompatible" in a notification

- Wrong SKSE version for your game. Check your game version under Help > Version in the Skyrim launcher, then reinstall SKSE picking the matching build.
- Wrong Address Library file. See "The game launches but the mod does nothing" above.
- Missing Microsoft Visual C++ runtime. Install the latest "Microsoft Visual C++ 2015-2022 x64" redistributable from Microsoft's website.

## Game crashes when saving or fast travelling

- Make sure all the required mods listed in the install guide are installed and enabled, especially Power Of Three's Papyrus Extender, Power Of Three's Tweaks, and UIExtensions. The Accessibility mod relies on these and crashes if they are missing.

## Mod Organizer 2 says there are missing masters

- Make sure `accessibility.esp` is checked in the right-hand Plugins panel after you enable the mod in the left-hand Mods panel. It is easy to enable one and forget the other.
- Make sure the base Skyrim files (`Skyrim.esm`, `Update.esm`, and the official add-ons) are loaded before `accessibility.esp` in the plugin list. New installs put them in the right order by default.

## How to report a new issue

Open a thread on the project Discord or a GitHub issue with the following info:

1. Your game version (from Help > Version in the Skyrim launcher).
2. Your SKSE version.
3. Which mod manager you use (Mod Organizer 2 or Vortex) and its version.
4. The version of Skyrim Accessibility you installed.
5. The contents of the file `Documents\My Games\Skyrim Special Edition\SKSE\skse64.log` from the failing session.
6. A short description of what you were doing when the issue happened.
