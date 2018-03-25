datetime=argument0
gm_datetime=date_inc_second(global.unix_start,datetime)

// Timezone setting for local display
date_set_timezone(timezone_local)

year    =date_get_year(gm_datetime)
month   =date_get_month(gm_datetime)
day     =date_get_day(gm_datetime)

hour    =date_get_hour(gm_datetime)
minute  =date_get_minute(gm_datetime)
second  =date_get_second(gm_datetime)

if hour>12 or (hour=12 and (minute>0 or second>0))
{
    if hour>12
    {
        hour-=12
    }
    abbr='PM'
}
else
{   
    abbr='AM'
}

year=string_pad(year)
month=string_pad(month)
day=string_pad(day)
hour=string_pad(hour)
minute=string_pad(minute)

return year+'/'+month+'/'+day+' - '+hour+':'+minute+' '+abbr
