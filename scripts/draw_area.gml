/// draw_area(x1,y1,x2,y2,colour,border_colour,border_width)

x1=argument0
y1=argument1
x2=argument2
y2=argument3
cc=argument4
bc=argument5
bw=argument6

draw_config(fnt_profiles,bc,fa_middle,fa_middle)
draw_rectangle(x1,y1,x2,y2,0)

draw_config(fnt_profiles,cc,fa_middle,fa_middle)
draw_rectangle(x1+bw,y1+bw,x2-bw,y2-bw,0)

// Border type is inclusive
