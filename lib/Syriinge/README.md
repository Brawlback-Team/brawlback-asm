# Syriinge

Syringe is a framework and API for injecting C++ code into Super Smash Bros. Brawl at runtime via plugin loading. Plugins are built into Nintendo Relocatable Module (.rel) files and loaded by Syriinge. Syriinge itself is loaded via gecko codes, which can be found in `Syringe.asm` and is a standard GCTRM assembly file.

## Build Requirements

In order to build the project, the user should satisfy the following requirements:

- DevkitPro
- Optionally, the user should have `devkitPro/msys2/usr/bin` in their system path
  - lets you run make from CLI instead of an MSYS2 window

## Building

Following these steps will produce a `.rel` file to place on your SD card inside the `module` folder.

- `git clone --recursive https://github.com/Sammi-Husky/Syriinge.git`
- `cd Syriinge`
- `make`

## Installation

- Download or build the project
- Add `sy_core.rel` to your mod/modpack's `module` folder
- Copy `Syringe.asm` to your build's source files and `.include` it at the top of `RSBE01.txt`
- Download or create plugins and add them to a folder called `plugins` inside your `/module` folder. (create this directory if it doesn't exist)

## Usage

Syringe on it's own does not do anything meaningful. Syringe simply provides an API for hooking and injecting C++ code into the game at runtime. You'll need to download or create plugins to add custom functionality to your game. To see example plugins, refer to [this](https://github.com/Sammi-Husky/BrawlPlugins) repository.

For creating your own plugins, you may find the [Template Repository]() helpful.

## Credits

This project makes use of the work of several other open-source projects:

- [OpenRVL](https://github.com/kiwi515/open_rvl), an open source reimplementation of the Revolution SDK

- [BrawlHeaders](https://github.com/Sammi-Husky/BrawlHeaders), an open source collaborative repository for Brawl header files

- [elf2rel](https://github.com/Sammi-Husky/elf2rel), a utility for converting `.elf` files to `.rel` files while linking them against a symbol map.

## License

The code contained in this repository, not including the external libraries, is licensed under the MIT license. For more information, see the file `LICENSE` on the root of the repository.

For license information on the external libraries / repositories used by this project, please see the respective project's repository listed in the `CREDITS` section.
