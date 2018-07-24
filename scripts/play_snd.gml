sound=undefined

if argument_count=2 and argument[1]='in_view'
{
    if x>view_xview[0] and x<view_xview[0]+view_wview[0] and y>view_yview[0] and y<view_yview[0]+view_hview[0]
    {
        if audio_is_playing(argument[0])
        {
            audio_stop_sound(argument[0])
        }

        sound=audio_play_sound(argument[0],10,0)
    }
}
else
{   
    if audio_is_playing(argument[0])
    {
        audio_stop_sound(argument[0])
    }
    
    if argument_count=2 and argument[1]='repeat'
    {
        sound=audio_play_sound(argument[0],10,999)
    }
    else
    {
        sound=audio_play_sound(argument[0],10,0)
    }
}

if sound!=undefined
{
    if global.volume_mute
    {
        audio_sound_gain(sound,0,0)
    }
    else
    {
        audio_sound_gain(sound,global.volume_effects/10*2,0)
        show_debug_message(audio_sound_get_gain(sound))
    }
}

