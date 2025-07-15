extends Control

class_name Deck

var Cards = []

func _ready() -> void:
	var cardsToSpawn = []
	var offsetAmount = Vector2(2,2)
	var startingOffset = Vector2(-40, -300)
	var cardClass = load("res://Prefab/Card.tscn")
	var cardAmount = 0
	for copyAmount in range(0, 5):
		for cardType in Card.CARD_VALUE.values():
			cardsToSpawn.append(cardType)
	
	cardsToSpawn.shuffle()
	await get_tree().process_frame
	for card in cardsToSpawn:
		var instance = cardClass.instantiate() as Card
		instance.CardValue = card
		print(card)
		instance.global_position = startingOffset + global_position + offsetAmount * cardAmount
		cardAmount += 1
		add_child(instance)
		instance.Setup()
		Cards.push_back(instance)
		
	await PopulateMarket()
	
func PopulateMarket():
	var market = Finder.GetMarket()
	for slot in market.GetSlots():
		if slot.IsOccupied() == false:
			var card = Cards.pop_back() as Card
			await slot.OccupyCard(card)
			await card.Flip()
