top=ds_list_create()
ds_list_add(top,0,1,2,3,10,12,13,14)
bottom=ds_list_create()
ds_list_add(bottom,2,5,7,8,10,11,12,14)
left=ds_list_create()
ds_list_add(left,1,4,5,6,10,11,13,14)
right=ds_list_create()
ds_list_add(right,3,6,8,9,11,12,13,14)

for (i=0;i!=instance_number(obj_spike);i++)
{
    with(instance_find(obj_spike,i)) 
    {
        if ds_list_find_index(other.top,variant)>=0         // and !place_meeting(x,y-1,obj_wall)
        {
            shard=instance_create(x,y-20,obj_spike_shard)
            shard.image_index=0
        }
     
        if ds_list_find_index(other.bottom,variant)>=0      // and !place_meeting(x,y+1,obj_wall)
        {
            shard=instance_create(x,y+20,obj_spike_shard)
            shard.image_index=1
        }
            
        if ds_list_find_index(other.left,variant)>=0        // and !place_meeting(x-1,y,obj_wall)
        {
            shard=instance_create(x-20,y,obj_spike_shard)
            shard.image_index=2
        }
        
        if ds_list_find_index(other.right,variant)>=0       // and !place_meeting(x+1,y,obj_wall)
        {
            shard=instance_create(x+20,y,obj_spike_shard)
            shard.image_index=3
        }
    }
}

ds_list_destroy(top)
ds_list_destroy(bottom)
ds_list_destroy(left)
ds_list_destroy(right)
