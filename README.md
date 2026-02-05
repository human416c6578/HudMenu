# AMX Mod X Plugin - HUD Settings Integration

## Description
This AMX Mod X plugin serves as a centralized hub for managing various HUD display functionalities. It provides a unified menu interface that lets players toggle different display elements (speedometer, FPS, keys display, timer, medals, and spectator list) by calling natives from other plugins. The plugin manages user preferences and persistently stores them using the FVault library for reliable data persistence.

## Features
- **Unified HUD Menu**: Single interface to control multiple display elements
- **Multi-Plugin Integration**: Seamlessly calls natives from speedometer, timer, strafe stats, timer medals, and spectator list plugins
- **User Preferences Management**: Automatically saves and restores player settings using FVault
- **Persistent Storage**: Settings are maintained across server restarts and reconnections
- **Stats & Settings Menu**: Dedicated submenu for advanced player statistics and preferences

## Menu Items
1. **Speed** - Toggle speedometer display
2. **FPS** - Toggle frames-per-second counter
3. **Keys** - Toggle key press display
4. **Timer** - Toggle map timer display
5. **Medals** - Toggle timer medals/achievements
6. **Speclist** - Toggle spectator list display
7. **Stats & Pre Settings** - Access advanced settings and player statistics

## Usage
Players can open the HUD menu by typing `/hud` in the game chat. Each item can be toggled ON/OFF, with settings automatically saved to the player's profile.

## Command
- `/hud` - Opens the HUD settings menu

## Native Functions
- `native_open_hud_menu(id)` - Opens the HUD menu for the specified player

## Dependencies
- AMX Mod X
- FVault (for persistent storage)
- Speedometer plugin
- Timer plugin
- Strafe Stats plugin
- Timer Medals plugin
- Spectator List plugin

## Version
- **Version**: 1.0
- **Authors**: MrShark45 & ftl~