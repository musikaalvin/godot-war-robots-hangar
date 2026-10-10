extends Control

@onready var slots_grid: GridContainer = $Body/VBox/SlotsSection/Margin/VBox/SlotsGrid
@onready var deploy_btn: Button = $BottomBar/Margin/VBox/DeployBtn
@onready var garage_btn: Button = $BottomBar/Margin/VBox/NavGrid/GarageBtn
@onready var store_btn: Button = $BottomBar/Margin/VBox/NavGrid/StoreBtn
@onready var battle_btn: Button = $BottomBar/Margin/VBox/NavGrid/BattleBtn
@onready var missions_btn: Button = $BottomBar/Margin/VBox/NavGrid/MissionsBtn
@onready var profile_btn: Button = $BottomBar/Margin/VBox/NavGrid/ProfileBtn

const RobotSlotScene = preload("res://scenes/RobotSlot.tscn")

func _ready() -> void:
    populate_slots()
    setup_button_animations()

func populate_slots() -> void:
    for child in slots_grid.get_children():
        child.queue_free()

    for index in range(6):
        var slot = RobotSlotScene.instantiate()
        slot.setup("SLOT %d" % (index + 1), true)
        slots_grid.add_child(slot)

func setup_button_animations() -> void:
    var buttons = [garage_btn, store_btn, battle_btn, missions_btn, profile_btn, deploy_btn]
    for btn in buttons:
        btn.mouse_entered.connect(func(): _on_button_hover(btn))
        btn.mouse_exited.connect(func(): _on_button_unhover(btn))

func _on_button_hover(btn: Button) -> void:
    var tween = create_tween()
    tween.tween_property(btn, "scale", Vector2(1.05, 1.05), 0.15)

func _on_button_unhover(btn: Button) -> void:
    var tween = create_tween()
    tween.tween_property(btn, "scale", Vector2(1.0, 1.0), 0.15)
