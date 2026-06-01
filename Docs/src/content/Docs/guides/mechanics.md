---
title: Game Mechanics
description: How the mod's gameplay features work — audio trails, lockpicking, notifiers, and ambient cues.
---

This guide covers the automated gameplay modifications and audio systems introduced to make the world of Skyrim navigable without sight. For the keys that trigger these features, see [UI Controls & Navigation](/SkyrimAccessibility/guides/ui/).

## Intro walkthrough

The helper menu (`L`) offers a "Main Quest Start" walkthrough that teleports you past the Helgen opening to a safe spot, so you can skip the scripted intro and start playing.

## Clairvoyance

The mod adds Clairvoyance to your spellbook as a regular spell. It leads you to your current quest marker with a sound trail.

- You can equip it from your magic menu and cast it the same way you cast any other spell.
- The helper menu (`L`) has an auto-cast toggle. When it is on, the mod casts Clairvoyance every 5 seconds so you do not have to re-cast, and you hear the sound trail toward your current quest marker. When it is off, you can still cast the spell manually.

## Auto lockpicking

When you select a locked door or container through the Accessibility Menu, the mod tries to pick it with a 25 percent success chance per attempt. If you fail, the lock options menu re-opens so you can try again or back out.

## Walking-in-place notifier

The mod plays a sound when you hold a movement key (forward, back, or either strafe key) but your character is not actually moving (for example, walking into a wall). The mod reads your current key bindings from Skyrim's Controls menu, so this works no matter how you have re-bound those keys.

## Ambient sound cues

The mod plays audio cues for nearby enemies, items, containers, doors, and furniture so you can locate them by ear. New cues are added over time; the experimental sound set is off by default in the installer because some cues can be loud or distracting. See the [CHANGELOG](https://github.com/DioKyrie-Git/SkyrimAccessibility/blob/main/CHANGELOG.md) for what is in each version.
