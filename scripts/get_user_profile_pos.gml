for (i=0;i!=ds_list_size(rows);i+=1)
{
    if rows[| i]=user_profile
    {
        return i
    }
}
