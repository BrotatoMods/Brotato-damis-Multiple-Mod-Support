extends Node

func _init(modLoader = ModLoader):
	modLoader.installScriptExtension("res://dami-Helper/singletons/debug_service.gd")
	modLoader.mod_log("dami-Helper: Initialized")
	
func _ready():
	ModLoader.mod_log("dami-Helper: Finished loading Damis Helper mod.")
