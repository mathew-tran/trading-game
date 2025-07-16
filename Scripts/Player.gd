extends Node2D

class_name Player

var HeldCard : Card
var CardAreaToDrop : CardSlot

func IsHoldingCard():
	return HeldCard != null
	
func HoldCard(card):
	HeldCard = card
	
func SetArea(area : CardSlot):
	CardAreaToDrop = area
	CardAreaToDrop.SetActivated(true)
	CardAreaToDrop.self_modulate = Color.DARK_GRAY
	

func ClearArea():
	if CardAreaToDrop:
		CardAreaToDrop.SetActivated(false)
		CardAreaToDrop.self_modulate = Color.WHITE
		CardAreaToDrop = null
	
func ReleaseCard():
	if HeldCard == null:
		return
	if CardAreaToDrop:
		CardAreaToDrop.AddCard(HeldCard, .05)
	else:
		HeldCard.RevertToLastPosition()
		HeldCard.SetNewState(Card.STATE.UNHOVERED)
	HeldCard = null
