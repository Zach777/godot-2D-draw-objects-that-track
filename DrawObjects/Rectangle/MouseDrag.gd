extends Node2D

#A class that draws a rectangle based on where the
#mouse is currently at from the place the mouse clicked.

#Drawing variables.
var base_pos : Vector2 = Vector2( -1, -1 )
var to_pos : Vector2 = Vector2( 0,0 )


#These get the object that has color.
export var color_node = "path"
export var color_var = "var name"


func set_corners( first_pos, second_pos = base_pos ):
	#Just scale one for one with the overall size of fromPos
	#with toPos.
	base_pos = second_pos
	to_pos = first_pos
	update()


func _draw():
	#Draw a rectangle each frame.
	var rect : Rect2 = Rect2( base_pos, to_pos - base_pos )
	var color = get_node( color_node ).get( color_var )
	draw_rect( rect, color, true )


 #Demo process.
#func _process(delta):
#	set_corners( get_local_mouse_position() )
#
#	#Set base pos if mouse is clicked.
#	if Input.is_mouse_button_pressed( 1 ) :
#		set_corners( get_local_mouse_position(), get_local_mouse_position() )


func _ready():
	self.global_position = Vector2( 1,1 )