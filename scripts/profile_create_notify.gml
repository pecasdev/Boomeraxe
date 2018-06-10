notify=instance_create(0,0,obj_profile_create_notify)

if argument0='checking'
{
    notify.col=c_white
    notify.text='checking...'
}
else
{
    instance_destroy(obj_profile_create_notify)
    notify=instance_create(0,0,obj_profile_create_notify)
}

if argument0='pass'
{
    notify.col=c_lime
    notify.text='Profile Created!'
}

if argument0='fail'
{
    notify.col=c_red
    notify.text='Profile Error'
}

gui_state=s.title
