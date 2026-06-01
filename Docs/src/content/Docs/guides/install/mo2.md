---
title: Mod Organizer 2 Install Guide
description: Step-by-step installation guide for Mod Organizer 2.
---

This guide walks you through a full install on Windows using Mod Organizer 2 (MO2) and a screen reader. It is written for blind and low-vision players, so every step uses the keyboard.

## 1. Install Skyrim Special Edition

Buy and install [Skyrim Special Edition](https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/) on Steam.

> [!Note]
> Skyrim Anniversary Edition is the same base game with extra Creation Club content layered on top. This mod works on both Special Edition and Anniversary Edition.

## 2. Install Mod Organizer 2

1. Download the portable build of [Mod Organizer 2.5.2](https://github.com/ModOrganizer2/modorganizer/releases/tag/v2.5.2) (the `.7z` file).
2. Extract the archive to a folder of your choice. Avoid `Program Files` and `Program Files (x86)` because Windows blocks writes there.
3. Open the extracted folder and create a desktop shortcut for `ModOrganizer.exe` so you can launch it without opening the folder every time.

## 3. Create a portable MO2 instance

1. Launch `ModOrganizer.exe`.
2. Choose "Create new instance".
3. Choose "Portable instance".
4. When prompted to pick the game to manage, browse to your Skyrim Special Edition install folder (for example, `D:\Steam\steamapps\common\Skyrim Special Edition`).
5. Select the game edition (Special Edition or Anniversary Edition).
6. When asked where to store mod data, accept the default. It will be the same folder MO2 lives in.
7. Link MO2 to your Nexus Mods account when prompted. This is needed for one-click downloads later.
8. Finish the setup wizard.

## 4. Generate Skyrim's `.ini` files

Skyrim needs to be launched at least once so it can create its config files in `Documents\My Games\Skyrim Special Edition\`.

1. With MO2 running, press Tab until you reach the executable combo box (top-right area of the window).
2. Select "Skyrim" (the Skyrim Launcher).
3. Tab to the Run button and press Space.
4. The launcher opens. You can close it immediately. The `.ini` files are now generated.

## 5. Install SKSE and the NVDA controller bridge

Both of these go into the Skyrim game folder, not into MO2.

1. Download [SKSE (Skyrim Script Extender)](https://www.nexusmods.com/skyrimspecialedition/mods/30379?tab=files). Pick the build that matches your runtime: SE 1.5.97 or AE 1.6.x. The wrong build will refuse to load.
2. Extract the SKSE archive into your Skyrim install folder, next to `SkyrimSE.exe`.
3. Download the latest stable [NVDA Controller Client](https://download.nvaccess.org/releases/stable/). It is a `.zip` file containing several `.dll` files.
4. Extract only `nvdaControllerClient64.dll` (the 64-bit version) into the same Skyrim install folder, next to `SkyrimSE.exe`. Rename it to `nvdaControllerClient.dll` if the mod expects that name.

> [!Note]
> After this step, `SkyrimSE.exe`, `skse64_loader.exe`, and `nvdaControllerClient.dll` should all sit in the same folder.

## 6. Download the required dependency mods

In your web browser, log in to Nexus Mods, then open each mod page below and use "Install via Mod Manager" to send the download to MO2.

- [Address Library for SKSE Plugins](https://www.nexusmods.com/skyrimspecialedition/mods/32444?tab=files). Pick "All in one (Anniversary Edition)" for AE 1.6.x, or "All in one (Special Edition)" for SE 1.5.97. A mismatch silently disables the SKSE plugin.
- [Power Of Three's Papyrus Extender](https://www.nexusmods.com/skyrimspecialedition/mods/22854?tab=files)
- [Power Of Three's Tweaks](https://www.nexusmods.com/skyrimspecialedition/mods/51073?tab=files)
- [UIExtensions](https://www.nexusmods.com/skyrimspecialedition/mods/17561?tab=files)
- [Media Keys Fix](https://www.nexusmods.com/skyrimspecialedition/mods/92948?tab=files)
- [Better MessageBox Controls](https://www.nexusmods.com/skyrimspecialedition/mods/1428?tab=files)
- [Dylbills Papyrus Functions](https://www.nexusmods.com/skyrimspecialedition/mods/65410?tab=files)
- [Stay At The System Page - AE](https://www.nexusmods.com/skyrimspecialedition/mods/67883?tab=files)
- [SkyUI](https://www.nexusmods.com/skyrimspecialedition/mods/12604?tab=files). Required for SkyrimTTS to read menus correctly and for the Mod Configuration Menu (MCM).

## 7. Download Skyrim Accessibility and SkyrimTTS

Both of these are required.

1. Download the latest release of [Skyrim Accessibility](https://github.com/DioKyrie-Git/SkyrimAccessibility/releases) from GitHub.
2. Download the latest release of [SkyrimTTS](https://github.com/DioKyrie-Git/SkyrimTTS/releases) from GitHub.
3. Move both archives into MO2's `downloads` folder (for example, `D:\ModOrganizer2\downloads\`).

## 8. Install all downloaded mods in MO2

1. In MO2, press Tab until you reach the Plugins tab control.
2. Use Left/Right arrows to switch to the Downloads tab.
3. Tab into the downloads list.
4. Use Up/Down arrows to navigate the list.
5. Press Enter on each mod to quick-install it.

> [!Note]
> When you install Skyrim Accessibility, the FOMOD installer offers two steps:
> - "Core Mod Install" is required and installs automatically.
> - "Optional Sounds > Experimental Sounds" is off by default. These ambient cues for items, doors, and similar objects can be loud or distracting. Leave them off for now; you can reinstall later if you want them.

## 9. Enable all mods and plugins

1. With the Mods tree view focused, press Shift+F10 and choose "Enable All Mods".
2. Switch to the Plugins tab using Left/Right arrows.
3. With the plugin tree view focused, press Shift+F10 and choose "Enable All".

## 10. Launch the game

1. Tab to the executable combo box.
2. Select "SKSE".
3. Tab to the Run button and press Space.

Make sure NVDA is running before you launch. If anything does not work, see [Troubleshooting](/SkyrimAccessibility/guides/troubleshooting/).
