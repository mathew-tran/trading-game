extends Control

class_name Card

enum STATE {
	UNHOVERED,
	HOVERED,
	DRAGGED,
}

enum VIS {
	HIDDEN,
	SHOWN,
}
enum CONTROL {
	CAN_MOVE,
	CANNOT_MOVE
}

enum CARD_VALUE {
	GOLD,
	EMERALD,
	RUBY
}

var CardState : STATE
var CardVis : VIS
var CardValue : CARD_VALUE
var ControlType : CONTROL

var DragOffset = Vector2.ZERO
var LastPosition = Vector2.ZERO

func Setup():
	print(CardValue)
	match CardValue:
		CARD_VALUE.GOLD:
			$CardFront.texture = load("res://Art/Card-Gold.png")
		CARD_VALUE.EMERALD:
			$CardFront.texture = load("res://Art/Card-Emerald.png")
		CARD_VALUE.RUBY:
			$CardFront.texture = load("res://Art/Card-Ruby.png")
	print("set")
func _ready() -> void:
	ControlType = CONTROL.CANNOT_MOVE
	SetNewState(CardState)
	DragOffset = $CardBack.size / 2
	
func Flip():
	if CardVis == VIS.HIDDEN:
		$AnimationPlayer.play("show")
		CardVis = VIS.SHOWN
		await $AnimationPlayer.animation_finished
		ControlType = CONTROL.CAN_MOVE
	
func IsHovered():
	return CardState == STATE.HOVERED

func IsDragged():
	return CardState == STATE.DRAGGED
	
func IsUnHovered():
	return CardState == STATE.UNHOVERED
	
func SetNewState(state):
	CardState = state
	if CardState == STATE.HOVERED or CardState == STATE.DRAGGED:
		$CardFront.rotation_degrees = 5
	else:
		$CardFront.rotation_degrees = 0
	if CardState == STATE.DRAGGED:
		mouse_filter = Control.MOUSE_FILTER_IGNORE
		z_index = 11
	else:
		mouse_filter = Control.MOUSE_FILTER_STOP
		z_index = 10
	print(name +  STATE.keys()[state])
	
func _process(delta: float) -> void:
	if IsDragged():
		if Input.is_action_just_released("left_click"):
			SetNewState(STATE.HOVERED)	
			Finder.GetPlayer().ReleaseCard()
		else:
			global_position = get_global_mouse_position() - DragOffset
	elif IsHovered():
		if CanUse() and Finder.GetPlayer().IsHoldingCard() == false and Finder.GetGame().IsPlayerTurn():
			if Input.is_action_just_pressed("left_click"):
				SetNewState(STATE.DRAGGED)	
				Finder.GetPlayer().HoldCard(self)
				LastPosition = global_position		
		
func CanUse():
	return ControlType == CONTROL.CAN_MOVE

func RevertToLastPosition():
	global_position = LastPosition
			
func _on_mouse_entered() -> void:
	if IsUnHovered():
		SetNewState(STATE.HOVERED)

func GetValue():
	return CardValue * 10
	
func _on_mouse_exited() -> void:
	if IsHovered():
		SetNewState(STATE.UNHOVERED)
