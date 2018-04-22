f=file_text_open_write('boomeraxe.ini')

for (i=0;i!=ds_map_size(data_stack);i++)
{
    file_text_write_string(f,data_stack[? string(i)])
    show_debug_message('written line '+string(i))
}

file_text_close(f)
