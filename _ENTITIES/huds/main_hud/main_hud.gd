extends Control


func _ready() -> void:
	queue_redraw()


func _draw() -> void:
	var screen_center: Vector2 = get_viewport_rect().size / 2
	draw_circle(screen_center, 8, Color.WHITE, false, 1, true)
