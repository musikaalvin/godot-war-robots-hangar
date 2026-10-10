extends PanelContainer

@onready var badge: Label = $Margin/VBox/Badge
@onready var slot_name: Label = $Margin/VBox/Name
@onready var status: Label = $Margin/VBox/Status
@onready var slot_art: PanelContainer = $Margin/VBox/Art
@onready var slot_shape: ColorRect = $Margin/VBox/Art/SlotShape
@onready var slot_icon: Label = $Margin/VBox/Art/SlotShape/SlotIcon

func setup(slot_id: String, is_empty: bool = true) -> void:
    slot_name.text = slot_id.to_upper()
    if is_empty:
        badge.text = "EMPTY"
        status.text = "LOCKED"
        slot_shape.color = Color(0.16, 0.22, 0.27, 1.0)
        slot_icon.text = "◧"
        modulate = Color(1.0, 1.0, 1.0, 0.72)
    else:
        badge.text = "READY"
        status.text = "LIVE"
        slot_shape.color = Color(0.22, 0.46, 0.56, 1.0)
        slot_icon.text = "◈"
        modulate = Color(1.0, 1.0, 1.0, 1.0)
