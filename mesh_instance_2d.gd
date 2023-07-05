extends MeshInstance2D


func _enter_tree():
	set_multiplayer_authority(str(name).to_int())

# Called when the node enters the scene tree for the first time.
func _ready():
	if not is_multiplayer_authority(): return


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not is_multiplayer_authority(): return
