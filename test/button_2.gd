extends Button

func _ready() -> void:
	connect("pressed", _click)

func _click():
	EventBus.emit("unbound_add_num")
