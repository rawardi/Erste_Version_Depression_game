extends Node

var normalimage_signal=false
var specialimage_signal=false
signal changeimage
var startpoint = false
var respondedproperly =false

#event line signal managing
var event1=false
var questsignal= false
func intialize(startingpoint) :
	pass


func parse(input:String) :
	if questsignal and respondedproperly :
		if event1 :
			return quest1(input)
	else :
		match input :
			"start" :
				return start(input)
			"respond" :
				return respond(input)
			_:
				return  unnrecognizedcommand(input)



func _on_image_normalimage() -> void:
	specialimage_signal=true


func _on_image_specialimage() -> void:
	normalimage_signal=true


func _on_game_gamestart() -> void:
	startpoint = true

func start (input :String ):
	if startpoint : 
		emit_signal("changeimage")
		startpoint=false
		return "you have started the game, enjoy."
	else :
		return "its not the start of the game!!"   


func respond(input:String) :
	if specialimage_signal == true :
		if event1 :
			quest1(input)
			respondedproperly=true
			print(respondedproperly)
		return "tell what you want"
	else :
		emit_signal("changeimage")
		return "funny stuff , yet it didnt change your fate"


func unnrecognizedcommand(input:String) :
	if startpoint :
		emit_signal("changeimage")
		return "you havent even started the game yet"
	elif startpoint == false :
		emit_signal("changeimage")
		return "funny stuff , yet it didnt change your fate"
	elif specialimage_signal :
		emit_signal("changeimage")
		return "once again you sink deeper"
	elif specialimage_signal == false :
		emit_signal("changeimage")
		return "funny stuff , yet it didnt change your fate"

#this part will start the logic of the events.

func _on_image_event_1() -> void:
	event1=true
	print(event1)

func quest1(input:String) :
	match input :
		"sorry" :
			emit_signal("changeimage")
			respondedproperly=false
			event1=false
			return "your start to fight it "
		_:
			emit_signal("changeimage")
			return "you are afraid to move forward"

func _on_image_queststart() -> void:
	questsignal=true
