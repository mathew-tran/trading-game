extends Resource
class_name CardData

@export var CardName = ""
@export var CardValue = 10
@export var CardArt : Texture2D

func GetValue():
	return CardValue
