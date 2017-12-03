for (i=0;i!=instance_number(obj_spike);i++)
{
    with(instance_find(obj_spike,i))
    {
        if !place_meeting(x,y-1,obj_wall)
        {
            shard=instance_create(x,y-20,obj_spike_shard)
            shard.image_index=0
        }
        
        if !place_meeting(x,y+1,obj_wall)
        {
            shard=instance_create(x,y+20,obj_spike_shard)
            shard.image_index=1
        }
            
        if !place_meeting(x-1,y,obj_wall)
        {
            shard=instance_create(x-20,y,obj_spike_shard)
            shard.image_index=2
        }
        
        if !place_meeting(x+1,y,obj_wall)
        {
            shard=instance_create(x+20,y,obj_spike_shard)
            shard.image_index=3
        }
    }
}
