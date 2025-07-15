extends Node

func GetMarket() -> Market:
	var result = get_tree().get_nodes_in_group("Market")
	if result:
		return result[0]
	return null

func GetPlayer() -> Player:
	var result = get_tree().get_nodes_in_group("Player")
	if result:
		return result[0]
	return null
	
