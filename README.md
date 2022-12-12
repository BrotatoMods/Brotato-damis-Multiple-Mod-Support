# Brotato - dami's Multiple Mod Support

Created by dami. Makes it possible to play with multiple mods. The file needs to be added by a mod creator.

### Setup

1. Add a folder called *mods* to your project.
1. Add [mod_service.gd](mod_service.gd) & [mod_data.gd](mod_data.gd) to that *mods* folder.
1. Set mod_service.gd to autoload:
    - Project > Project Settings > Autoload
    - Click the folder icon at the top to choose the file
    - Select *mod_service.gd*
    - Click the "Add" button on the right

And that's it! \o/

## Guide for Players

To play with compatible mods, download the PCK, rename it to *Brotato.pck* and place it in your game folder. Then add a mods folder in your game folder and place all compatible mods in there (they should be .zip or .pck). You can launch Brotato and play with the mods.

## Guide for Modders

### Making a compatible mod

First off, if you're new to brotato modding I strongly encourage you to check [Jonuses video](https://www.youtube.com/watch?v=hsMA6h7Rd4I).

It's also worth downloading dami's example weapons to see how they're set up (download them [here](https://drive.google.com/file/d/1oggyb3GRWwvf9zH66Bow-EFI7PvSiyNw/view?usp=sharing)).

To make a compatible mod, either download the pck above and decompile it, or download the framework zip and place the *mods* folder inside it at the root of your existing project.

If you're doing the latter, you then need to go into your project settings, navigate to the autoload tab and add the [mod_service.gd](mod_service.gd) file (inside the *mods* folder) to the autoload list.

You can go ahead and mod some weapons, chars or items in.

when you're done, place all your modded stuff into the *mods* folder (I do recommend using subfolders). Then add a new ModData resource at the root of the mods folder (as a tres file). Name it after your mod. Inside it, you'll have to link all your modded weapons/items/chars data resources in the respective arrays, instead of putting them directly into the itemService arrays.

`weapons_characters` is an array of arrays. It should contain, for each modded weapon, the list of characters that can start with it. It assigns them in the same order as the weapons array so it should have the same length

Now you can pack your mod. I don't recommend exporting as PCK because the file will be quite large. Rather, copy your *.import* and *mods* folder somewhere else. Due to how godot does images and sounds, you'll need to include the files in *.import* that your mod uses. To know which ones to include, you should sort them by date in your explorer, and just delete the ones your mod doesn't use (most of the *.import* folder).

Zip these two folders together and name the .zip it after your mod. It's ready to be loaded along with other mods !!!

### Adding the framework to an existing mod

To do this you need to download the framework, place the mods folder at the root of your mod project, go into your project settings, navigate to the autoload tab and add the mod_service.gd file (inside the mods folder) to the autoload list.

Export your project as pck. Share it and other modders will be able to add their modded stuff using the effects you've coded in the game by decompiling it and following the above instructions.

## Resources

### Mod Packs

- **[dami's Arsenal](https://brotato.wiki.spellsandguns.com/Mod:Dami%27s_Arsenal)** - *download individual weapons [here](https://drive.google.com/file/d/1oggyb3GRWwvf9zH66Bow-EFI7PvSiyNw/view?usp=sharing)*
- **[Invasion](https://brotato.wiki.spellsandguns.com/Mod:Invasion)** - *repo [here](https://github.com/BrotatoMods/Brotato-Invasion-Mod/), releases [here](https://github.com/BrotatoMods/Brotato-Invasion-Mod/releases)*

### Supported Mods

These mods have dami's script included, which means you can use any of the mod packs with them.

- **[DebugLoader](https://brotato.wiki.spellsandguns.com/Mod:DebugLoader)** - *repo [here](https://github.com/BrotatoMods/Brotato-DebugLoader), releases [here](https://github.com/BrotatoMods/Brotato-DebugLoader/releases)*
- **[Invasion](https://brotato.wiki.spellsandguns.com/Mod:Invasion)** - *repo [here](https://github.com/BrotatoMods/Brotato-Invasion-Mod/), releases [here](https://github.com/BrotatoMods/Brotato-Invasion-Mod/releases)*

## More Info

View the original thread on the Space Potatoes Discord [here](https://discord.com/channels/630060181086142487/1031365401868775495). It has a lot more information. The thread starts [here](https://discord.com/channels/630060181086142487/1031365401868775495/1031365588011986995).
