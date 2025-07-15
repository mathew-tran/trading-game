extends Node2D

class_name Player

var HeldCard : Card
var CardAreaToDrop : CardDroppableArea

func IsHoldingCard():
	return HeldCard != null
	
func HoldCard(card):
	HeldCard = card
	
func ReleaseCard():
	if CardAreaToDrop:
		pass
	else:
		HeldCard.RevertToLastPosition()
	HeldCard = null
