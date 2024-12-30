extends Sprite2D

signal specialimage
signal normalimage

var images = [
"res://Image/icon.svg",
"res://Image/funny-serious-cat-animal-meme_23-2148974916.jpg"
]

func change_image() :
		var random_index = randi() % images.size()
		texture = load(images[random_index])  # Load the texture from the path
		if random_index== 0 :
			emit_signal("normalimage")
		elif random_index== 1 :
			emit_signal("specialimage")

func _on_game_child_entered_tree(InputResponse) -> void:
	change_image()


func _on_game_image_changed() -> void:
	change_image()
