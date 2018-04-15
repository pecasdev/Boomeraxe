temp_list=ds_list_create()

ds_list_add(temp_list,global.k[? 'up'])
ds_list_add(temp_list,global.k[? 'down'])
ds_list_add(temp_list,global.k[? 'left'])
ds_list_add(temp_list,global.k[? 'right'])
ds_list_add(temp_list,global.k[? 'jump'])
ds_list_add(temp_list,global.k[? 'throw'])
ds_list_add(temp_list,global.k[? 'dash'])

for(i=0;i!=7;i++)
{
    if i!=binding_select and keyboard_key=temp_list[| i]
    {
        ds_list_destroy(temp_list)
        return true
    }
}

ds_list_destroy(temp_list)    

return false
