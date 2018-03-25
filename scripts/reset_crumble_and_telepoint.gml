for(i=0;i!=ds_list_size(obj_host.crumble_spawns);i+=2)
{
    x_spawn=obj_host.crumble_spawns[| i]
    y_spawn=obj_host.crumble_spawns[| i+1]
    instance_create(x_spawn,y_spawn,obj_wall_crumble)
}

for(i=0;i!=ds_list_size(obj_host.telepoint_spawns);i+=2)
{
    x_spawn=obj_host.telepoint_spawns[| i]
    y_spawn=obj_host.telepoint_spawns[| i+1]
    instance_create(x_spawn,y_spawn,obj_telepoint)
}

// Refresh Lists
ds_list_destroy(obj_host.crumble_spawns)
ds_list_destroy(obj_host.telepoint_spawns)
obj_host.crumble_spawns=ds_list_create()
obj_host.telepoint_spawns=ds_list_create()
