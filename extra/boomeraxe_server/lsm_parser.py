import os,os.path
import configparser
import socket

s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
config=configparser.ConfigParser()

def send_payload(payload):
    payload_string=''
    for item in payload:
        payload_string+=str(item)+'#\x00'
        
    s.sendto(payload_string,('192.168.0.200',9000))
    print '[PAYLOAD] >> ',payload
        
for filename in [f for f in os.listdir('.') if os.path.isfile(f) and '.boomeraxe' in f]:  
    config.read(filename)

    user=filename.replace('.boomeraxe','')

    if config.has_option('save','up'):
        up=    str(int(float(config.get('save','up').replace('"',''))))
        down=  str(int(float(config.get('save','down').replace('"',''))))
        left=  str(int(float(config.get('save','left').replace('"',''))))
        right= str(int(float(config.get('save','right').replace('"',''))))
        jump=  str(int(float(config.get('save','jump').replace('"',''))))
        throw= str(int(float(config.get('save','throw').replace('"',''))))
        dash=  str(int(float(config.get('save','dash').replace('"',''))))

        if config.has_option('save','pass'):
            pswd=str(config.get('save','pass').replace('"',''))

            send_payload(['create',user,pswd,up,down,left,right,jump,throw,dash])
            
        else:
            send_payload(['push_bind',user,up,down,left,right,jump,throw,dash])
    
    if config.has_option('save','run_count'):
        run_count=int(float(config.get('save','run_count').replace('"','')))

        for run in range(run_count):            
            time  =str(int(float(config.get('save',str(run)+'0').replace('"',''))))
            date  =str(int(float(config.get('save',str(run)+'1').replace('"',''))))
            kills =str(int(float(config.get('save',str(run)+'2').replace('"',''))))
            deaths=str(int(float(config.get('save',str(run)+'3').replace('"',''))))
            jumps =str(int(float(config.get('save',str(run)+'4').replace('"',''))))
            dashes=str(int(float(config.get('save',str(run)+'5').replace('"',''))))

            send_payload(['push_run',user,time,date,kills,deaths,jumps,dashes])
                    
