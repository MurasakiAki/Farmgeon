extends Node

func is_valid_coordinate(x: int, y: int) -> bool:
	return x >= 0 && x < 5 && y >= 0 && y < 5

func explore(x: int, y: int, visited: Array, field: Array) -> void:
	visited[y][x] = true

	var directions = [[0, 1], [0, -1], [1, 0], [-1, 0]]
	for dir in directions:
		var nx = x + dir[0]
		var ny = y + dir[1]
		if is_valid_coordinate(nx, ny) && field[ny][nx] == 1 && !visited[ny][nx]:
			explore(nx, ny, visited, field)

func is_single_group(field: Array) -> bool:
	var visited = []
	for i in range(5):
		visited.append([false, false, false, false, false])

	var num_regions = 0

	for y in range(5):
		for x in range(5):
			if field[y][x] == 1 && !visited[y][x]:
				num_regions += 1
				explore(x, y, visited, field)
				if num_regions > 1:
					return false

	return num_regions == 1
