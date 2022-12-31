# class_name DamiHelper
extends Node

# Name:     dami's multi mod support
# Version:  1.1.0
# Author:   dami
# Editors:  Darkly77 (minor edits)
# Repo:     https://github.com/BrotatoMods/Brotato-damis-Multiple-Mod-Support
var items = []
var weapons = []
var characters = []
var debug_items = [] # items added to DebugService.items

var ModData = load("res://dami-Helper/mod_data.gd").new()

func load_data(mod_data_path):
	ModLoader.dev_log(str("Dami-Helper: load data from path -> ", mod_data_path))
	var mod_data = load(mod_data_path)
	ModLoader.dev_log(str("Dami-Helper: loaded data from path -> ", mod_data.resource_path))
	
	ModLoader.log_mod("Dami-Helper: Loading ModData: " + mod_data_path)
	items.append_array(mod_data.items)
	weapons.append_array(mod_data.weapons)
	characters.append_array(mod_data.characters)
	debug_items.append_array(mod_data.debug_items)
	
	# Apply weapons_characters: Loops over each weapon and adds it
	# to the corresponding character
	for i in mod_data.weapons_characters.size():
		if mod_data.weapons[i]:
			var wpn_characters = mod_data.weapons_characters[i]
			for character in wpn_characters:
				character.starting_weapons.push_back(mod_data.weapons[i])
				for weapon in character.starting_weapons:
					ModLoader.dev_log(str("Dami-Helper: weapon.my_id -> ", weapon.my_id))
	
func install_data():
	ModLoader.log_mod(str("Dami-Helper: Installing ModData"))
	ModLoader.dev_log(str("Dami-Helper: items -> ", items))
	ModLoader.dev_log(str("Dami-Helper: weapons -> ", weapons))
	ModLoader.dev_log(str("Dami-Helper: characters -> ", characters))
	ModLoader.dev_log(str("Dami-Helper: debug_items -> ", debug_items))
	
	# Add loaded content to the game
	ItemService.items.append_array(items)
	ItemService.weapons.append_array(weapons)
	ItemService.characters.append_array(characters)

	# Add debug items (which makes you always start with them)
	DebugService.debug_items = DebugService.debug_items.duplicate() # this is needed in case the array is empty
	DebugService.debug_items.append_array(debug_items)

	# Debug: Log all loaded content
	for character in characters:
		ModLoader.dev_log("Dami-Helper: Added Character: " + tr(character.name)) 
	for item in items:
		ModLoader.dev_log("Dami-Helper: Added Item: " + tr(item.name))
	for weapon in weapons:
		ModLoader.dev_log("Dami-Helper: Added Weapon: " + tr(weapon.name))
	for debug_item in debug_items:
		ModLoader.dev_log("Dami-Helper: Added Debug Item: " + tr(debug_item.name))

	# Debug: Test if your weapon was added to a specific character
#	for character in ItemService.characters:
#		if character.my_id == "character_mage":
#			for weapon in character.starting_weapons:
#				DebugService.log_data(weapon.my_id)

	ItemService.init_unlocked_pool()
	add_unlocked_by_default_without_leak()
	ProgressData.load_game_file()

# Loop over the added content. If its `unlocked_by_default` is true, make sure
# add it to the arrays of unlocked content (which is required to make them appear
# in pools)
func add_unlocked_by_default_without_leak():
	for item in items:
		if item.unlocked_by_default and not ProgressData.items_unlocked.has(item.my_id):
			ProgressData.items_unlocked.push_back(item.my_id)

	for weapon in weapons:
		if weapon.unlocked_by_default and not ProgressData.weapons_unlocked.has(weapon.weapon_id):
			ProgressData.weapons_unlocked.push_back(weapon.weapon_id)

	for character in characters:
		if character.unlocked_by_default and not ProgressData.characters_unlocked.has(character.my_id):
			ProgressData.characters_unlocked.push_back(character.my_id)
