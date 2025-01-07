extends Node

var normalimage_signal=false
var specialimage_signal=false
signal changeimage
var startpoint = true
var respondedproperly =false

#event line signal managing
var event1=false
var questsignal= false
var nextstory= false
signal next_story
signal reset
func intialize(startingpoint) :
	pass


func parse(input:String) :
	if questsignal and respondedproperly :
		print("jalan")
		return quest1(input)
	else :
		print("switch parse jalan")
		match input :
			"start" :
				print("dikirim ke start")
				return start(input)
			"respond" :
				print("dikirim ke respond")
				return respond(input)
			_:
				print("dikirim ke unrecognized")
				return  unnrecognizedcommand(input)



func _on_image_normalimage() -> void:
	normalimage_signal=true


func _on_image_specialimage() -> void:
	specialimage_signal=true


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
			respondedproperly=true
			print("respondedproperly")
		return "tell what you want"
	elif normalimage_signal :
		print("penyebab")
		emit_signal("reset")
		emit_signal("changeimage")
		return "funny stuff , yet it didnt change your fate"


func unnrecognizedcommand(input:String) :
	if startpoint :
		return "you havent even started the game yet"
	elif specialimage_signal :
		emit_signal("changeimage")
		return "once again you sink deeper"
	elif normalimage_signal:
		emit_signal("changeimage")
		return "funny stuff , yet it didnt change your fate"


#this part will start the logic of the events.

func _on_image_event_1() -> void:
	event1=true

func quest1(input:String) :
	match input :
		"sorry" :
			emit_signal("next_story")
			return "will you text this to your parent? "
		"yes":
			if next_story:
				event1=false
				respondedproperly=false
				emit_signal("changeimage")
				return "come downstair , they have invited you for a dinner"
			else :
				event1=false
				respondedproperly=false
				emit_signal("changeimage")
				return "you havent even reflected"
		_:
			emit_signal("changeimage")
			respondedproperly=false
			event1=false
			return "you are afraid to move forward"

func _on_image_queststart() -> void:
	questsignal=true
	print("quest jalan")


func _on_next_story() -> void:
	nextstory=true


func _on_changeimage() -> void:
	nextstory=false
	normalimage_signal=false
	specialimage_signal=false
