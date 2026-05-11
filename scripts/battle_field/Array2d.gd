extends Node
class_name Array2d


var _data_line: Array = []
var _width: int = 0


func _get_flat_len() -> int:
	return len(_data_line)


func get_width() -> int:
	return _width


func set_width(new_width: int):
	_width = new_width


func _extend(flat_position: int, value: Vector2) -> bool:
	if _get_flat_len() > flat_position:
		return false

		
	for index in range(_get_flat_len(), flat_position):
		if index == flat_position - 1:
			_data_line.append(value)
			break
		
		_data_line.append(Vector2(-1, -1))
	
	return true


func _insert(flat_position: int, value: Vector2) -> bool:
	if _get_flat_len() < flat_position:
		return false
		
	_data_line[flat_position] = value
	
	return true


func _get_flat_position(position: Vector2) -> int:
	return (position.x - 1) * _width + position.y


func put_val(position: Vector2i, value: Vector2) -> bool:
	if _width <= 0:
		return false
	
	var res: bool = true
	var flat_position = _get_flat_position(position)
	
	if flat_position > _get_flat_len():
		res = _extend(flat_position, value)
	else:
		res = _insert(flat_position, value)
	
	return true


func get_val(position: Vector2i) -> Vector2:
	var res: Vector2 = Vector2.INF
	var flat_position: int = (position.x - 1) * _width + position.y
	
	if flat_position > _get_flat_len():
		return res
	
	return _data_line[_get_flat_position(position)]
