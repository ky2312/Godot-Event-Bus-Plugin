extends Button

func _ready() -> void:
	connect("pressed", _click)

func _click():
	#EventBus.emit("add_num")
	EventBus.emitv("add_num", 2)
