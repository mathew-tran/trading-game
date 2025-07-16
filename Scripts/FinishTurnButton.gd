extends Button

func _ready() -> void:
	Finder.GetGame().OnStateUpdate.connect(OnStateUpdate)
	
func OnStateUpdate(state : Game.GAME_STATE):
	if state == Game.GAME_STATE.SETTING_UP:
		visible = false
	if state == Game.GAME_STATE.PLAY:
		visible = true


func _on_button_up() -> void:
	Finder.GetGame().FinishTurn()
