---
title: Contributing to the Docs
description: Guidelines on how to write, format, translate, and add new guides to this website.
---

Thank you for helping expand and refine the Skyrim Accessibility documentation! This website is built using **Astro** and **Starlight**.

Because our sidebar is fully automated and our deployment tracks validation strictness, we use specific guardrails to keep the wiki stable, readable, and accessible for screen readers.

---

## ⚙️ Initial Project Setup

Before you can add content or preview your writing, you need to set up the environment on your local machine:

1. **Fork and Clone the Repository:**
   Fork the main [SkyrimAccessibility Repository](https://github.com/DioKyrie-Git/SkyrimAccessibility) to your own GitHub account, then clone it locally:

   ```bash
   git clone [https://github.com/YOUR-USERNAME/SkyrimAccessibility.git](https://github.com/YOUR-USERNAME/SkyrimAccessibility.git)
   ```

2. **Install Node.js:**
   Make sure you have **Node.js 20 (LTS)** or higher installed on your computer. You can download it from [nodejs.org](https://nodejs.org/).

3. **Install Project Dependencies:**
   Open your terminal, navigate directly into the documentation folder, and install the required packages:
   ```bash
   cd Docs
   npm install
   ```

Now your local system matches our build environment exactly, and you're ready to start writing!

---

## 📐 Structural Rules & Layout Semantics

Every documentation page you submit must follow these exact specification constraints to avoid triggering automated build failures:

### 1. Mandatory Frontmatter Header

Every single `.md` or `.mdx` file added to the site **must** start with a YAML frontmatter block declaring a `title` and a `description`.

```yaml
---
title: Your Page Title Goes Here
description: A short summary of what this guide covers for search engines.
---
```

### 2. Indentation & Code Style (Spaces Only)

This project **strictly uses spaces** for all indentation across markdown, documentation, and configuration files.

- Do not use tab characters anywhere in the repository.
- Frontmatter headers require **2 spaces** for indentation.
- We use **Prettier** to manage formatting automatically. Running the layout formatter will safely adjust your spacing before you commit.

### 3. Heading Hierarchy

- **Do not use a level-1 heading (`# Title`) at the top of your text payload.** Starlight renders the primary document header automatically using your frontmatter configuration title.
- Organize content sections using logical cascading steps: `## Heading 2` for primary divisions and `### Heading 3` for operational subsections. This guarantees that screen reader users can skim the layout structurally via section skipping commands.

### 4. Direct Markdown File Links

When linking to another internal documentation page, use relative paths **without adding a trailing slash or file extensions**.

- ❌ **Bad:** `[Read UI Guides](/guides/ui.md)` or `[Read UI Guides](/guides/ui/)`
- **Good:** `[Read UI Guides](/guides/ui)`

---

## 📂 Content Folder Directory Mapping

Our sidebar uses an automatic crawler engine. To make your new file appear in the correct section dropdown block, place it in the corresponding case-sensitive folder path:

- **Core References:** Global operational concepts belong directly in `src/content/Docs/guides/` (e.g., `ui.md`, `mechanics.md`).
- **Installation Manuals:** Setup tool instructions belong in `src/content/Docs/guides/install/` (e.g., `mo2.md`, `vortex.md`).
- **Quest Walkthroughs:** Step-by-step quest guides belong inside the structural segments of `src/content/Docs/guides/walkthroughs/quests/`:
  - Main Story missions belong inside `main/` (e.g., `unbound.md`).
  - Faction progression missions belong inside labeled group subdirectories like `dark-brotherhood/` (e.g., `delayed-burial.md`).

---

## 🌍 Translating Pages (Internationalization)

We are committed to helping blind players worldwide. If you want to translate existing documentation into a supported community locale (such as Spanish), you must ensure file structure alignment:

1. **Folder Parity:** Sibling folders inside `src/content/Docs/` handle translated configurations. Your target file must replicate the English file path naming scheme precisely inside that language's directory boundary (e.g., English `guides/ui.md` aligns with Spanish `es/guides/ui.md`).
2. **Text Processing Bound:** Only translate text values assigned to parameters or nested underneath headings. Do not translate the structure keys themselves (e.g., keep the literal prefix declaration `title:` completely intact, and modify only the tracking string next to it).

> 💡 **Recommended Tooling:** Install the **Starlight i18n** extension in Visual Studio Code. Run the command palette command `Starlight i18n` to select a target language folder; it automatically handles creating directories, validating slug formatting matching, and opening a split-view workspace.

---

## 🛠️ Testing Your Changes Locally

Before pushing changes or submitting a Pull Request to GitHub, run our testing suite locally to verify code execution safety:

```powershell
# Navigate directly to the web project subdirectory context
cd Docs

# 1. Clean and auto-format your layouts, spacing, and markdown lines
npm run format

# 2. Fire up the local framework dev engine to audit pages interactively
npm run dev

# 3. Compile the local serialization matrix tracking status map
npm run lunaria:build
```

Open `http://localhost:4321` in your browser. If you are a screen-reader developer, we highly recommend booting up **NVDA** or your preferred screen utility to test keyboard navigation focus boundaries directly across your newly compiled documentation layouts!

---

## 🤖 Pull Request Verification Guards

When you submit a Pull Request, our automated GitHub Actions workflow acts as a verification gatekeeper. It clones the full repository tree depth and handles processing constraints:

1. **Prettier Verification Pass:** Scans file structures globally. If unformatted layout boundaries, stray space increments, or accidental tab variables are detected, the check fails immediately.
2. **Link Validation Pass:** Scans hyperlink data globally. If your guide references an invalid document path or contains a broken external resource link, the build flags it.
3. **Lunaria Log Check:** Analyzes repository changes against global localization schemas to keep the master progress dashboard up to date.

```

```
