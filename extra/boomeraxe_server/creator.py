import names
import random
import time

profiles=[]
overall_best_time=20000
name_list=[]

# GENERATION
for i in range(input('Number of Users: ')):
    
    while True:
        user=names.get_first_name()[:10].lower()
        if user not in name_list:
            name_list.append(user)
            break
    
    passwd="242ab4ac31522e28fb16163c45c0c19e4402c4a32bcb3b144e7c2edce675b150"

    profile_data=[]
    
    for x in range(random.randint(5,50)):
        runtime=random.randint(21000,60000)
        datetime=random.randint(1000000000,1500000000)
        kills=random.randint(5,50)
        deaths=random.randint(10,150)
        jumps=random.randint(30,300)
        dashes=random.randint(30,300)
        profile_data.append([runtime,datetime,kills,deaths,jumps,dashes])

    best_time=runtime
    best_date=0
    
    for item in profile_data:
        if item[0]<best_time:
            best_time=item[0]
            best_date=item[1]
            
        if item[0]<overall_best_time:
            overall_best_time=item[0]
        
    profiles.append([user,passwd,best_time,best_date,x+1,profile_data])
    
# WRITING        
with open('boomeraxe.ini','r+') as f:
    f.write('[meta]'+'\n')
    f.write('best="{}"'.format(str(overall_best_time)+'.000000')+'\n')
    f.write('profile_count="{}"'.format(str(len(profiles))+'.000000')+'\n')
    
    for i in range(len(profiles)):
        f.write(str(i)+'="{}"'.format(profiles[i][0])+'\n')

    for i in range(len(profiles)):
        f.write('\n')
        f.write('[{}]'.format(profiles[i][0])+'\n')
        f.write('pass="{}"'.format(profiles[i][1])+'\n')
        f.write('best_time="{}"'.format(str(profiles[i][2])+'.000000')+'\n')
        f.write('best_date="{}"'.format(str(profiles[i][3])+'.000000')+'\n')
        f.write('run_count="{}"'.format(str(profiles[i][4])+'.000000')+'\n')
        
        f.write('up="38.000000"\n')
        f.write('down="40.000000"\n')
        f.write('left="37.000000"\n')
        f.write('right="39.000000"\n')
        f.write('jump="90.000000"\n')
        f.write('throw="88.000000"\n')
        f.write('dash="16.000000"\n') 

        for x in range(profiles[i][4]):
            f.write(str(x)+'0="{}"'.format(str(profiles[i][5][x][0])+'.000000')+'\n')
            f.write(str(x)+'1="{}"'.format(str(profiles[i][5][x][1])+'.000000')+'\n')
            f.write(str(x)+'2="{}"'.format(str(profiles[i][5][x][2])+'.000000')+'\n')
            f.write(str(x)+'3="{}"'.format(str(profiles[i][5][x][3])+'.000000')+'\n')
            f.write(str(x)+'4="{}"'.format(str(profiles[i][5][x][4])+'.000000')+'\n')
            f.write(str(x)+'5="{}"'.format(str(profiles[i][5][x][5])+'.000000')+'\n')
          
