raw=argument0
time=raw/room_speed

hours=string_replace(string_format(floor(time/3600),2,0),' ','0')
minutes=string_replace(string_format(floor((time mod 3600)/60),2,0),' ','0')
seconds=string_replace(string_format(floor((time mod 3600)mod 60),2,0),' ','0')
milliseconds=string_replace(string_format(floor((raw*100/60)mod 100),2,0),' ','0')

return(hours+' : '+minutes+' : '+seconds+' : '+milliseconds)
