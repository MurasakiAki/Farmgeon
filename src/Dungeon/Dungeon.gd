extends Node2D

var start_room : int
var boss_room : int

var number_of_rooms : int

var current_lvl : int
var current_room : int

var level0 = []
var level1 = []
var level2 = []
var level3 = []
var level4 = []

var levels = [level0, level1, level2, level3, level4]
var rooms = []

var check_script = preload("res://src/Dungeon/DungeonAlgorithm.gd").new()

func _ready():
	generate()
	count_rooms()
	print("number of rooms: ", number_of_rooms)
	assign_rooms()
	

#generating the dungeon
func generate():
	plant_seed()
	grow()
	
	print("lvl4 ", levels[4])
	print("lvl3 ", levels[3])
	print("lvl2 ", levels[2])
	print("lvl1 ", levels[1])
	print("lvl0 ", levels[0])
	print("is single dungeon: ", check_script.is_single_group(levels))
	
	while not check_script.is_single_group(levels):
		replant()
		
		print("lvl4 ", levels[4])
		print("lvl3 ", levels[3])
		print("lvl2 ", levels[2])
		print("lvl1 ", levels[1])
		print("lvl0 ", levels[0])
		print("is single dungeon: ", check_script.is_single_group(levels))

#plant seeds into the zero level
func plant_seed():
	while level0.count(0) == 0:
		for i in range(5):
			if Flip.coin_flip():
				level0.append(1)
			else:
				level0.append(0)
	
	

#growing the dungeon
func grow():
	for l in levels.size():
		if l < 1:
			continue
		for i in 5:
			if i == 0:
				if levels[l-1][i] == 1 and levels[l-1][i+1] == 0:
					levels[l].append(1)
				else:
					if Flip.coin_flip():
						levels[l].append(1)
					else:
						levels[l].append(0)
						
			elif i > 0 and i < 4:
				if levels[l][i-1] == 0 and levels[l-1][i] == 1 and levels[l-1][i+1] == 0 or levels[l][i-1] == 1 and levels[l-1][i] == 1 and levels[l-1][i-1] == 0:
					levels[l].append(1)
				else:
					if Flip.coin_flip():
						levels[l].append(1)
					else:
						levels[l].append(0)
						
			else:
				if levels[l][i-1] == 0 and levels[l-1][i] == 0:
					levels[l].append(0)
				elif levels[l][i-1] == 0 and levels[l-1][i] == 1:
					levels[l].append(1)
				elif levels[l][i-1] == 1 and levels[l-1][i-1] == 0 and levels[l-1][i] == 1:
					levels[l].append(1)
				else:
					if Flip.coin_flip():
						levels[l].append(1)
					else:
						levels[l].append(0)
						
			

#replanting the gungeon in case of separation of the dungeon
func replant():
	for i in range(levels.size()):
		levels[i].clear()
		
	
	plant_seed()
	
	grow()
	

func count_rooms():
	for i in range(levels.size()):
		number_of_rooms = number_of_rooms + levels[i].count(1)

#assign physical rooms to the dungeon
func assign_rooms():
	for i in number_of_rooms:
		var room = preload("res://src/Room/room.tscn").instantiate()
		rooms.append(room)

