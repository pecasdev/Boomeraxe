for(i=0;i!=ds_grid_height(global.profiles);i+=1)
{
    if global.profiles[#0,i]=argument0
    {
        return true
    }
}
return 'pass'
