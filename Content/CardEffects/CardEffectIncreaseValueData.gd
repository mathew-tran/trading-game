extends CardEffectData

class_name CardEffectIncreaseValueData

@export var AmountToIncrease = 1
@export var TagToApply : CardData.CARD_TAG


func DoEffect(card : Card):
	for target in GetTargets():
		if target.CardDataRef.HasTagFlag(TagToApply):
			var text = " + " + str(AmountToIncrease)
			Helper.AddTextPopup(text, .5, target.GetEffectSpawnPosition())
			print(card.GetEffectSpawnPosition())
			await target.get_tree().create_timer(.5).timeout
			await target.DoDanceEffect()
		
			
			target.CurrentValue += AmountToIncrease
