var collisions=ds_list_create()

for (i=0;i!=instance_number(argument0);i++)
{
    enemy=instance_find(argument0,i)
    
    if point_distance(x,y,enemy.x,enemy.y)<10
    {
        if (state=s.forward and ds_list_find_index(forward_hit,enemy)=-1) or (state=s.backward and ds_list_find_index(backward_hit,enemy)=-1)
        {
            ds_list_add(collisions,enemy)
            
            if state=s.forward
            {
                ds_list_add(forward_hit,enemy)
            }
            
            if state=s.backward
            {
                ds_list_add(backward_hit,enemy)
            }
        }
    }
}

show_debug_message('Axe Collisions: '+string(ds_list_size(collisions)))
return collisions
