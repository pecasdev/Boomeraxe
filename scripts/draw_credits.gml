draw_set_colour(c_dkgray)
draw_rectangle(-150+clamp(credit_scroll*3,0,150),0,0+clamp(credit_scroll*3,0,150),600,0)

draw_set_colour(c_dkgray)
draw_rectangle(750-clamp(credit_scroll*3,0,150),0,600-clamp(credit_scroll*3,0,150),600,0)

draw_config(fnt_credits,c_white,fa_left,fa_top)
draw_text(x,credit_scroll,left_side)

draw_config(fnt_credits,c_white,fa_right,fa_top)
draw_text(x,credit_scroll,right_side)
