if global.profiles[#1,username]!=undefined
{
    global.k[? 'up']    =global.profiles[#4+(global.profiles[#3,username]+1)*6+0,username]
    global.k[? 'down']  =global.profiles[#4+(global.profiles[#3,username]+1)*6+1,username]
    global.k[? 'left']  =global.profiles[#4+(global.profiles[#3,username]+1)*6+2,username]
    global.k[? 'right'] =global.profiles[#4+(global.profiles[#3,username]+1)*6+3,username]
    global.k[? 'jump']  =global.profiles[#4+(global.profiles[#3,username]+1)*6+4,username]
    global.k[? 'throw'] =global.profiles[#4+(global.profiles[#3,username]+1)*6+5,username]
    global.k[? 'dash']  =global.profiles[#4+(global.profiles[#3,username]+1)*6+6,username]
}
else
{
    global.k[? 'up']    =global.profiles[#2,username]
    global.k[? 'down']  =global.profiles[#3,username]
    global.k[? 'left']  =global.profiles[#4,username]
    global.k[? 'right'] =global.profiles[#5,username]
    global.k[? 'jump']  =global.profiles[#6,username]
    global.k[? 'throw'] =global.profiles[#7,username]
    global.k[? 'dash']  =global.profiles[#8,username]
}
