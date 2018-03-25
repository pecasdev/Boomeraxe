x_check=argument0
y_check=argument1
o_check=argument2

col=instance_place(x_check,y_check,o_check)
if col!=noone and col.colide=true
{
    show_debug_message(format_time(global.game_time,false)+string(col))
    return true    
}

return false

