ini_open('boomeraxe.ini')

global.best_time=ini_read_real('meta','best',2000)
profile_count=ini_read_real('meta','profile_count',1)

global.profiles=ds_grid_create(11,profile_count)

new_profiles=ds_list_create()

for (i=0;i!=profile_count;i++)
{
    name=ini_read_string('meta',string(i),'')
    
    global.profiles[#0,i]=name
    global.profiles[#1,i]=ini_read_real(name,'best_time',0)
    global.profiles[#2,i]=ini_read_string(name,'best_date',0)
    global.profiles[#3,i]=ini_read_real(name,'run_count',0)
    
    if global.profiles[#3,i]=0
    {
        ds_list_add(new_profiles,name)
    }
    
    ds_grid_resize(global.profiles,max(ds_grid_width(global.profiles),(global.profiles[#3,i]+1)*6+11),profile_count)

    for (z=0;z!=global.profiles[#3,i]*6;z+=6)
    {
        global.profiles[#z+4,i]=ini_read_real(name,string(z/6)+'0',0)    // Runtime
        global.profiles[#z+5,i]=ini_read_string(name,string(z/6)+'1',0)  // Date 
        global.profiles[#z+6,i]=ini_read_real(name,string(z/6)+'2',0)    // Kills
        global.profiles[#z+7,i]=ini_read_real(name,string(z/6)+'3',0)    // Deaths
        global.profiles[#z+8,i]=ini_read_real(name,string(z/6)+'4',0)    // Jumps
        global.profiles[#z+9,i]=ini_read_real(name,string(z/6)+'5',0)    // Dashes
    }
    
    global.profiles[#4+(global.profiles[#3,i]+1)*6+0,i]=ini_read_real(name,'up',vk_up)
    global.profiles[#4+(global.profiles[#3,i]+1)*6+1,i]=ini_read_real(name,'down',vk_down)
    global.profiles[#4+(global.profiles[#3,i]+1)*6+2,i]=ini_read_real(name,'left',vk_left)
    global.profiles[#4+(global.profiles[#3,i]+1)*6+3,i]=ini_read_real(name,'right',vk_right)
    global.profiles[#4+(global.profiles[#3,i]+1)*6+4,i]=ini_read_real(name,'jump',ord('Z'))
    global.profiles[#4+(global.profiles[#3,i]+1)*6+5,i]=ini_read_real(name,'throw',ord('X'))
    global.profiles[#4+(global.profiles[#3,i]+1)*6+6,i]=ini_read_real(name,'dash',vk_shift)
}

ds_grid_sort(global.profiles,1,1)

for (i=0;i!=ds_list_size(new_profiles);i+=1)
{
    for (z=0;z!=profile_count;z+=1)
    {
        if global.profiles[#0,z]=new_profiles[| i]
        {
            ds_grid_set_grid_region(global.profiles,global.profiles,0,z,ds_grid_width(global.profiles)-1,ds_grid_height(global.profiles)-1,0,-1)
        }
        
        ds_grid_set_region(global.profiles,0,ds_grid_height(global.profiles)-1,ds_grid_width(global.profiles)-1,ds_grid_height(global.profiles)-1,0)
        global.profiles[#0,ds_grid_height(global.profiles)-1]=new_profiles[| i]
        break
    }
    show_debug_message('SHIFTED!')
}
ini_close()


