x_spawn=argument0
y_spawn=argument1
type=argument2

if global.maximize_performance
{
    exit
}
if !(x_spawn>view_xview[0] and x_spawn<view_xview[0]+view_wview[0] and y_spawn>view_yview[0] and y_spawn<view_yview[0]+view_hview[0])
{
    exit
}

if type=='dash'
{
    repeat(3)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        p.direction=random(360)
        p.speed=random_range(0,1)
        p.gravity=0.05
        p.colour=c_aqua
        p.life=irandom_range(10,30)
        p.scale=2
    }
}

if type=='blood' and instance_exists(obj_axe)
{
    repeat(10)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        p.direction=point_direction(0,0,obj_axe.hsp,obj_axe.vsp)+random_range(-20,20)
        p.speed=random_range(1,3)
        p.gravity=0.05
        p.colour=merge_colour(c_red,c_black,random_range(0,0.5))
        p.life=irandom_range(10,40)
        p.scale=2
    }
}

if type=='axe_hit' and instance_exists(obj_axe)
{
    repeat(10)
    {
        p=instance_create(x_spawn+sign(hsp)*4,y_spawn+sign(vsp)*4,obj_particle)
        p.direction=point_direction(0,0,obj_axe.hsp,obj_axe.vsp)-180+random_range(-30,30)
        p.speed=random_range(0.5,2)
        p.gravity=0.05
        p.colour=merge_colour(72246,c_black,random_range(0,0.4))    // First colour is brown
        p.life=irandom_range(10,40)
        p.scale=2
    }
}

if type=='jump'
{
    repeat(10)
    {
        p=instance_create(x_spawn+random_range(-10,10),y_spawn,obj_particle)
        p.direction=270//+random_range(-40,40)
        p.speed=random_range(1,2)
        p.gravity=0.05
        p.colour=c_white//merge_colour(c_white,random_range(0,0.4))
        p.life=irandom_range(20,30)
        p.scale=2
    }
}

if type=='wall'
{
    repeat(2)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        
        if sign(obj_player.hsp)=-1
        {
            p.direction=random_range(0,45)
        }
        else
        {
            p.direction=random_range(135,180)
        }
        
        p.speed=random_range(0,0.5)
        p.gravity=0.05
        p.colour=merge_colour(72246,c_black,random_range(0,0.6)) // First colour is brown
        p.life=irandom_range(20,30)
        p.scale=2
    }
}

if type=='wall_jump'
{
    repeat(5)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        
        if sign(obj_player.hsp)=-1
        {
            p.direction=random_range(0,45)
        }
        else
        {
            p.direction=random_range(135,180)
        }
        
        p.speed=random_range(0,2)
        p.gravity=0.05
        p.colour=merge_colour(72246,c_black,random_range(0,0.6)) // First colour is brown
        p.life=irandom_range(20,30)
        p.scale=2
    }
}

if type=='move'
{
    repeat(5)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        
        if sign(obj_player.hsp)=-1
        {
            p.direction=random_range(0,45)
        }
        else
        {
            p.direction=random_range(135,180)
        }
        
        if state=s.dash
        {
            p.speed=random_range(2,5)
        }
        else
        {
            p.speed=random_range(1,2)
        }
        
        p.gravity=0.05
        p.colour=merge_colour(72246,c_green,random_range(0,0.6)) // First colour is brown
        p.life=irandom_range(20,30)
        p.scale=2
    }
}

if type=='savepoint_get'
{
    repeat(30)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        p.direction=random_range(0,360)
        p.speed=random_range(1,2)
        p.gravity=0
        p.colour=merge_colour(c_silver,c_lime,random_range(0,0.6))
        p.life=irandom_range(10,40)
        p.scale=2
    }
}

if type=='savepoint'
{
    repeat(2)
    {
        p=instance_create(x_spawn+random_range(-5,5),y_spawn+random_range(-7,7),obj_particle)
        p.direction=90
        p.speed=random_range(1,2)
        p.gravity=0
        p.colour=merge_colour(c_silver,c_lime,random_range(0,0.6))
        p.life=irandom_range(20,30)
        p.scale=2
    }
}

if type=='death'
{
    repeat(4)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        p.direction=random_range(0,360)
        p.speed=random_range(0.5,1)
        p.colour=merge_colour(choose(c_maroon,c_navy),c_black,random_range(0,0.2))
        p.life=irandom_range(40,80)
        p.scale=random_range(1.5,2)
    }
}

if type=='death_end'
{
    repeat(30)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        p.direction=random_range(0,360)
        p.speed=random_range(1,3)
        p.gravity=0
        p.colour=merge_colour(choose(c_maroon,c_navy),c_black,random_range(0,0.2))
        p.life=irandom_range(10,40)
        p.scale=random_range(1,3)
    }
}

if type=='teleport_savepoint'
{
    repeat(5)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        p.direction=random_range(0,360)
        p.speed=random_range(0.5,1.5)
        p.gravity=random_range(0.04,0.1)
        p.colour=c_lime
        p.life=irandom_range(10,40)
        p.scale=random_range(1,3)
    }
}

if type=='teleport_telepoint'
{
    repeat(5)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        p.direction=random_range(0,360)
        p.speed=random_range(0.5,1.5)
        p.gravity=random_range(0.04,0.1)
        p.colour=c_aqua
        p.life=irandom_range(10,40)
        p.scale=random_range(1,3)
    }
}

if type=='dirtball'
{
    repeat(4)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        p.direction=random(360)
        p.speed=random_range(0,1)
        p.gravity=0.05
        p.colour=3959009    // Dirty Caramel
        p.life=irandom_range(10,20)
        p.scale=random_range(2,2.5)
    }
}

if type=='dirtball_hit'
{
    repeat(10)
    {
        p=instance_create(x_spawn,y_spawn,obj_particle)
        p.speed=random_range(0.3,1.2)
        p.direction=random_range(0,360)
        p.colour=3959009    // Dirty Caramel
        p.life=irandom_range(10,40)
        p.scale=random_range(2,3)
    }
}
