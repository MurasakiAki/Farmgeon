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

#generating the dungeon
func _ready():
	number_of_rooms = randi_range(5, 25)
	start_room = randi_range(0, number_of_rooms)
	
	while boss_room == start_room:
		boss_room = randi_range(0, number_of_rooms)
	
	current_lvl = 0
	current_room = start_room
	
	for i in range(number_of_rooms):
		
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
