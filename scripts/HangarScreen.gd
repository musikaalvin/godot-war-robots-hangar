extends Control

@onready var slots_grid: GridContainer = $Body/VBox/SlotsSection/Margin/VBox/SlotsGrid
const RobotSlotScene = preload("res://scenes/RobotSlot.tscn")

func _ready() -> void:
    populate_slots()

func populate_slots() -> void:
    for child in slots_grid.get_children():
        child.queue_free()

    for index in range(6):
        var slot = RobotSlotScene.instantiate()
        slot.setup("slot_%d" % (index + 1), true)
        slots_grid.add_child(slot)
