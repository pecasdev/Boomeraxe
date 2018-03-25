new_profiles[#1,selected_profile]=global.game_time
ds_grid_sort(new_profiles,1,1)
return ds_grid_value_y(new_profiles,0,0,0,ds_grid_height(new_profiles),global.selected_profile)+1     // +1 since index starts at 0
