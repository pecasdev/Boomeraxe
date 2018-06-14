/// create_overlay_row(pos,username,rank,time)

row=instance_create(400,492+27*argument0,obj_overlay_row)
row.username=argument1
row.rank=argument2
row.time=argument3

ds_list_add(rows,row)
