extends PanelContainer

@onready var badge: Label = $Margin/VBox/Badge
@onready var slot_name: Label = $Margin/VBox/SlotName
@onready var status: Label = $Margin/VBox/Status
@onready var slot_art: ColorRect = $Margin/VBox/SlotArt

func setup(slot_id: String, is_empty: bool = true) -> void:
    slot_name.text = slot_id.to_upper()
    if is_empty:
        badge.text = "EMPTY"
        status.text = "LOCKED"
        slot_art.color = Color(0.22, 0.30, 0.35, 1.0)
        modulate = Color(1.0, 1.0, 1.0, 0.72)
    else:
        badge.text = "READY"
        status.text = "LIVE"
        slot_art.color = Color(0.45, 0.76, 0.94, 1.0)
        modulate = Color(1.0, 1.0, 1.0, 1.0)
