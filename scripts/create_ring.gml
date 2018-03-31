/// create_ring(x,y,radius,colour,thick,speed,life)
x_draw=argument0
y_draw=argument1
radius=argument2
colour=argument3
thick=argument4
o_speed=argument5
o_life=argument6

ring=instance_create(x_draw,y_draw,obj_ring)
ring.radius=radius
ring.colour=colour
ring.thick=thick
ring.o_speed=o_speed
ring.o_life=o_life
ring.o_life_start=o_life

return ring
