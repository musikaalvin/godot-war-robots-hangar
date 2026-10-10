extends Node

static func tween_scale(node: Node, target_scale: Vector2, duration: float = 0.2) -> Tween:
    var tween = create_tween()
    tween.tween_property(node, "scale", target_scale, duration)
    return tween

static func tween_modulate(node: CanvasItem, target_color: Color, duration: float = 0.2) -> Tween:
    var tween = create_tween()
    tween.tween_property(node, "modulate", target_color, duration)
    return tween

static func pulse_glow(node: CanvasItem, intensity: float = 1.2, duration: float = 0.6) -> Tween:
    var tween = create_tween()
    tween.set_loops()
    var original_color = node.modulate
    tween.tween_property(node, "modulate", original_color * Color(intensity, intensity, intensity, 1), duration / 2)
    tween.tween_property(node, "modulate", original_color, duration / 2)
    return tween

static func slide_in(node: Control, from_pos: Vector2, to_pos: Vector2, duration: float = 0.3) -> Tween:
    var tween = create_tween()
    node.position = from_pos
    tween.tween_property(node, "position", to_pos, duration)
    return tween
