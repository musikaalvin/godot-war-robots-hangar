extends PanelContainer

@onready var badge: Label = $Margin/VBox/Badge
@onready var slot_name: Label = $Margin/VBox/Name
@onready var status: Label = $Margin/VBox/Status
@onready var platform: ColorRect = $Margin/VBox/Platform

func setup(slot_id: String, is_empty: bool = true) -> void:
    slot_name.text = slot_id.to_upper()
    if is_empty:
        badge.text = "EMPTY"
        status.text = "LOCKED"
        platform.color = Color(0.18, 0.25, 0.31, 1.0)
        modulate = Color(1.0, 1.0, 1.0, 0.72)
    else:
        badge.text = "READY"
        status.text = "LIVE"
        platform.color = Color(0.22, 0.52, 0.66, 1.0)
        modulate = Color(1.0, 1.0, 1.0, 1.0)
