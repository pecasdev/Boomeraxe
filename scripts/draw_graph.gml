//area of 300 to work with

x_scale=600/(global.profiles[#3,user]+1)
y_scale=300/hi

// World Record Line
draw_config(fnt_profile_small,c_red,fa_left,fa_middle)
draw_line_width(2,(450-global.best_time*y_scale)-(450-global.best_time*y_scale-300)*0.5,596,(450-global.best_time*y_scale)-(450-global.best_time*y_scale-300)*0.5,2)
draw_text(20,(450-global.best_time*y_scale)-(450-global.best_time*y_scale-300)*0.5+10,'World Record')

// Lines
for (i=6;i!=(global.profiles[#3,user]+1)*6;i+=6)
{
    x_draw=i/6*x_scale
    y_draw=450-global.profiles[#(i-6)+4,user]*y_scale
    
    if i!=6
    {
        draw_config(fnt_profile_small,c_black,fa_middle,fa_middle)
        draw_line_width(x_draw,y_draw-(y_draw-300)*0.5,(i-6)/6*x_scale,(450-global.profiles[#(i-12)+4,user]*y_scale)-(450-global.profiles[#(i-12)+4,user]*y_scale-300)*0.5,3)
    }
}

// Points
for (i=6;i!=(global.profiles[#3,user]+1)*6;i+=6)
{
    x_draw=i/6*x_scale
    y_draw=450-global.profiles[#(i-6)+4,user]*y_scale
    
    if i/6!=select
    {
        draw_config(fnt_profile_small,c_black,fa_middle,fa_middle)   
        draw_rectangle(x_draw-4,y_draw-(y_draw-300)*0.5-4,x_draw+4,y_draw-(y_draw-300)*0.5+4,0)
        draw_config(fnt_profile_small,c_white,fa_middle,fa_middle)   
        draw_rectangle(x_draw-2,y_draw-(y_draw-300)*0.5-2,x_draw+2,y_draw-(y_draw-300)*0.5+2,0) 
    }
    else
    {
        draw_config(fnt_profile_small,c_white,fa_middle,fa_middle)   
        draw_rectangle(x_draw-4,y_draw-(y_draw-300)*0.5-4,x_draw+4,y_draw-(y_draw-300)*0.5+4,0)
        draw_config(fnt_profile_small,6713446,fa_middle,fa_middle)  // Green Gray   
        draw_rectangle(x_draw-2,y_draw-(y_draw-300)*0.5-2,x_draw+2,y_draw-(y_draw-300)*0.5+2,0) 
    }       
}

// Two seperate for loops is required to ensure elements are properly layered
