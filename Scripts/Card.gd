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

enum CARD_TYPE {
	GOLD,
	EMERALD,
	RUBY
}

var CardState : STATE
var CardVis : VIS
var CardType : CARD_TYPE

var DragOffset = Vector2.ZERO

func Setup():
	match CardType:
		CARD_TYPE.GOLD:
			$CardFront.texture = load("res://Art/Card-Gold.png")
		CARD_TYPE.EMERALD:
			$CardFront.texture = load("res://Art/Card-Emerald.png")
		CARD_TYPE.RUBY:
			$CardFront.texture = load("res://Art/Card-Ruby.png")
			
func _ready() -> void:
	Setup()
	SetNewState(CardState)
	DragOffset = $CardBack.size / 2
	
func Flip():
	if CardVis == VIS.HIDDEN:
		$AnimationPlayer.play("show")
		CardVis = VIS.SHOWN
	
func IsHovered():
	return CardState == STATE.HOVERED

func IsDragged():
	return CardState == STATE.DRAGGED
	
func IsUnHovered():
	return CardState == STATE.UNHOVERED
	
func SetNewState(state):
	CardState = state
	print(STATE.keys()[state])
	
func _process(delta: float) -> void:
	if IsDragged():
		if Input.is_action_just_released("left_click"):
			SetNewState(STATE.HOVERED)	
		else:
			global_position = get_global_mouse_position() - DragOffset
	elif IsHovered():
		if Input.is_action_just_pressed("left_click"):
			SetNewState(STATE.DRAGGED)			
		
		
func _on_mouse_entered() -> void:
	if IsUnHovered():
		SetNewState(STATE.HOVERED)
	print("entered")

func _on_mouse_exited() -> void:
	print("exited")
	if IsHovered():
		SetNewState(STATE.UNHOVERED)
