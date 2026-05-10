extends HSplitContainer
@onready var battle_field: Node2D = $SubViewportContainer/SubViewport/BattleField
@onready var v_box_container: VBoxContainer = $VBoxContainer
@onready var sub_viewport_container: SubViewportContainer = $SubViewportContainer

var bf_original_width = 0

func resize_battle_field(offset: int):
	#var height = size.y * (offset * -1) / bf_original_width
	var scale_percentage = 1 - (offset * -1) / bf_original_width
	battle_field.scale = Vector2(1, scale_percentage)


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	bf_original_width = size.x


func _on_dragged(offset: int) -> void:
	resize_battle_field(offset)


func _on_battle_scene_ready() -> void:
	resize_battle_field(-v_box_container.size.x)
