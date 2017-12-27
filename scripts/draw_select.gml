x_tar=argument0
y_tar=argument1
w_tar=argument2
h_tar=argument3

x_cur+=(x_tar-x_cur)/5
y_cur+=(y_tar-y_cur)/5
w_cur+=(w_tar-w_cur)/5
h_cur+=(h_tar-h_cur)/5

draw_rectangle(x_cur-w_cur,y_cur-h_cur,x_cur+w_cur,y_cur+h_cur,1)
