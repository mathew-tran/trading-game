extends Panel

class_name CardSlot 

@onready var CardContainer = $CardHolder

func IsOccupied():
	return CardContainer.get_child_count() > 0
	
func GetCard() -> Card:
	return CardContainer.get_child(0)
	
func _on_mouse_entered() -> void:
	OnMouseEntered()
	
func OnMouseEntered():
	if Finder.GetPlayer().IsHoldingCard():
		if IsOccupied():
			return
		Finder.GetPlayer().SetArea(self)
		print("Hold Over Valid Area" + name)

func OnMouseExited():
	Finder.GetPlayer().ClearArea()
	print("Move from area" + name)
	
func AddCard(card : Card, speed = .1):
	card.SetNewState(Card.STATE.UNHOVERED)
	var oldPosition = card.global_position
	
	await get_tree().process_frame
	var tween = get_tree().create_tween()
	tween.tween_property(card, "global_position", CardContainer.global_position, .1)
	await tween.finished
	card.reparent(CardContainer, true)
	
	await get_tree().create_timer(.1).timeout

func SetActivated(bActivated):
	if bActivated:
		$TextureRect.self_modulate = Color.DARK_GRAY
	else:
		$TextureRect.self_modulate = Color.WHITE
		
func _on_mouse_exited() -> void:
	OnMouseExited()
 
