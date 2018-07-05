// Background Alpha
if credit_scroll>1600
{
    draw_set_alpha((1650-credit_scroll)/50)
}
else
{
    draw_set_alpha((credit_scroll-50)/50)
}

// Background
draw_area(-150+clamp(credit_scroll*3,0,150),0,0+clamp(credit_scroll*3,0,150),600,c_dkgray,c_black,2)
draw_area(750-clamp(credit_scroll*3,0,150),0,600-clamp(credit_scroll*3,0,150),600,c_dkgray,c_black,2)

// Text Alpha
if credit_scroll>1600
{
    draw_set_alpha((1700-credit_scroll)/100)
}
else
{
    draw_set_alpha((credit_scroll-100)/100)
    
}

draw_sprite(spr_credits_bloop,0,75,1120-credit_scroll/2)
draw_sprite(spr_credits_floop,0,525,1120-credit_scroll/2)

// Credits
draw_config(fnt_credits,c_white,fa_middle,fa_top)
draw_text_ext(75,400-credit_scroll/2,left_side,28,-1)

draw_config(fnt_credits_small,c_white,fa_middle,fa_top)
draw_text_ext(525,400-credit_scroll/2,right_side,28,-1)

// Notice
draw_config(fnt_credits,c_white,fa_middle,fa_middle)
draw_text(300,150,'Runtime has been paused#for these credits')

// Notice
draw_text(300,400,'spacebar to skip')

// Alpha Reset
draw_set_alpha(1)

// User Input
if keyboard_check_pressed(vk_space) or credit_scroll>1700
{
    room=rm_end
}
