extends Resource

class_name CardEffectData

enum EFFECT_TARGET {
	SELL
}

@export var ProcEffectPhase : CardData.EFFECT_PROC_TIME
@export var EffectTarget : EFFECT_TARGET

func DoEffect(card : Card):
	pass

	
func GetTargets():
	var targets = []
	if EffectTarget == EFFECT_TARGET.SELL:
		for slot in Finder.GetSellArea().GetSlots():
			if slot.GetCard() != null:
				targets.append(slot.GetCard())
	return targets
