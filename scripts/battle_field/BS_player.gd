extends CharacterBody2D

const SPEED = 300.0
var walking_grid: Array2d = null

var start_player_tile_map_position: Vector2 = Vector2(0, 0)
var current_player_tile_map_position: Vector2 = start_player_tile_map_position


func set_player_tile_position(tile_map_location: Vector2i):
	var local_tile_position: Vector2 = walking_grid.get_val(tile_map_location)
	if local_tile_position != Vector2.INF:
		position = local_tile_position


func set_walking_grid(grid: Array2d):
	walking_grid = grid
	
	set_player_tile_position(start_player_tile_map_position)


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
