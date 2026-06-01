# Contributing to Skyrim Accessibility

Thanks for your interest in helping develop the Skyrim Accessibility Mod by Dio Kyrie. This document covers the project's rules, tools, and pull-request process.

## Contributing rules

1. Papyrus is case-insensitive, but for clarity only pull requests using PascalCase identifiers in `.psc` files will be accepted.
2. For mod version 2.0.0, if a feature can be done in the SKSE plugin, it should be done there. This keeps compatibility with other mods high and avoids the need for a new game on every update.
3. AI-generated code must be clearly labeled as such. Pull requests containing AI-generated code may be moved to a separate branch for review and rewrite.
4. The repository ships a Nix flake for quick setup of the development environment on Linux.

## Tools

### Skyrim SE/AE plugin work (Papyrus, esp)

- Creation Kit
- Creation Kit Platform Extended
- BSA Browser
- Papyrus Compiler
- SSEEdit

### SKSE plugin work (C++)

- [XMake](https://xmake.io) 3.0.0+
- A C++23 compiler. On Windows: MSVC or Clang-CL.

For the full build flow (cloning with submodules, building the SKSE plugin, compiling Papyrus scripts, packaging into a mod folder), see [Building from Source](https://diokyrie-git.github.io/SkyrimAccessibility/contributing/setup/).

## Pull-request process

1. Fork the repo and create a branch off `main`. Branch names: `feat/<short-slug>` for features, `fix/<short-slug>` for bug fixes, `docs/<short-slug>` for documentation.
2. Keep commits small and focused. One logical change per commit makes review faster and lets us revert cleanly when needed.
3. Use [Conventional Commits](https://www.conventionalcommits.org/) for commit messages. Common prefixes: `feat:`, `fix:`, `docs:`, `refactor:`, `chore:`. Lowercase, imperative, under 72 characters in the subject.
4. Add a CHANGELOG entry under `## [Unreleased]` in [CHANGELOG.md](CHANGELOG.md) for any user-visible change.
5. Test in-game before opening the pull request. Note in the PR description which game version (SE 1.5.97 or AE 1.6.x) you tested on.
6. Open the pull request against `main`. Link any related issue.

## Code style

- `.psc` files: PascalCase identifiers, four-space indent, no tabs.
- C++ files: follow the style already present in `src/` and the surrounding CommonLibSSE conventions.

## Reporting issues

Open an issue on GitHub. Include the information listed under "How to report a new issue" in [Troubleshooting](https://diokyrie-git.github.io/SkyrimAccessibility/guides/troubleshooting/).
