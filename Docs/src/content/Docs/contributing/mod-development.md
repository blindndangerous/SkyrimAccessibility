---
title: Mod Development Guide
description: Rules, guidelines, and tool requirements for contributing code to the Skyrim Accessibility Mod.
---

If you are interested in helping with the development of **Skyrim Accessibility Mod by Dio Kyrie**, please follow the requirements and workflows outlined below.

## Contributing Rules

1. **Code Formatting:** Papyrus is case-insensitive, but for clarity across the repository, only pull requests containing **PascalCase** formatting in `.psc` files will be accepted.
2. **SKSE Plugin Preference:** If any feature can be implemented inside an SKSE plugin, it _must_ be done there. This ensures maximal compatibility with other community mods and avoids the need for players to start a fresh game after updating versions.
3. **AI Generated Code:** AI-generated code must be clearly labeled as such in your pull requests. Acknowledge that your pull request containing it may be routed to a separate development branch for manual rewriting.
4. **Environment Setup:** This repository provides a **Nix flake**, which can be used to quickly spin up a clean local development environment.

## Required Tools

### For Papyrus & Creation Kit Work

Make sure you have the following tools installed to work with Skyrim Special Edition or Anniversary Edition scripts:

- Creation Kit
- Creation Kit Platform Extended
- BSA Browser
- Papyrus Compiler App SSE
- SSEEdit
- Champollion GUI

### For SKSE C++ Plugin Work

- [XMake](https://xmake.io) (Version 3.0.0+)
- A modern C++23 Compiler such as MSVC or Clang-CL
