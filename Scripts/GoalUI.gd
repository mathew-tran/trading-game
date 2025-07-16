extends GridContainer

func _ready() -> void:
	Finder.GetGame().OnGoalUpdated.connect(OnGoalUpdated)
	
func OnGoalUpdated():
	$CurrentValue.text = str(Finder.GetGame().CurrentAmount)
	$GoalValue.text = str(Finder.GetGame().GoalAmount)
