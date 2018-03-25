///format_time_split(time,symbol)
time=argument0
symbol=argument1
sym=''

if symbol=true
{
    if sign(time)=-1
    {
        sym='-'
        time=abs(time)
    }
    else
    {
        sym='+'
    }
}

m=floor(time/60)
s=floor(time mod 60)
ms=frac(time)*100

m=string_pad(m)
s=string_pad(s)
ms=string_pad(ms)

return(sym+m+':'+s+'.'+ms)

