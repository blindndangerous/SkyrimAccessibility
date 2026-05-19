---
title: Contributing to the Docs
description: Guidelines on how to write, format, and add new quest walkthroughs or guides to this website.
---

Thank you for helping expand and refine the Skyrim Accessibility documentation! This website is built using **Astro** and **Starlight**.

## Structural Rules for New Pages

Every documentation page you submit must follow these exact validation rules to avoid compilation errors:

### 1. Mandatory Frontmatter Header

Every single `.md` or `.mdx` file added to the site **must** start with a YAML frontmatter block declaring a `title` and a `description`:

```yaml
---
title: Your Page Title Goes Here
description: A short summary of what this guide covers for search engines.
---
```
