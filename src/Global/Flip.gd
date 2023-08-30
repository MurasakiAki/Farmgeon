extends Node

func coin_flip():
	var i = randi_range(0, 1)
	
	if i == 0:
		return false
	else:
		return true
