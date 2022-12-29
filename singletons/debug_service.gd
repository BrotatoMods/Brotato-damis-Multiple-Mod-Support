extends "res://singletons/debug_service.gd"

func dami_init_mod_data(instance, args):
	var ref = funcref(instance, "_load_data")
	ref.call_func(args)
