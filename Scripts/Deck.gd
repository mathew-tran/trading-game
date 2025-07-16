extends Control

class_name Deck

var Cards = []

func _ready() -> void:
	$TextureRect.visible = false
	
func Setup():
	
	var cardsToSpawn = []
	var offsetAmount = Vector2(2,2)
	var startingOffset = Vector2.ZERO
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
		instance.global_position = startingOffset + offsetAmount * cardAmount
		print(instance.global_position)
		cardAmount += 1
		add_child(instance)
		instance.Setup()
		Cards.push_back(instance)
		
	
func PopulateMarket():
	var market = Finder.GetMarket()
	for slot in market.GetSlots():
		if Cards.size() <= 0:
			return
		if slot.IsOccupied() == false:
			var card = Cards.pop_back() as Card
			await slot.AddCard(card)
			await card.Flip()

func AddCardToPlayerHand():
	if Cards.size() <= 0:
		return
		
	var playArea = Finder.GetPlayArea()
	
	var nextOpenSlot = playArea.GetNextOpenSlot()
	if nextOpenSlot == null:
		return
	var card = Cards.pop_back() as Card
	await nextOpenSlot.AddCard(card)
	await card.Flip()
