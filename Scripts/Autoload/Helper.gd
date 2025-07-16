extends Node

func GetFormattedAmount(amount):
	var score = str(amount)
	if amount <= 1:
		return score
	var i : int = score.length() - 3
	while i > 0:
		score = score.insert(i, ",")
		i = i - 3
	return score

func AddTextPopup(text, time, popupPosition):
	var popupClass = load("res://Prefab/PopupText.tscn")
	var instance = popupClass.instantiate()
	Finder.GetEffectsGroup().add_child(instance)
	instance.global_position = popupPosition
	
	instance.Setup(text, time)
