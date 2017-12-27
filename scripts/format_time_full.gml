time=argument0

h=floor(time/3600)
m=floor(time/60)
s=floor(time mod 60)
ms=frac(time)*100

h=string_replace(string_format(h,2,0),' ','0')
m=string_replace(string_format(m,2,0),' ','0')
s=string_replace(string_format(s,2,0),' ','0')
ms=string_replace(string_format(ms,2,0),' ','0')

return(h+' : '+m+' : '+s+' . '+ms)

