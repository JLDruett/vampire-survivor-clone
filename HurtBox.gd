extends Area2D

@export_enum("CoolDown","HitOnce","DisableHitBox") var HurtBoxType = 0

@onready var collision = $CollisionShape2D
@onready var disableTimer = $Timer

signal hurt(damage)

func _on_area_entered(area):
	if area.is_in_group("attack"):
		if not area.get("damage") == null:
			match HurtBoxType:
				0: #Collision
					collision.call_deferred("set","disabled",true)
					disableTimer.start()
				1: #HitOnce
					pass
				2: #DisableHitBox
					if area.has_method("tempdisable"):
						area.tempdisable()
			var damage = area.damage
			emit_signal("hurt",damage)


func _on_timer_timeout():
	collision.call_deferred("set","disabled",false)
