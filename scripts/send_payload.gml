// (create)     - user,pass,up,down,left,right,jump,throw,dash
// (login)      - user,pass
// (pull)       - user,version
// (push_run)   - user,game_time,date,kill_count,death_count,jump_count,dash_count
// (push_bind)  - user,up,down,left,right,jump,throw,dash

if global.local_save_mode
{
    exit
}

payload=buffer_create(1,buffer_grow,1)

for(i=0;i!=argument_count;i++)
{
    buffer_write(payload,buffer_string,string(argument[i])+'#')
}

network_send_udp_raw(global.udp_socket,global.ip,9000,payload,buffer_tell(payload))
buffer_delete(payload)

show_debug_message('--PAYLOAD SENT--')
