extends Node

# 所有的监听事件
var _listeners: Dictionary[String, Array] = {}

func on(event_name: String, listener: Callable) -> EventBus:
	if not _listeners.has(event_name):
		_listeners[event_name] = []
	_listeners[event_name].append(listener)
	return self

func off(event_name: String, listener: Callable) -> EventBus:
	if not _listeners.has(event_name):
		return
	_listeners[event_name].erase(listener)
	if _listeners[event_name].is_empty():
		_listeners.erase(event_name)
	return self

func emit(event_name: String, args: Array) -> EventBus:
	if not _listeners.has(event_name):
		return
	for listener in _listeners[event_name]:
		(listener as Callable).callv(args)
	return self
