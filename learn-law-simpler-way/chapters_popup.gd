extends Window

# Define chapters with paths to images and names
var chapters = [
	{"image": "res://Designer (3) (1).png", "name": "Chapter 1: The disappearing voice", "scene": "res://chapter1.tscn"},
	{"image": "res://Designer (4) (1).png", "name": "Chapter 2: The silent whistleblower", "scene": "res://chapter2.tscn"}
	# Add more chapters as needed
]

@onready var container = $ChaptersFlowContainer

func _ready():
	# Populate the FlowContainer with chapter items
	populate_chapters()

func populate_chapters():
	for chapter in chapters:
		# Create a container for each chapter (VBoxContainer for vertical stacking)
		var vbox = VBoxContainer.new()
		vbox.size_flags_horizontal = Control.SIZE_SHRINK_CENTER  # Center horizontally
		vbox.size_flags_vertical = Control.SIZE_SHRINK_CENTER    # Center vertically

		# Create the image element as a TextureButton
		var texture = load(chapter["image"])
		if texture:
			var image_button = TextureButton.new()
			image_button.texture_normal = texture
			image_button.stretch_mode = TextureButton.STRETCH_KEEP_ASPECT_CENTERED  # Correct stretch mode
			image_button.custom_minimum_size = Vector2(200, 200)  # Set the button size explicitly to 200x200
			image_button.size_flags_horizontal = Control.SIZE_SHRINK_CENTER  # Prevent expanding
			image_button.size_flags_vertical = Control.SIZE_SHRINK_CENTER

			# Connect the pressed signal using a callable
			image_button.pressed.connect(Callable(self, "_on_chapter_button_pressed").bind(chapter["name"]))

			# Add the button to the VBoxContainer
			vbox.add_child(image_button)

		# Create the label for the chapter name
		var label = Label.new()
		label.text = chapter["name"]
		label.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
		vbox.add_child(label)

		# Add the VBoxContainer to the FlowContainer
		container.add_child(vbox)

# Function to handle the button press
func _on_chapter_button_pressed(chapter_name):
	for chapter in chapters:
		if chapter["name"] == chapter_name:
			if chapter.has("scene"):
				get_tree().change_scene_to_file(chapter["scene"])
				return
	print("No scene found for chapter: ", chapter_name)

	# Load the corresponding chapter scene or perform other actions as needed

# Optional: Function to show the popup centered
func show_popup():
	popup_centered()
