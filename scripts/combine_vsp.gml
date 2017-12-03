vsp=dash_vsp+fall_vsp+wall_vsp+jump_vsp

dash_vsp-=sign(dash_vsp)
fall_vsp-=sign(fall_vsp)
wall_vsp-=sign(wall_vsp)
jump_vsp-=sign(jump_vsp)
