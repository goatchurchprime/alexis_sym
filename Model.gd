extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var Block = load("res://Block.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in range(5):
		var block = Block.instance().duplicate(true)
		block.scale = Vector3(0.2, 0.2, 0.2)
		block.translation = Vector3((randf()-0.5)*2*0.8, -0.01, (randf()-0.5)*2*0.8)
		block.get_node("CSGMesh/CSGMesh2").translation = Vector3((randf()-0.5)*2, 0.5, (randf()-0.5)*2)
		var uniquematerial = block.get_node("CSGMesh").mesh.material.duplicate()
		uniquematerial.albedo_color = Color(randf(), randf(), randf())
		if i == 0:
			uniquematerial.albedo_color = Color(1, 0, 0)
		block.get_node("CSGMesh").mesh.surface_set_material(0, uniquematerial) 
		add_child(block)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rotation_degrees.z += delta*9
	rotation_degrees.x += delta*13
