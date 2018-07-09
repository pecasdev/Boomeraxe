// State
enum s
{
    idle            ,
    jump            ,
    attack          ,
    dash            ,
    fall            ,
    wall            ,
    move            ,
    forward         ,
    backward        ,
    hit             ,
    open            ,
    close           ,
    profiles        ,
    profile         ,
    keybind         ,
    title           ,
    pause           ,
    options         ,
    options_video   ,
    options_audio   ,
    entry           ,
    profile_create  ,
    login           ,
    run_over        ,
    up              ,
    down            ,
    left            ,
    right           ,
    downloading     ,
    download_wait   ,
    reading         ,
    tutorial        ,
}

global.k=ds_map_create()

global.k[? 'up']   =vk_up
global.k[? 'down'] =vk_down
global.k[? 'left'] =vk_left
global.k[? 'right']=vk_right
global.k[? 'jump'] =ord('Z')
global.k[? 'throw']=ord('X')
global.k[? 'dash'] =vk_shift

