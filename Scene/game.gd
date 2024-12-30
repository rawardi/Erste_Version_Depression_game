extends Control

const InputResponse = preload("res://input_response.tscn")
signal image_changed

@onready var result=$PanelContainer/MarginContainer/VBoxContainer/Picture/ScrollContainer/result
@onready var playerinput= $PanelContainer/MarginContainer/VBoxContainer/input/LineEdit
@onready var commandprocessor=$CommandProcessor
func _ready() -> void:
	pass # Replace with function body.



func _on_line_edit_text_submitted(new_text: String) -> void:
# Clear previous input response
	for child in result.get_children():
		child.queue_free()
	#Adding and showing what the Player input 
	var input_response=InputResponse.instantiate()
	var response=commandprocessor.parse(new_text)
	input_response.set_text(new_text, response)
	result.add_child(input_response)
	playerinput.text=""
	emit_signal("image_changed")
