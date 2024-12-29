extends Control

const InputResponse = preload("res://input_response.tscn")

@onready var result=$PanelContainer/MarginContainer/VBoxContainer/Picture/ScrollContainer/result
@onready var playerinput= $PanelContainer/MarginContainer/VBoxContainer/input/LineEdit
func _ready() -> void:
	pass # Replace with function body.



func _on_line_edit_text_submitted(new_text: String) -> void:
# Clear previous input response
	for child in result.get_children():
		child.queue_free()
	#Adding and showing what the Player input 
	var input_response=InputResponse.instantiate()
	input_response.set_text(new_text, "This is where the result is")
	result.add_child(input_response)
	playerinput.text=""
	
