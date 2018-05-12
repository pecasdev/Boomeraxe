for(i=0;i!=string_length(argument0);i+=1)
{
    if ord(string_char_at(argument0,i+1))>180
    {
        return false
    }
}
return true
