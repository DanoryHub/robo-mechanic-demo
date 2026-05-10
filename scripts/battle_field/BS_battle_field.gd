extends Node2D
@onready var player: CharacterBody2D = $Player
@onready var tile_map_layer: TileMapLayer = $TileMapLayer

var start_player_tile_map_position: Vector2 = Vector2(0, 0)
var current_player_tile_map_position: Vector2 = start_player_tile_map_position

func set_player_tile_position(tile_map_location: Vector2):
	var local_tile_position: Vector2 = tile_map_layer.map_to_local(tile_map_location)
	player.position = local_tile_position
	
func get_local_tiles_location() -> Array[Vector2]:
	var res: Array[Vector2] = []
	return res

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	set_player_tile_position(start_player_tile_map_position)
	
	# TODO 1: Move moving logic into player scene (can calculate map in here and pass it to player)
	# Can create function and check which tilesx have image and put their location into corresponding
	# 2d array cell, tiles without image can have Vector2d(-1, -1) value, so we will check and forbid
	# moving to this tiles
	#
	# TODO 2: Forbid player to move outside set up tiles (Look up bozo) 
	
	player.outer_call_test()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:

	if Input.is_action_just_released("Left"):
		current_player_tile_map_position.x -= 1
	
	if Input.is_action_just_released("Right"):
		current_player_tile_map_position.x += 1
	
	if Input.is_action_just_released("Up"):
		current_player_tile_map_position.y -= 1
	
	if Input.is_action_just_released("Down"):
		current_player_tile_map_position.y += 1
	
	set_player_tile_position(current_player_tile_map_position)
