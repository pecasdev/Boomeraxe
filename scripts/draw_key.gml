// draw_key(draw_x,draw_y,key)

draw_area(argument0-string_width(string_key(argument2))/2-10,argument1-string_height(string_key(argument2))/2-10,argument0+string_width(string_key(argument2))/2+10,argument1+string_height(string_key(argument2))/2+10,6581117,c_black,3)    // Kalamata

draw_config(fnt_keybind,c_black,fa_middle,fa_middle)
draw_text(argument0,argument1,string_key(argument2))
