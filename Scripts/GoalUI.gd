extends GridContainer

func _ready() -> void:
	Finder.GetGame().OnGoalUpdated.connect(OnGoalUpdated)
	
func OnGoalUpdated():
	$CurrentValue.text = Helper.GetFormattedAmount(Finder.GetGame().CurrentAmount)
	$GoalValue.text = Helper.GetFormattedAmount(Finder.GetGame().GoalAmount)
