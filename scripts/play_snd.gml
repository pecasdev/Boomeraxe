if audio_is_playing(argument[0])
{
    audio_stop_sound(argument[0])
}

if argument_count=2 and argument[1]='in_view'
{
    if x>view_xview[0] and x<view_xview[0]+view_wview[0] and y>view_yview[0] and y<view_yview[0]+view_hview[0]
    {
        if audio_is_playing(argument[0])
        {
            audio_stop_sound(argument[0])
        }

        audio_play_sound(argument[0],10,0)
    }
}

if argument_count=2 and argument[1]='repeat'
{
    audio_play_sound(argument[0],10,999)
}
else
{
    audio_play_sound(argument[0],10,0)
}
