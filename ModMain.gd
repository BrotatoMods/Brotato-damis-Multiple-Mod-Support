extends Node

func _init(modLoader = ModLoader):
	var mod_data = load("res://dami-Helper/mod_data.gd").new()
	mod_data.name = "ModData"
	add_child(mod_data)
	var dami_helper = load("res://dami-Helper/mod_service.gd").new()
	dami_helper.name = "Helper"
	add_child(dami_helper)
	modLoader.mod_log("dami-Helper: Initialized")
	
func _ready():
	ModLoader.mod_log("dami-Helper: Finished loading Damis Helper mod.")
