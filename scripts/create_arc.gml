target_x=argument0
target_y=argument1
var strength=argument2

var mid_x=(x+target_x)/2
var mid_y=(y+target_y)/2

start_x=x
start_y=y

cir_x=mid_x+lengthdir_x(strength,point_direction(x,y,mid_x,mid_y)-sign(strength)*90)
cir_y=mid_y+lengthdir_y(strength,point_direction(x,y,mid_x,mid_y)-sign(strength)*90)

radius=point_distance(cir_x,cir_y,target_x,target_y)

current=point_direction(cir_x,cir_y,x,y)
ending=point_direction(cir_x,cir_y,target_x,target_y)

//var angle_diff=-angle_difference(starting,ending)

//step_angle=angle_diff/logn(0.875,10/obj_player_death.init_distance)
//step=step_angle

//show_debug_message(starting)
//show_debug_message(ending)
//show_debug_message(angle_diff)
