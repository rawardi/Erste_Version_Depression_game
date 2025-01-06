extends Sprite2D

signal specialimage
signal normalimage
signal event1
signal queststart
var images = {
	"normal": [
		"res://Image/icon.svg"
	],
	"special": [
		"res://Image/funny-serious-cat-animal-meme_23-2148974916.jpg"
	]
}
func _ready() -> void:
	randomize()

func change_image() :
		var randomizing_key = randi_range(0,100)
		var chosen_key=""
		if randomizing_key <=80 :
			chosen_key ="normal"
		else :
			chosen_key="special"
# Get the list of images for the chosen key
		var image_list = images[chosen_key]
# Select a random index from the chosen image list
		var random_index = randi() % image_list.size()
		if chosen_key== "normal" :
			emit_signal("normalimage")
		elif chosen_key== "special":
			match random_index :
				0 :
					emit_signal("event1")
			emit_signal("specialimage")
			emit_signal("queststart")
		texture = load(image_list[random_index])  # Load the texture from the path





func _on_command_processor_changeimage() -> void:
	change_image()
