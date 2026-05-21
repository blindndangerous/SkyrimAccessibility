# Changelog

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Lockpicking via Interact Menu, 25% chance per attempt.
- Quest marker guidance (work in progress).
- New Accessibility Menu (L key) with menu navigation, sub-menus, and current-menu name display.

### Changed
- Interact Menu rebuilt to cover items, activators, and NPCs.
- Fast Travel Menu reworked under the new menu system.
- Renamed `accessibility.esp`.

### Fixed
- Wraparound logic flaw in menu navigation.
- Submenu current entry not resetting on menu change.
- Logic edge cases in Accessibility Menu.

## [0.11.2] - 2026-05-12

### Fixed
- Fast Travel Menu (O) registered to the wrong key.

## [0.11.1] - 2026-05-10

### Changed
- Fast Travel Menu hotkey moved from G to O.

## [0.11.0] - 2026-05-10

### Added
- Fast Travel Menu with categories.
- Ambient sound for enemies.
- Empty-category notice in activator sub-menus and elsewhere.

### Changed
- Merged Clairvoyance into the Initialisation menu.

### Fixed
- Submenu array expansion bug.
- Fixed-array empty check.
- Player no longer listed among NPCs.

## [0.10.0] - 2026-05-03

### Added
- FOMOD installer.
- Clairvoyance spell menu.

### Fixed
- Vortex FOMOD layout.
- Logic order bug.
- Empty submenu check.

## [0.9.1] - 2026-04-23

### Added
- HTML guide skeleton for walkthroughs.

### Fixed
- Lockpick menu reopens on failed pick.
- Empty item-category handling.

## [0.9.0] - 2026-04-03

### Added
- Editor ID displayed for unnamed activators.

### Changed
- Misc activators check base object instead of reference.
- Furniture menu searches for empty string instead of `none`; shows only named furniture.

### Fixed
- Menu reopens after harvest; empty entries removed; stale entries after harvesting cleared.
- Correct function called instead of old menu; menu does not open when empty.
- Menu reopens after item loot.

## [0.8.2] - 2026-03-26

### Added
- Activators menu.
- Quest walkthrough moved to new menu.

### Changed
- Take Item menu optimised.
- Plugin cleaned with SSEEdit.
- MO2 and Vortex install guides updated.

### Fixed
- Lockpicking.

## [0.8.1] - 2026-03-22

### Added
- ToDo list file.

### Changed
- 0.8.1 patch (no further detail in source history).

## [0.8.0] - 2026-03-19

### Added
- Base SKSE plugin scaffold based on CommonLibSSE template.
- Nix flake for dev environment.

### Changed
- File structure reorganised.
- Licensing, Contributing rules, Readme, and install guide revised.

## [0.7] - 2026-03-05

### Added
- Initial public release.
