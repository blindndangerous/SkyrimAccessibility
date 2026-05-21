# Skyrim Accessibility Dependencies

Required mods for Skyrim Accessibility to run. Install all before launching the game.

## Runtime libraries (place in game folder beside `SkyrimSE.exe`)

- **SKSE**. Skyrim Script Extender. Required runtime for the SKSE plugin shipped by this mod.
  - Download: <https://www.nexusmods.com/skyrimspecialedition/mods/30379?tab=files>
  - Pick the SKSE build that matches your game runtime (SE 1.5.97 or AE 1.6.x). The wrong build will refuse to load.
- **nvdaControllerClient.dll**. Speech bridge for NVDA users.
  - Download: <https://download.nvaccess.org/releases/stable/>
  - Extract `nvdaControllerClient.dll` next to `SkyrimSE.exe` (same folder as `skse64_loader.exe`).

## Mods (install via mod manager)

- **Address Library for SKSE Plugins**. Version database for SKSE plugins.
  - <https://www.nexusmods.com/skyrimspecialedition/mods/32444?tab=files>
  - Pick the file matching your runtime: "All in one (Anniversary Edition)" for AE 1.6.x, "All in one (Special Edition)" for SE 1.5.97. A mismatched version causes the plugin to fail to load silently.
- **Power Of Three's Papyrus Extender**. Papyrus utility functions used by accessibility scripts.
  - <https://www.nexusmods.com/skyrimspecialedition/mods/22854?tab=files>
- **Power Of Three's Tweaks**. Runtime tweaks used by the mod.
  - <https://www.nexusmods.com/skyrimspecialedition/mods/51073?tab=files>
- **UIExtensions**. List-menu UI primitives used by accessibility menus.
  - <https://www.nexusmods.com/skyrimspecialedition/mods/17561?tab=files>
- **Media Keys Fix**. Keeps media keys working while the game has focus.
  - <https://www.nexusmods.com/skyrimspecialedition/mods/92948?tab=files>
- **Better MessageBox Controls**. Keyboard navigation for in-game message boxes.
  - <https://www.nexusmods.com/skyrimspecialedition/mods/1428?tab=files>
- **Dylbills Papyrus Functions**. Extra Papyrus helpers.
  - <https://www.nexusmods.com/skyrimspecialedition/mods/65410?tab=files>
- **Stay At The System Page - AE**. Keeps the pause menu on the System page after closing it.
  - <https://www.nexusmods.com/skyrimspecialedition/mods/67883?tab=files>

## Companion mod (recommended)

- **SkyrimTTS**. Text-to-speech bridge.
  - <https://github.com/DioKyrie-Git/SkyrimTTS/releases>
