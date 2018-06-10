notify=instance_create(0,0,obj_profile_create_notify)
notify.alpha=5

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

profile_create_exit=true
