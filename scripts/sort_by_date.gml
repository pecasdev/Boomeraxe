repeat(argument0)
{
    swap_index=0
    repeat(argument0)
    {
        if global.profiles[#2,i+swap_index]>global.profiles[#2,i+swap_index+1]
        {        
            show_debug_message('SWAPPED '+string(global.profiles[#0,i+swap_index])+' WITH '+string(global.profiles[#0,i+swap_index+1]))
            
            row_index=0
            repeat (ds_grid_width(global.profiles))
            {
                hold=ds_grid_get(global.profiles,row_index,i+swap_index)
                ds_grid_set(global.profiles,row_index,i+swap_index,ds_grid_get(global.profiles,row_index,i+swap_index+1))
                ds_grid_set(global.profiles,row_index,i+swap_index+1,hold)
                row_index+=1
            }
        }
        else
        {
            show_debug_message(global.profiles[#0,i+swap_index]+' is greater than '+global.profiles[#0,i+swap_index+1]+' by '+string(global.profiles[#2,i+swap_index]-global.profiles[#2,i+swap_index+1]))
        }
        swap_index+=1
    }  
    show_debug_message('REITERATE')          
}

