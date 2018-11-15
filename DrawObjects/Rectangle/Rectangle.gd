extends Node2D

#A class that draws a rectangle based on where the
#mouse is currently at from the place the mouse clicked.

#Drawing variables.
export var base_pos_node = "path"
export var base_pos_var = "var"
export var to_pos_node = "path"
export var to_pos_var = "var"


#These get the object that has color.
export var color_node = "path"
export var color_var = "var name"

var base_node
var to_node
var color

#In case n was left on as the nodes name.
export var backup_to : Vector2 = Vector2( -1, -1 )
export var backup_base : Vector2 = Vector2( -1, -1 )
export var backup_color : Color = Color( 1,1,1,1 )


func _draw():
	#Draw a rectangle each frame.
	var base = base_node.get( base_pos_var )
	
	var rect : Rect2 = Rect2( base , 
	to_node.get( to_pos_var ) - base )
	var color = get_node( color_node ).get( color_var )
	
	#Actually draw the rectangle.
	draw_rect( rect, color, true )


func _process(delta):
	update()


func _ready():
	self.global_position = Vector2( 1,1 )
	
	#If node variables are not defined, use default variables.
	if base_pos_node == "path" :
		base_pos_node = "../" + self.name
		base_node = get_node( base_pos_node )
		base_pos_var = "backup_base"
	else:
		base_node = get_node( base_pos_node )
		
	
	#Do above but for to_pos.
	if to_pos_node == "path" :
		to_pos_node = "../" + self.name
		to_node = get_node( to_pos_node )
		to_pos_var = "backup_to"
	else:
		to_node = get_node( to_pos_node )
	
	
	#Do above but for Color this time.
	if color_node == "path" :
		color_node = "../" + self.name
		color = get_node( color_node )
		color_var = "backup_color"
	else:
		color = get_node( color_node )