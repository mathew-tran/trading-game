extends Panel

class_name CardDroppableArea

func _on_mouse_entered() -> void:
	if Finder.GetPlayer().IsHoldingCard():
		Finder.GetPlayer().CardAreaToDrop = self


func _on_mouse_exited() -> void:
	Finder.GetPlayer().CardAreaToDrop = null
