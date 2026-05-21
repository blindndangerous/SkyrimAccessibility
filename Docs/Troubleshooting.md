# Skyrim Accessibility Troubleshooting

Common issues seen during install and first launch. If your problem is not here, ask on the project Discord (link in `Readme.md`).

## NVDA does not speak in the game

- Verify `nvdaControllerClient.dll` is in the same folder as `SkyrimSE.exe` (not in `Data\SKSE\Plugins\`).
- Verify NVDA is running before you launch Skyrim.
- Verify your bitness is right. Use the 64-bit version of `nvdaControllerClient.dll` from the NV Access stable archive.

## The game launches but the mod does nothing

- Confirm you started Skyrim through `skse64_loader.exe` and not through the Steam launcher or `SkyrimSE.exe` directly. The mod's SKSE plugin only loads under SKSE.
- Confirm Address Library is installed and matches your runtime. AE 1.6.x needs the "Anniversary Edition" file; SE 1.5.97 needs the "Special Edition" file. A mismatch silently disables the plugin.
- Check `Documents\My Games\Skyrim Special Edition\SKSE\skse64.log` for plugin load errors.

## Crash on or near the Helgen intro

- There is a known crash in the opening sequence tied to the ambient sound scanners (tracked as issue #4 upstream). Hold off on a fresh start until the upstream SKSE plugin fix lands.
- A no-op script overlay has been used in the past as a workaround, but that workaround is not shipped from `main` and should not be relied on for clean installs.

## Plugin says "not loaded" or "incompatible"

- Wrong SKSE build for your runtime. Reinstall SKSE for the exact runtime your game reports under Help > Version.
- Wrong Address Library variant. See above.
- Missing Visual C++ runtime. Install the latest Microsoft Visual C++ 2015-2022 x64 redistributable.

## CTD on quicksave or fast travel

- Confirm Power Of Three's Papyrus Extender, Power Of Three's Tweaks, and UIExtensions are installed and enabled. Without them the mod's scripts fail mid-call and can drag the engine down with them.
- Confirm `Better MessageBox Controls` and `Stay At The System Page - AE` are present. Their absence does not crash by itself, but several script paths assume them.

## Mod Organizer 2 reports missing masters

- Make sure `accessibility.esp` is enabled in the Plugins pane after you enable the mod in the Mods pane. Enabling one without the other is a common slip in MO2.
- Make sure your load order has `Skyrim.esm` (and `Update.esm`, `Dawnguard.esm`, etc.) loaded first. The Accessibility plugin depends on the base game records.

## I built the SKSE plugin from source but the mod does not see the new `.dll`

- Drop the built `AccessibilityNatives.dll` into `<your-mod>/SKSE/Plugins/` inside MO2 (or directly into `Data/SKSE/Plugins/` if you do not use a mod manager), then re-launch through SKSE.
- If you use Mod Organizer 2, the mod manager overlays a virtual `Data` folder; the system `Data` folder is not what the game reads. Drop the `.dll` into the MO2 mod, not the real `Data`.
- If you changed Papyrus sources, you also need to recompile the `.psc` files to `.pex` with the Papyrus Compiler. The SKSE `.dll` build does not touch Papyrus.

## How to report a new issue

Include:

1. Game runtime (`SkyrimSE.exe` version under Help > Version).
2. SKSE version (`skse64_loader.exe` properties or `skse64.log` header).
3. Mod Organizer 2 or Vortex version.
4. Accessibility mod version (from `meta.ini` or the Nexus download you used).
5. The contents of `Documents\My Games\Skyrim Special Edition\SKSE\skse64.log` from the failing session.
6. Steps you took before the issue showed up.
