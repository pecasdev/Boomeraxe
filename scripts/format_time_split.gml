raw=argument0
time=raw/room_speed

seconds=string_replace(string_format(floor((time mod 3600)mod 60),2,0),' ','0')
milliseconds=string_replace(string_format(floor(abs((raw*100/60)mod 100)),2,0),' ','0')

return(seconds+' : '+milliseconds)
