def ini_read(key,value):
    global config
    return config.get(key,value).replace('"','')

def ini_write(key,value,data):
    global config
    config.set(key,value,'"{}"'.format(data+'.000000'))
    
    with open('boomeraxe.ini','w') as f:
        config.write(f)

def client_recieve():
    s_data,client=s.recvfrom(1024)    
    data=s_data.replace('\x00','').split('#')
    return data,client
	
def log(*a):
    output='[BOOMERAXE] - {} - ({})'.format(a[0],a[1]).ljust(35)

    extra=''
    for i in range(len(a)-2):
        extra+='%s'

    extra=' | '.join([extra[i:i+2] for i in range(0, len(extra), 2)])

    return (output+'< {} >'.format(extra % tuple(a[2:]))).ljust(85)
