extends Control

class_name Deck

var Cards = []

func _ready() -> void:
	var cardClass = load("res://Prefab/Card.tscn")
	for copyAmount in range(0, 5):
		for cardType in Card.CARD_TYPE:
			var instance = cardClass.instantiate() as Card
			instance.CardType = cardType
			add_child(instance)
