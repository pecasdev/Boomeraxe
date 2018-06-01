if argument0="anonymous"
{
    return "anonymous"
}

for (i=0;i!=ds_list_size(global.profiles);i+=1)
{
    if global.profiles[#0,i]=argument0
    {
        return i
    }
}
