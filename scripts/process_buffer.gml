buffer=argument0

msg_id=buffer_read(buffer,buffer_string)

if msg_id='login_pass'
{

}

if msg_id='login_fail'
{

}

if msg_id='leaderboard_pull'
{

}

if msg_id='test'
{
    show_debug_message(buffer_read(buffer,buffer_string))
}
    

