extends Label

var num = 0

func _ready() -> void:
	EventBus.on("add_num", _on_add_num)
	EventBus.on("unbound_add_num", func():
		EventBus.off("add_num", _on_add_num)
	)

func _exit_tree() -> void:
	EventBus.off("add_num", _on_add_num)

func _on_add_num(step):
	num += step
	text = str(num)
