for (i=-10;i!=20;i+=2)
{
    for (z=-10;z!=20;z+=2)
    {
        shatter=instance_create(obj_player.x,obj_player.y,obj_player_shatter)
        
        shatter.left=i
        shatter.top=z
    }
}

