///format_time_full(time,split)
time=argument0
split=argument1
sym=''

if split=true
{
    if sign(time)=-1 or sign(time)=0
    {
        sym='-'
        time=abs(time)
    }
    else
    {
        sym='+'
    }
}

m=floor(time/6000)
s=floor(time/100 mod 60)
ms=(time mod 100)

m=string_pad(m)
s=string_pad(s)
ms=string_pad(ms)

if split
{
    return '('+sym+m+':'+s+'.'+ms+')'
}
else
{
    return m+':'+s+'.'+ms
}
