extends Panel

class_name InfoPanel

@onready var Title = $VBoxContainer/Title
@onready var Worth = $VBoxContainer/Worth
@onready var ExtraEffects = $VBoxContainer/ExtraEffects
@onready var Tags = $Tags
func _process(delta: float) -> void:
	if visible:
		global_position = get_global_mouse_position()
		
func ShowInfo(data):
	Title.text = ""
	Worth.text = ""
	Tags.text = ""
	ExtraEffects.text = ""
	
	if data.has("title"):
		Title.text = data["title"]
		
	if data.has("value"):
		Worth.text = str(data["value"])
	
	if data.has("extra-effects"):
		ExtraEffects.text = data["extra-effects"]
		
	if data.has("tags"):
		Tags.text = data["tags"]
		
	visible = true
	
	
func Hide():
	visible = false
	
