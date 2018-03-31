/// draw_cursor(x,y,width,height,alpha)
x_draw=argument0
y_draw=argument1
width=argument2
height=argument3
alpha=argument4

draw_set_colour(c_white)
draw_set_alpha(alpha)
draw_rectangle(x_draw-width/2,y_draw-height/2,x_draw+width/2,y_draw+height/2,0)
draw_set_alpha(1)
