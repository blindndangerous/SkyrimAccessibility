# Skyrim Accessibility: Install Guide for Vortex

This guide walks you through a full install on Windows using Vortex and a screen reader. It is written for blind and low-vision players, so every step uses the keyboard.

## 1. Install Skyrim Special Edition

Buy and install [Skyrim Special Edition](https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/) on Steam.

> [!Note]
> Skyrim Anniversary Edition is the same base game with extra Creation Club content layered on top. This mod works on both Special Edition and Anniversary Edition.

## 2. Install SKSE and the NVDA controller bridge

Both of these go into the Skyrim game folder, not into Vortex.

1. Download [SKSE (Skyrim Script Extender)](https://www.nexusmods.com/skyrimspecialedition/mods/30379?tab=files). Pick the build that matches your runtime: SE 1.5.97 or AE 1.6.x. The wrong build will refuse to load.
2. Extract the SKSE archive into your Skyrim install folder, next to `SkyrimSE.exe`.
3. Download the latest stable [NVDA Controller Client](https://download.nvaccess.org/releases/stable/). It is a `.zip` file containing several `.dll` files.
4. Extract only `nvdaControllerClient64.dll` (the 64-bit version) into the same Skyrim install folder, next to `SkyrimSE.exe`. Rename it to `nvdaControllerClient.dll` if the mod expects that name.

> [!Note]
> After this step, `SkyrimSE.exe`, `skse64_loader.exe`, and `nvdaControllerClient.dll` should all sit in the same folder.

## 3. Install Vortex

1. Download the latest [Vortex installer](https://github.com/Nexus-Mods/Vortex/releases) from GitHub.
2. Run the installer.
3. When asked where to install Vortex, accept the default and press Install.
4. Wait for the installer to finish, then launch Vortex.

## 4. Sign in to Nexus Mods

1. In Vortex, press Tab until you reach the Login button, then press Space.
2. Your web browser opens. Log in to Nexus Mods if you are not already signed in.
3. Press the Authorise button.
4. Press the Continue button. Control returns to Vortex.

## 5. Add Skyrim Special Edition to Vortex

1. Press Tab until you reach the Games button and press Space.
2. Press Tab to reach the "Search For Games" field and press Space.
3. Type "Skyrim Special Edition".
4. Press Tab to reach the Unmanaged button for that entry and press Space. Vortex now manages Skyrim.

## 6. Generate Skyrim's `.ini` files

Skyrim needs to be launched at least once so it can create its config files in `Documents\My Games\Skyrim Special Edition\`.

1. In Vortex, press Tab until you reach the Launch button and press Space.
2. The Skyrim Launcher opens. You can close it immediately. The `.ini` files are now generated.

## 7. Download the required dependency mods

In your web browser, open each mod page below and use "Install via Mod Manager" to send the download to Vortex.

- [Address Library for SKSE Plugins](https://www.nexusmods.com/skyrimspecialedition/mods/32444?tab=files). Pick "All in one (Anniversary Edition)" for AE 1.6.x, or "All in one (Special Edition)" for SE 1.5.97. A mismatch silently disables the SKSE plugin.
- [Power Of Three's Papyrus Extender](https://www.nexusmods.com/skyrimspecialedition/mods/22854?tab=files)
- [Power Of Three's Tweaks](https://www.nexusmods.com/skyrimspecialedition/mods/51073?tab=files)
- [UIExtensions](https://www.nexusmods.com/skyrimspecialedition/mods/17561?tab=files)
- [Media Keys Fix](https://www.nexusmods.com/skyrimspecialedition/mods/92948?tab=files)
- [Better MessageBox Controls](https://www.nexusmods.com/skyrimspecialedition/mods/1428?tab=files)
- [Dylbills Papyrus Functions](https://www.nexusmods.com/skyrimspecialedition/mods/65410?tab=files)
- [Stay At The System Page - AE](https://www.nexusmods.com/skyrimspecialedition/mods/67883?tab=files)
- [SkyUI](https://www.nexusmods.com/skyrimspecialedition/mods/12604?tab=files). Required for SkyrimTTS to read menus correctly and for the Mod Configuration Menu (MCM).

## 8. Download Skyrim Accessibility and SkyrimTTS

Both of these are required.

1. Download the latest release of [Skyrim Accessibility](https://github.com/DioKyrie-Git/SkyrimAccessibility/releases) from GitHub.
2. Download the latest release of [SkyrimTTS](https://github.com/DioKyrie-Git/SkyrimTTS/releases) from GitHub.
3. In Vortex, press Tab until you reach the Downloads button and press Space.
4. Press Tab to reach the Open Folder link and press Space. Your file manager opens at Vortex's downloads folder.
5. Move both archives into this folder.

## 9. Install all downloaded mods

1. Back in Vortex, press Tab until you reach the Downloads button and press Space.
2. Press Tab to reach the Install button for each download and press Space.

> [!Note]
> When you install Skyrim Accessibility, the FOMOD installer offers two steps:
> - "Core Mod Install" is required and installs automatically.
> - "Optional Sounds > Experimental Sounds" is off by default. These ambient cues for items, doors, and similar objects can be loud or distracting. Leave them off for now; you can reinstall later if you want them.

## 10. Launch the game

1. Press Tab to reach the Dashboard button and press Space.
2. Press Tab to reach the Launch button and press Space.

Make sure NVDA is running before you launch. If anything does not work, see [Troubleshooting.md](Troubleshooting.md).
