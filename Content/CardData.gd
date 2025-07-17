extends Resource
class_name CardData

enum CARD_TAG {
	GEM,
	TOOL
}

enum EFFECT_PROC_TIME {
	SELL
}

@export_flags("GEM", "TOOL") var Tags
@export var CardName = ""
@export var CardValue = 10
@export var CardArt : Texture2D

@export var Effects : Array[CardEffectData]

func GetEffectsOfType(effectType : EFFECT_PROC_TIME):
	var effects = []
	for effect in Effects:
		if effect.ProcEffectPhase == effectType:
			effects.append(effect)
			
	return effects
	
func GetValue():
	return CardValue

func GetTagFlag(tag: CARD_TAG) -> int:
	return 1 << int(tag)

func HasTagFlag(tag: CARD_TAG) -> bool:
	return (Tags & GetTagFlag(tag)) != 0
	
static func GetSingleTagString(tag: CARD_TAG):
	return CARD_TAG.keys()[tag]
	
func GetTagsString():
	var str = ""
	for tag in CARD_TAG.keys():
		if HasTagFlag(CARD_TAG[tag]):
			print(str)	
			str += "[" + tag + "]"
	return str
