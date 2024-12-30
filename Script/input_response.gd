extends VBoxContainer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


func set_text(Input:String , Response: String) :
	$InputHistory.text =">"+Input
	$Label.text=Response
