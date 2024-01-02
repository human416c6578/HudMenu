# AMX Mod X Plugin - HUD Settings Integration

## Description
This AMX Mod X plugin serves as an integration hub for various display functionalities provided by other plugins. Instead of directly handling the HUD elements, this plugin orchestrates the showing and hiding of features like speed, FPS, keys, timer, medals, and stats by calling natives from other plugins. The primary purpose of this plugin is to manage user preferences and persistently store their choices.

## Features
- **Integration**: Calls natives from other plugins to toggle display elements.
- **User Preferences**: Persists user preferences using the NVault library.

## Usage
Players can open the HUD menu by typing "/hud" in the game chat. The plugin will call the appropriate natives from other plugins to toggle the desired display elements.

## Native Functions
- `native_open_hud_menu(id)`: Opens the HUD menu for the specified player.

## Dependencies
- AMX Mod X
- NVault
- Speedometer plugin
- Timer plugin
- Strafe Stats plugin
- Timer Medals plugin