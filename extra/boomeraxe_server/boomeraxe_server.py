print "Boomeraxe server dependencies initializing..."

execfile('boomeraxe_server_imports.py')
execfile('boomeraxe_server_functions.py')
execfile('boomeraxe_server_variables.py')

def listen():
    global server_queue
    while True:
        data,client=client_recieve()
        server_queue.append([data,client])
        client_send(['in_queue',len(server_queue)],client)

def tasks():
    global server_queue
    while True:
        if len(server_queue)>0:
            data,client=server_queue.pop(0)
        
            msg_id=data[0]

            if msg_id=='ping':
                print log('ping',client[0],data[1])
                client_send(['ping'],client)
                
            if msg_id=='pull':
                # READ boomeraxe.ini AND SEND TO CLIENT LINE BY LINE
                tag=0
                if int(data[2])!=int(float(ini_read('meta','version'))):
                    with open('boomeraxe.ini','r') as f:
                        lines=f.readlines()
                        
                        while lines:
                            time.sleep(0.02) # Not too fast or gamemaker will miss some
                            payload=[]
                            for i in range(200):
                                try:
                                    payload+=[tag,lines.pop(0)]
                                    tag+=1
                                    
                                except:
                                    break
                                
                            client_send(['pull']+payload,client)
                            
                    print log('pull',client[0],'outdated version',data[1],data[2])

                else:
                    print log('pull',client[0],'current version',data[1],data[2])
                    
                client_send(['pull','done',tag],client)
                        
            if msg_id=='push_run':
                new_run=str(int(float(ini_read(data[1],'run_count'))))

                # CHECK IF DUPLICATE RUN
                duplicate=False
                for i in range(int(new_run)):
                    if int(float(ini_read(data[1],str(i)+'1')))==int(data[3]):
                        duplicate=True

                if not duplicate:        
                    # APPEND NEW RUN TO boomeraxe.ini
                    name=data[1]

                    ini_write(name,new_run+'0',data[2],False)
                    ini_write(name,new_run+'1',data[3],False)
                    ini_write(name,new_run+'2',data[4],False)
                    ini_write(name,new_run+'3',data[5],False)
                    ini_write(name,new_run+'4',data[6],False)
                    ini_write(name,new_run+'5',data[7],False)

                    if int(float(ini_read(name,'best_time')))>int(data[2]) or int(float(ini_read(data[1],'run_count')))==0:
                        ini_write(name,'best_time',data[2],False)
                        ini_write(name,'best_date',data[3],False)

                    if int(float(ini_read('meta','best')))>int(data[2]):
                        ini_write('meta','best',data[2],False)

                    ini_write(name,'run_count',str(int(new_run)+1),False)
                    
                    with open('boomeraxe.ini','w') as f:
                        config.write(f)
                    
                    client_send(['reciept','push_run'],client)
                    print log('push_run',client[0],data[1],data[2])
            
            if msg_id=='push_bind':
                print log('push_bind',client[0],data[1])

                #UPDATE boomeraxe.ini WITH NEW BINDINGS
                name=data[1]

                ini_write(name,'up',data[2],False)
                ini_write(name,'down',data[3],False)
                ini_write(name,'left',data[4],False)
                ini_write(name,'right',data[5],False)
                ini_write(name,'jump',data[6],False)
                ini_write(name,'throw',data[7],False)
                ini_write(name,'dash',data[8],False)
                   
                with open('boomeraxe.ini','w') as f:
                    config.write(f)

                client_send(['reciept','push_bind'],client)
                
            if msg_id=='login':
                name=data[1]
                
                if hashlib.sha256(hashlib.sha256(data[2]).hexdigest()).hexdigest()==ini_read(name,'pass'):
                    print log('login_pass',client[0],name,data[2])
                    client_send(['login','pass',name],client)

                else:
                    print log('login_fail',client[0],name,data[2])
                    client_send(['login','fail',name],client)
                
            if msg_id=='create':
                if not config.has_section(data[1]):
                    config.add_section(data[1])
                    
                    ini_write(data[1],'pass',hashlib.sha256(hashlib.sha256(data[2]).hexdigest()).hexdigest(),True)
                    ini_write(data[1],'best_time','0',False)
                    ini_write(data[1],'best_date','0',False)
                    ini_write(data[1],'run_count','0',False)
                    ini_write(data[1],'up',data[3],False)
                    ini_write(data[1],'down',data[4],False)
                    ini_write(data[1],'left',data[5],False)
                    ini_write(data[1],'right',data[6],False)
                    ini_write(data[1],'jump',data[7],False)
                    ini_write(data[1],'throw',data[8],False)
                    ini_write(data[1],'dash',data[9],False)

                    profile_count=int(float(ini_read('meta','profile_count')))
                    ini_write('meta',str(profile_count),data[1],True)
                    ini_write('meta','profile_count',str(profile_count+1),False)
                    
                    with open('boomeraxe.ini','w') as f:
                        config.write(f)
                    
                    print log('create_pass',client[0],data[1],data[2])
                    client_send(['reciept','create','pass'],client)
                    
                else:
                    print log('create_fail',client[0],data[1],data[2])
                    client_send(['reciept','create','fail'],client)

            if msg_id=='create_name_check':
                if not config.has_section(data[1]):
                    client_send(['create_name_check','pass'],client)
                else:
                    client_send(['create_name_check','fail'],client)

# START THREADS
threading.Thread(target=listen).start()
threading.Thread(target=tasks).start()

print "Boomeraxe server online!"
