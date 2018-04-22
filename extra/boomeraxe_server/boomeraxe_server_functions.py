def ini_read(key,value):
    global config
    return config.get(key,value).replace('"','')

def ini_write(key,value,data,write_asis):
    global config
    if write_asis:
        config.set(key,value,'"{}"'.format(data))
    else:
        config.set(key,value,'"{}"'.format(data+'.000000'))
        
    config.set('meta','version',str(int(time.time()))+'.000000')
    
def client_recieve():
    global s
    s_data,client=s.recvfrom(1024)
    data=s_data.replace('\x00','').split('#')
    return data,client

def client_send(data,client):
    global s
    s_data=''
    
    for item in data:
        s_data+=str(item)+'\x00'
        
    s.sendto(s_data,client)
        
def log(*a):
    time=datetime.now().strftime("%d/%m/%y | %H:%M:%S")
    output='[ {} ]  ::  ( {} | {} )  ::  '.format(time,a[0].center(12),a[1].center(16))
    
    extra=''
    for i in range(len(a)-2):
        extra+='%s'
    
    extra=' | '.join([extra[i:i+2] for i in range(0, len(extra), 2)])
    
    output=output+'< {} >'.format(extra % tuple(a[2:]))
    
    with open('boomeraxe_server_log.txt','a') as f:
        f.write(output+'\n')
        
    return output
