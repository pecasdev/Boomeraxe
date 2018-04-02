/// draw_select(x_tar,y_tar,w_tar,h_tar,thick)

x_tar=argument0
y_tar=argument1
w_tar=argument2/2
h_tar=argument3/2
thick=argument4

x_cur+=(x_tar-x_cur)/3
y_cur+=(y_tar-y_cur)/3
w_cur+=(w_tar-w_cur)/3
h_cur+=(h_tar-h_cur)/3

if abs(x_tar-x_cur)<5
{
    x_cur=x_tar
}

if abs(y_tar-y_cur)<5
{
    y_cur=y_tar
}

if abs(w_tar-w_cur)<5
{
    w_cur=w_tar
}

if abs(h_tar-h_cur)<5
{
    h_cur=h_tar
}

if mix=0.2
{
    up=true
    dn=false
}

if mix=0.8
{
    up=false
    dn=true
}

mix+=(up-dn)*0.03

c1=merge_colour(c_blue,c_aqua,mix)
c2=merge_colour(c_blue,c_aqua,mix)
c3=merge_colour(c_blue,c_aqua,mix)
c4=merge_colour(c_blue,c_aqua,mix)

for (i=0;i!=thick;i++)
{
    draw_rectangle_colour(x_cur-w_cur+i,y_cur-h_cur+i,x_cur+w_cur-i,y_cur+h_cur-i,c1,c2,c3,c4,1)
}
