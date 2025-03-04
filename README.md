## 概述

Event Bus为Godot项目提供了全局事件总线。它允许在任何地方发送和订阅事件来通信，从而促进解耦且可维护的代码结构。

## 特征

* **全局事件发送**: 从任何地方发送事件。
* **全局事件订阅**: 从任何地方订阅感兴趣的事件。

## 安装

### 复制插件文件

将event-bus-plugin文件夹放入项目的addons目录中：

```
res://addons/event-bus-plugin/
```

### 启用插件

1. 在 Godot 编辑器中，转到项目 > 项目设置 > 插件。
2. 在列表中找到Event Bus并将其设置为启用。

### 自动加载

1. 启用插件后，它会自动将EventBus单例添加到自动加载列表中。
2. 您可以在项目 > 项目设置 > 全局 > 自动加载中确认这一点。

## 用法

### 发送事件

要发出事件，请调用EventBus单例的emit方法，并提供事件名称和任何参数：

```
EventBus.emitv("add_num", 2)
# 如果不需要参数：
# EventBus.emit("add_num")
```

### 订阅事件

要监听事件，节点应该使用on方法订阅事件并提供回调函数：

```
func _ready() -> void:
	EventBus.on("add_num", _on_add_num)

func _on_add_num(step):
	num += step
	text = str(num)
```

### 移除事件

要移除已监听的事件，节点应该使用off方法移除已订阅事件并提供回调函数：

```
func _exit_tree() -> void:
	EventBus.off("add_num", _on_add_num)
```

**注意**：取消订阅_exit_tree函数中的事件非常重要，以防止内存泄漏和悬垂引用。

## 故障排除

### 事件未发出

* 确保emit和on之间的事件名称一致。
* 验证监听函数是否正确注册。
