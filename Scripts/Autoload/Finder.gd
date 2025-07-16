extends Node

func GetEffectsGroup():
	var result = get_tree().get_nodes_in_group("Effects")
	if result:
		return result[0]
	return null
	
func GetInfoPanel() -> InfoPanel:
	var result = get_tree().get_nodes_in_group("InfoPanel")
	if result:
		return result[0]
	return null
	
func GetGame() -> Game:
	var result = get_tree().get_nodes_in_group("Game")
	if result:
		return result[0]
	return null
	
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
	
func GetPlayArea() -> PlayArea:
	var result = get_tree().get_nodes_in_group("PlayArea")
	if result:
		return result[0]
	return null
