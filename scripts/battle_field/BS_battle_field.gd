extends Node2D
@onready var player: CharacterBody2D = $Player
@onready var tile_map_layer: TileMapLayer = $TileMapLayer

	
func get_local_tiles_location() -> Array2d:
	var res: Array2d = Array2d.new()
	
	var res_arr_2d_y: int = 10
	var res_arr_2d_x: int = 18
	
	res.set_width(res_arr_2d_x)
	
	for x in range(res_arr_2d_x):
		for y in range(res_arr_2d_y):
			var array_coord: Vector2i = Vector2i(x, y)
			var tile_location = Vector2.INF
			
			if tile_map_layer.get_cell_source_id(array_coord) != -1:
				tile_location = tile_map_layer.map_to_local(array_coord)
			else:
				print("Invalid array coords: ", array_coord)
				
			res.put_val(array_coord, tile_location)
			
	return res

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tile_locs: Array2d = get_local_tiles_location()
	player.set_walking_grid(tile_locs)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	pass
