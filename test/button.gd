extends Button

func _ready() -> void:
	connect("pressed", _click)

func _exit_tree() -> void:
	disconnect("pressed", _click)

func _click():
	EventBus.emit("add_num", [2])
