execfile('boomeraxe_server_imports.py')
execfile('boomeraxe_server_functions.py')
execfile('boomeraxe_server_variables.py')

while True:
    data=client_recieve()
    msg_id=data[0]

    if msg_id=='pull':
        print "Pull request from client, sending data"
        # READ boomeraxe.ini AND SEND TO CLIENT

    if msg_id=='push_run':
        print "Push request from client, accepting data"
        print "---- PAYLOAD ----"
        print "User   :",data[1]
        print "Time   :",data[2]
        print "Date   :",data[3]
        print ""
        print "Kills  :",data[4]
        print "Deaths :",data[5]
        print "Jumps  :",data[6]
        print "Dashes :",data[7]
        print "----   END   ----"

        # APPEND NEW RUN TO boomeraxe.ini
        name=data[1]
        new_run=int(float(ini_read(data[1],'run_count')))

        ini_write(name,new_run+'0',data[2])
        ini_write(name,new_run+'1',data[3])
        ini_write(name,new_run+'2',data[4])
        ini_write(name,new_run+'3',data[5])
        ini_write(name,new_run+'4',data[6])
        ini_write(name,new_run+'5',data[7])

        if ini_read(name,'best_time')<data[2]:
            ini_write(name,'best_time',data[2])
            ini_write(name,'best_date',data[3])

        ini_write(name,'run_count',new_run+1)

    if msg_id=='push_bind':
        print "Push request from client, accepting data"
        print "---- PAYLOAD ----"
        print "User  :",data[1]
        print ""
        print "Up    :",data[2]
        print "Down  :",data[3]
        print "Left  :",data[4]
        print "Right :",data[5]
        print "Jump  :",data[6]
        print "Throw :",data[7]
        print "Dash  :",data[8]
        print "----   END   ----"

        #UPDATE boomeraxe.ini WITH NEW BINDINGS
        name=data[1]

        ini_write(name,'up',data[2])
        ini_write(name,'down',data[3])
        ini_write(name,'left',data[4])
        ini_write(name,'right',data[5])
        ini_write(name,'jump',data[6])
        ini_write(name,'throw',data[7])
        ini_write(name,'dash',data[8])

    if msg_id=='login':
        if hashlib.sha356(data[2]).hexdigest()==ini_read(name,'pass'):
            print "<{}> -- <LOGIN PASS> - ({}) - [{}][{}]".format(time.strftime("%d/%m/%y - %H:%M:%S"),client[0],name,data[2])
            # SEND BACK 'PASS' TO CLIENT

        else:
            print "<{}> -- <LOGIN FAIL> - ({}) - [{}][{}]".format(time.strftime("%d/%m/%y - %H:%M:%S"),client[0],name,data[2])
            # SEND BACK 'FAIL' TO CLIENT

    if msg_id=='create':
        print "Create request from client, creating profile"
        print "---- PROFILE ----"
        print "User :",data[1]
        print "Pass :",data[2]
        print ""
        print "Up    :",data[3]
        print "Down  :",data[4]
        print "Left  :",data[5]
        print "Right :",data[6]
        print "Jump  :",data[7]
        print "Throw :",data[8]
        print "Dash  :",data[9]
        print "----   END   ----"
        # WRITE NEW PROFILE TO boomeraxe.ini 
