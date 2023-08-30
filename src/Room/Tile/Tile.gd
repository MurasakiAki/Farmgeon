extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	var tile_number = randi_range(1, 8)
	$Sprite2D.texture = load("res://assets/textures/tiles/ground/grass" + str(tile_number) + ".png")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
