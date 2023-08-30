extends Node2D

var width : int
var height : int
var tiles = []

#room init
func _ready():
	load_room()
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func load_room():
	#width and height in amount of tiles
	width = randi_range(3, 20) 
	height = randi_range(3, 10)
	
	for collumn in range(height):
		for row in range(width):
			var tile = load("res://src/Room/Tile/tile.tscn").instantiate()
			tile.set_position(Vector2((384/ 2) - (width * 8) + row * 16, (160/ 2) - (height * 8) + collumn * 16))
			tiles.append(tile)
			add_child(tile)
	
	$Wall.set_position(Vector2(32, tiles[0].position.y - 16))
	$Wall2.set_position(Vector2((384/2) + (width * 8), 0))
	$Wall3.set_position(Vector2(32, tiles[tiles.size() - 1].position.y + 16))
	$Wall4.set_position(Vector2(tiles[0].position.x - 16, 0))
