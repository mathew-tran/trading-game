extends Node2D

class_name Game

var StartingHandAmount = 5

enum GAME_STATE {
	SETTING_UP,
	PLAY
}

var CurrentState : GAME_STATE

var GoalAmount = 10000
var CurrentAmount = 0

signal OnStateUpdate(state)
signal OnGoalUpdated

func AddPoints(amount):
	CurrentAmount += amount
	OnGoalUpdated.emit()
	
func ApplySellEffects():
	for slot in $SellArea.GetSlots():
		if slot.GetCard() != null:
			await slot.GetCard().ApplyEffects(CardData.EFFECT_PROC_TIME.SELL)
		
func FinishTurn():
	SetState(GAME_STATE.SETTING_UP)
	
	await ApplySellEffects()
	
	var usedSlot = $SellArea.GetNextUsedSlot()
	while usedSlot != null:
		await usedSlot.GetCard().FlipBack()
		var value = usedSlot.GetCard().GetValue()
		Helper.AddTextPopup(str(value), .8, usedSlot.GetPointSpawnPosition())
		AddPoints(value)
		
		usedSlot.GetCard().queue_free()
		await get_tree().process_frame
		usedSlot = $SellArea.GetNextUsedSlot()
		
	await $Deck.PopulateMarket()
	SetState(GAME_STATE.PLAY)
func SetState(state):
	CurrentState = state
	OnStateUpdate.emit(CurrentState)
	
func IsPlayerTurn():
	return CurrentState == GAME_STATE.PLAY
	
func _ready() -> void:
	OnGoalUpdated.emit()
	SetState(GAME_STATE.SETTING_UP)
	await $Deck.Setup()
	await $Deck.PopulateMarket()
	for x in range(0, StartingHandAmount):
		await $Deck.AddCardToPlayerHand()
	SetState(GAME_STATE.PLAY)
