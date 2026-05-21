# Building Skyrim Accessibility from Source

There are two halves to this mod:

1. **SKSE plugin** (`src/`, C++). Built with XMake.
2. **Papyrus scripts** (`Skyrim Data/Scripts/Source/*.psc`). Compiled with the Papyrus Compiler that ships with the Creation Kit.

You can build one without the other. The Papyrus side is the larger half today; the SKSE plugin is currently a scaffold.

## Requirements

- **XMake** 3.0.0 or newer. <https://xmake.io/>
- A C++23 toolchain. On Windows: MSVC (Visual Studio 2022 17.10+) or Clang-CL.
- **Creation Kit** for Skyrim Special Edition (free on Steam). Provides the Papyrus Compiler.
  - Alternatively, the **Papyrus Compiler App SSE** (Nexus) and **Champollion GUI** for decompiling.

Optional:

- **Nix** with flakes enabled, for a reproducible dev shell on Linux. The repo ships `flake.nix`.

## Source layout

- `src/`. C++ sources for the SKSE plugin.
- `lib/commonlibsse/`. git submodule; the CommonLibSSE library used by the plugin.
- `Skyrim Data/Scripts/Source/`. Papyrus sources.
- `Skyrim Data/`. game data tree (esp lives in the mod's release zip, not in the repo).
- `xmake.lua`. build script for the SKSE plugin.
- `flake.nix`. Nix dev shell + package definition.

## Cloning

The repo uses git submodules for CommonLibSSE.

```bat
git clone --recurse-submodules https://github.com/DioKyrie-Git/SkyrimAccessibility
cd SkyrimAccessibility
```

If you already cloned without `--recurse-submodules`:

```bat
git submodule update --init --recursive
```

## Building the SKSE plugin

### Windows (native)

```bat
xmake f -m release
xmake build
```

Modes:

- `release`. optimised, no `.pdb`.
- `releasedbg`. optimised, ships a `.pdb` for debuggers.
- `debug`. unoptimised, full debug info.

Outputs:

- `build/windows/x64/release/commonlibsse-template.dll` (current target name; will be renamed when the C++ port lands).
- `build/windows/x64/releasedbg/commonlibsse-template.dll` and matching `.pdb`.

### Linux via Nix

```bash
nix develop -c xmake build
```

This enters the dev shell defined in `flake.nix`. The shell brings in the Papyrus compiler from the `russo-2025/papyrus-compiler` flake; XMake itself must be on your system (the comment in `flake.nix` notes this).

> Note: line endings matter. The `flake.nix` and `xmake.lua` files must be LF, not CRLF, or the dev shell will fail with `exec: xmake: not found`. If you cloned on Windows with `core.autocrlf=true`, run `git config core.autocrlf false` and re-checkout the files before building under Nix.

### Build output redirection (optional)

XMake supports two env vars for shipping the plugin straight into a mod manager or game folder:

- `XSE_TES5_MODS_PATH`. path to a Mod Manager mods folder.
- `XSE_TES5_GAME_PATH`. path to a Skyrim install folder.

Set one of these before running `xmake build` and the `.dll` will be copied to the right place.

### IDE project generation (optional)

For Visual Studio:

```bat
xmake project -k vsxmake
```

For `compile_commands.json` (clangd, VS Code):

```bat
xmake project -k compile_commands
```

### Upgrading dependencies

```bat
xmake repo --update
xmake require --upgrade
```

## Compiling Papyrus scripts

The repo's `.psc` sources live in `Skyrim Data/Scripts/Source/`. They need to be compiled to `.pex` for the game to load them.

### With the Creation Kit's compiler

The Creation Kit ships `PapyrusCompiler.exe` under `<Skyrim install>\Papyrus Compiler\`. From the repo root:

```bat
"C:\path\to\Papyrus Compiler\PapyrusCompiler.exe" "Skyrim Data\Scripts\Source\AccessibilityScriptInitialisation.psc" -f="<CK install>\Papyrus Compiler\TESV_Papyrus_Flags.flg" -i="<Skyrim install>\Data\Scripts\Source;Skyrim Data\Scripts\Source" -o="Skyrim Data\Scripts"
```

Repeat per `.psc` file, or wrap in a batch script. The CK's `Papyrus Compiler` GUI button does this for you against a single file.

### With the Nix-packaged compiler

The flake exposes the Papyrus compiler from `russo-2025/papyrus-compiler`. From a `nix develop` shell:

```bash
papyrus-compiler compile \
  -h "/path/to/Skyrim Special Edition/Data/Scripts/Source/" \
  -i "./Skyrim Data/Scripts/Source/" \
  -o "./Skyrim Data/Scripts/"
```

The path after `-h` must point at the vanilla Skyrim Papyrus headers (the `Data/Scripts/Source/` folder of a Skyrim install), so the compiler can resolve `Form`, `Actor`, and friends.

## Packaging for a mod manager

After both halves build:

1. Compiled `.pex` files in `Skyrim Data/Scripts/` should sit under your mod's `Scripts/` folder.
2. The SKSE plugin `.dll` goes into `SKSE/Plugins/` under your mod folder (MO2) or directly into `Data/SKSE/Plugins/` (no mod manager).
3. The `.esp` ships from a release archive on Nexus; the repo does not commit the binary plugin.
4. Sound assets sit under `Sound/FX/Accessibility/`.

## Known build issues

- **CRLF in `flake.nix`/`xmake.lua` breaks the Nix dev shell.** See the Linux/Nix section above.
- **XMake target name does not match the runtime plugin name yet.** Clean `main` produces `commonlibsse-template.dll`. The mod's Papyrus scripts expect a plugin called `AccessibilityNatives` once the C++ port lands. Until then the dll is a scaffold and the mod runs from Papyrus alone.
