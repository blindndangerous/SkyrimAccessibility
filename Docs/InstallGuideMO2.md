# Skyrim Accessibility Install Guide for Mod Organizer 2.
1. Install [Skyrim Special Edition](https://store.steampowered.com/app/489830/The_Elder_Scrolls_V_Skyrim_Special_Edition/).
> [!Note]
> Skyrim Anniversary Edition is update with community mods on top of Skyrim Special Edition.
> It is still the same game version, you can use eighther of those two editions.
2. Download Portable [Mod.Organizer-2.5.2.7z](https://github.com/ModOrganizer2/modorganizer/releases/tag/v2.5.2) and extract it where you like.
3. Make a shortcut for ModOrganizer.exe and move it to desktop so you don't have to launch it from MO2 folder every time.
4. Launch MO2.
5. Create a new Instance.
6. Select Create Portable Instance.
7. Browse for a game to manage. Exempli gratia: J:\Games\Skyrim Special Edition.
8. Select game editon.
9. When selecting folder where data should be stored, just go with the default path, it should be the same folder where MO2 is installed.
10. Link Mod Organizer to your Nexus Mods account.
11. Finsih Installation.
12. Launch Mod Organizer 2.
13. Use Tab to scroll through control elements.
14. Find Combo Box to select a program to run.
15. Make sure you have selected skyrim launcher.
16. Navigate to Run button.
17. Launch Skyrim Launcher once and close it, to generate ini files.
18. Open web browser.
19. Download [SKSE](https://www.nexusmods.com/skyrimspecialedition/mods/30379?tab=files) and install it manually by extracting contents of archive into game folder where .exe files are.
20. Download [nvdaControllerClient](https://download.nvaccess.org/releases/stable/) and extract nvdaControllerClient.dll into game folder where .exe files are.
> [!Note]
> If you've done all correctly both skse64_loader.exe and nvdaControllerClient.dll should now be in same folder with SkyrimSE.exe
21. Download all the mods below from Nexus Mods using the "Install via Mod Manager" button.
> [!Note]
> - [Address Library for SKSE Plugins](https://www.nexusmods.com/skyrimspecialedition/mods/32444?tab=files). Pick "All in one (Anniversary Edition)" for AE 1.6.x or "All in one (Special Edition)" for SE 1.5.97. A mismatch silently disables the plugin.
> - [Power Of Three's Papyrus Extender](https://www.nexusmods.com/skyrimspecialedition/mods/22854?tab=files);
> - [Power Of Three's Tweaks](https://www.nexusmods.com/skyrimspecialedition/mods/51073?tab=files);
> - [UIExtensions](https://www.nexusmods.com/skyrimspecialedition/mods/17561?tab=files);
> - [Media Keys Fix](https://www.nexusmods.com/skyrimspecialedition/mods/92948?tab=files);
> - [Better MessageBox Controls](https://www.nexusmods.com/skyrimspecialedition/mods/1428?tab=files);
> - [Dylbills Papyrus Functions](https://www.nexusmods.com/skyrimspecialedition/mods/65410?tab=files);
> - [Stay At The System Page - AE](https://www.nexusmods.com/skyrimspecialedition/mods/67883?tab=files).
22. Download latest releases of [Skyrim Accessibility](https://github.com/DioKyrie-Git/SkyrimAccessibility/releases) and [SkyrimTTS](https://github.com/DioKyrie-Git/SkyrimTTS/releases) from GitHub.
23. Go to folder where you extracted MO2.
24. Move two downloaded archives inside of Mod Organizer's downloads folder. Exempli gratia: Z:/Moding/ModOrganizer2/downloads/
25. Go back to Mod Organizer.
26. Use the Tab key to find the Plugins tab control.
27. Use the right/left arrows to navigate and open the Downloads tab.
28. Use Tab until you reach the tree view with downloads.
29. Use the up/down arrows to navigate through the Downloads tab.
30. Press Enter to quick-install the selected mod.
> [!Note]
> When installing Skyrim Accessibility itself, the FOMOD installer has two steps:
> - "Core Mod Install" is required and installs automatically.
> - "Optional Sounds > Experimental Sounds" is optional and off by default. These ambient sounds for items, doors, and similar objects can be loud or distracting. You can leave them off for now and reinstall later if you want them.
31. Install all mods in the Downloads tab.
32. Use Tab until you reach the tree view with mods.
33. Press Shift+F10 and select "Enable All Mods".
34. Now use Tab to go back to the Downloads tab.
35. Use the right/left arrows to navigate to the Plugins tab.
36. Use Tab until you reach the tree view with plugins.
37. Press Shift+F10 and select "Enable All".
38. Use Tab until you reach the combo box to select a program to run, select "SKSE".
39. Use the Run button to play the game.
