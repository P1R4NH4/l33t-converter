# l33t Converter
=========
This is a very simple Leet converter with text file conversion capability.
This is my first lua script and has been coded as a training exercise, so please forgive any code imperfection.

This script is modular and can be customized in the config.lua file.
The file module of this script allows the user to convert the content of a .txt file into a new file with leet text.

Usage
-----
 1. Install lua if it's not already installed in your system [See Here](https://www.lua.org/download.html)
 2. Place the main.lua and cofig.lua in the same directory.
 3. Place the .txt file you want to convert in the same directory as the script
 1. Run: ``lua /path/main.lua`` and follow the on screen instructions.

Configuring / Customizing
-----
Open the config.lua file to customize the script behaviour and enable/disable modules.
The script consist of 2 modules:
  1 - Free Text converter within the script.
  2 - Text File (.txt) converter

Both modules can be enabled / disabled from the config file. If both modules are enabled a menu is presented to the user on script execution. If only one module is active it will be loaded immediately and the menu will be skipped.

A basic character customization is possible to enable/disable/change some leet characters. 


Everyone is more then welcome to contirbute and comment with suggestions.



