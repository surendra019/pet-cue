extends Control

@onready var player: AnimatedSprite2D = $Player
@onready var final_position_player: Marker2D = $FinalPositionPlayer
@onready var dog: AnimatedSprite2D = $Dog
@onready var final_position_dog: Marker2D = $FinalPositionDog
@onready var label: Label = $Panel/Label
@onready var conversation_panel: Panel = $Panel
@onready var question_timer: Timer = $Timer
@onready var temporary: Label = $Temporary
@onready var question_panel: Panel = $QuestionPanel
@onready var question_label: Label = $QuestionPanel/QuestionLabel
@onready var feedback_label: Label = $QuestionPanel/FeedbackLabel
@onready var v_box_container: VBoxContainer = $QuestionPanel/VBoxContainer
@onready var input_blocker: Panel = $QuestionPanel/Panel
@onready var pause: Button = $Pause
@onready var pause_layer: CanvasLayer = $PauseLayer
@onready var win_layer: CanvasLayer = $WinLayer
@onready var final_score_label: Label = $WinLayer/Panel/Label
@onready var bg_music: AudioStreamPlayer = $BGMusic
@onready var dog_bark: AudioStreamPlayer2D = $Dog/DogBark
@onready var win_dog: AnimatedSprite2D = $WinLayer/Dog


var question_idx: int = 0
var current_answer: int = -1
var score: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Manager.dog_behavior_questions.shuffle()
	
	win_dog.play("relaxed")
	win_layer.hide()
	pause_layer.hide()
	pause.hide()
	player.play("walk")
	dog.play("walk")
	start_animation()
	bg_music.play()
	dog_bark.play()
	

# starts the animation sequence.
func start_animation() -> void:
	tween(player, final_position_player.global_position, 4)
	await tween(dog, final_position_dog.global_position, 4)
	
	for i in Manager.conversation:
		for j in i:
			await set_conversation(j, i[j])
		await  get_tree().create_timer(1).timeout
		if Manager.conversation.find(i) == Manager.conversation.size() - 1:
			conversation_panel.hide()
			pause.show()
			set_timer()

# tweens an object to the final position within a time duration.
func tween(obj, final, duration) -> void:
	var t = create_tween()
	t.tween_property(obj, "global_position", final, duration)
	t.play()
	# listen to the tween finish and start the idle animation of the player.
	t.finished.connect(func():
		obj.play("idle")
		)
	await t.finished

# sets the conversation label to the one's text who is speaking.
func set_conversation(speaker: String, a: String) -> void:
	conversation_panel.show()
	label.text = speaker + ": "
	for i in a:
		label.text += i
		await get_tree().create_timer(.02).timeout
	


func _on_timer_timeout() -> void:
	spawn_question()


# spawns the question with respect to the question idx.
func spawn_question() -> void:
	if question_idx >= Manager.dog_behavior_questions.size():
		final_score_label.text = str(score) + "/" + str(Manager.dog_behavior_questions.size())
		question_panel.hide()
		
		win_layer.show()
		return
	input_blocker.hide()
	var question = Manager.dog_behavior_questions[question_idx]
	question_label.text = question["question"]
	current_answer = question["answer"]
	feedback_label.text = ""
	dog.play(question["behavior"])
	await  get_tree().create_timer(2).timeout
	for opt in question["options"]:
		v_box_container.get_child(question["options"].find(opt)).text = opt
	var on_pressed: Callable = Callable(func(button_ref):
		input_blocker.show()
		var style = button_ref.get("theme_override_styles/disabled").duplicate()
		var correct_btn
		if v_box_container.get_children().find(button_ref) == current_answer:
			style.bg_color = Color.GREEN
			button_ref.set("theme_override_styles/disabled", style)
			feedback_label.text = "Great! You're right."
			score += 1
			dog.play("idle")
		else:
			dog_bark.play()
			dog.play("bark")
			get_tree().create_timer(1).timeout.connect(func():
				dog.play("idle")
				)
			style.bg_color = Color.RED
			button_ref.set("theme_override_styles/disabled", style)
			feedback_label.text = question["explanation"]
			correct_btn = v_box_container.get_child(current_answer)
			var styleC = correct_btn.get("theme_override_styles/disabled").duplicate()
			styleC.bg_color = Color.GREEN
			correct_btn.set("theme_override_styles/disabled", styleC)
			correct_btn.set("theme_override_colors/font_disabled_color", Color.BLACK)
			correct_btn.disabled = true
			
		button_ref.set("theme_override_colors/font_disabled_color", Color.BLACK)
		button_ref.disabled = true
		temporary.hide()
		await get_tree().create_timer(5).timeout
		button_ref.disabled = false
		if correct_btn:
			correct_btn.disabled = false
			correct_btn.set("theme_override_colors/font_disabled_color", Color.WHITE)
			
		button_ref.set("theme_override_colors/font_disabled_color", Color.WHITE)
		
		
		question_panel.hide()
		set_timer()
		)
	for child in v_box_container.get_children():
		for i in child.pressed.get_connections():
			child.pressed.disconnect(i["callable"])
	for child in v_box_container.get_children():
		child.pressed.connect(on_pressed.bind(child))
	question_panel.show()
		
	question_idx += 1
	
	
func set_timer() -> void:
	question_timer.wait_time = randf_range(3, 7)
	question_timer.start()

func _on_pause_pressed() -> void:
	pause_layer.show()
	question_timer.stop()
	


func _on_resume_pressed() -> void:
	pause_layer.hide()
	set_timer()


func _on_home_pressed() -> void:
	get_tree().change_scene_to_file(("res://Scenes/menu.tscn"))
