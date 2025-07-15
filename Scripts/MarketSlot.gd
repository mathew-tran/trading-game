extends TextureRect

class_name MarketSlot 

var CardHeld = null

var HolderOffset = Vector2(5, 10)
func IsOccupied():
	return CardHeld != null
	
func OccupyCard(card : Card):
	CardHeld = card
	card.reparent(self)
	var tween = get_tree().create_tween()
	tween.tween_property(card, "global_position", global_position + HolderOffset, .1)
	await tween.finished
	
