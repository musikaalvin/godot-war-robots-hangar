extends Control

@onready var slots_grid: GridContainer = $Body/MainRow/HangarStage/Margin/VBox/SlotsGrid
@onready var hero_name: Label = $Body/MainRow/HangarStage/Margin/VBox/HeroInfo/Labels/RobotName
@onready var hero_tag: Label = $Body/MainRow/HangarStage/Margin/VBox/HeroInfo/Labels/RobotTag

const RobotSlotScene = preload("res://scenes/RobotSlot.tscn")

func _ready() -> void:
    populate_slots()
    set_selected_robot("Astra-9")
    setup_button_hover()

func populate_slots() -> void:
    for child in slots_grid.get_children():
        child.queue_free()

    for index in range(6):
        var slot = RobotSlotScene.instantiate()
        slot.setup("slot %d" % (index + 1), true)
        slots_grid.add_child(slot)

func set_selected_robot(name: String) -> void:
    hero_name.text = name
    hero_tag.text = "Ready // Tactical Frame"

func setup_button_hover() -> void:
    var buttons: Array[Button] = []
    buttons.append($TopBar/Margin/HBox/MenuButton)
    buttons.append($TopBar/Margin/HBox/Avatar)
    buttons.append($Body/MainRow/LeftPanel/Margin/VBox/LoadoutBtn)
    buttons.append($Body/MainRow/RightPanel/Margin/VBox/InventoryBtn)
    buttons.append($BottomBar/Margin/VBox/NavGrid/GarageBtn)
    buttons.append($BottomBar/Margin/VBox/NavGrid/StoreBtn)
    buttons.append($BottomBar/Margin/VBox/NavGrid/BattleBtn)
    buttons.append($BottomBar/Margin/VBox/NavGrid/MissionsBtn)
    buttons.append($BottomBar/Margin/VBox/NavGrid/ProfileBtn)
    buttons.append($BottomBar/Margin/VBox/DeployBtn)

    for button in buttons:
        if button:
            button.mouse_entered.connect(func() -> void: _hover(button))
            button.mouse_exited.connect(func() -> void: _unhover(button))

func _hover(button: Button) -> void:
    var tween = create_tween()
    tween.tween_property(button, "scale", Vector2(1.04, 1.04), 0.12)

func _unhover(button: Button) -> void:
    var tween = create_tween()
    tween.tween_property(button, "scale", Vector2(1.0, 1.0), 0.12)
