extends Node2D

func _enter_tree() -> void:
	$Label.text = ""

func Setup(text, time):
	$Label.text = text
	$Timer.wait_time = time
	$Timer.start()
	

func _on_timer_timeout() -> void:
	queue_free()
