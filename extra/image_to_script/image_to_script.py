from PIL import Image
import os.path
import os
import time

os.system('mode con: cols=140 lines=40')

def read_pixel(x,y,pixel):
    global script
    global corners
    obj='empty'
    
    if pixel==(000,000,000):    obj='obj_wall'
    if pixel==(000,000,200):    obj='obj_wall_crumble'

    if pixel[0]==225 and pixel[1]==225:
        obj='obj_guide_arrow'
        variant=pixel[2]/50
        
    if pixel[0]==100 and pixel[1]==000:    
        obj='obj_spike'
        variant=pixel[2]/10 
            
    if pixel[0]==150 and pixel[1]==000:
        obj='obj_spike_retract'
        variant=pixel[2]/10

    if pixel[0]==200:
        obj='obj_pendulum'
        variant='"'+str(pixel[2]/100)+str(pixel[1]/50)+'"'
        
    if pixel==(000,200,000):    obj='obj_savepoint'
    if pixel==(000,200,200):    obj='obj_telepoint'
    
    if pixel[0]==250 and pixel[1]==000:
        if pixel[2]==000:
            obj='obj_enemy0'
        if pixel[2]==100:
            obj='obj_enemy1'

    if obj!='empty':
        if obj=='obj_spike' or obj=='obj_spike_retract' or obj=='obj_pendulum' or obj=='obj_guide_arrow':
            script[x+y*img.size[0]]='block=instance_create({},{},{})'.format(x*20,y*20,obj).ljust(40)+'; block.variant={}'.format(variant)
        else:
            script[x+y*img.size[0]]='block=instance_create({},{},{})'.format(x*20,y*20,obj)
    else:
        script[x+y*img.size[0]]='//({},{},empty)'.format(x*20,y*20)
            
    return '[ {} ]'.format(obj).ljust(20)+'[ {} , {} ]'.format(x*20,y*20).ljust(20)+'[ {} / {} ]'.format(x+1+y*(corners[3]-corners[1]),(corners[3]-corners[1])*(corners[2]-corners[0])).ljust(20)+'[ #{} ]'.format(x+1+y*img.size[0]).ljust(20)+'[ {}% ]'.format(round((1.0*x+1+y*(corners[3]-corners[1]))/((corners[3]-corners[1])*(corners[2]-corners[0]))*100,2)).ljust(20)

def convert_image():
    global corners
    global img
    global script

    for y in range(corners[1],corners[3]):
        for x in range(corners[0],corners[2]):
            pixel=pix.getpixel((x,y))
            print read_pixel(x,y,pixel)

    print '\n\nWriting script...  ',
    with open('boomeraxe_room.txt','w') as f:
        for item in script:
                f.write(item.strip('\n')+'\n')
                    
    print 'DONE'
    
print '-----[ IMAGE >> SCRIPT v2.0 ]-----'

if os.path.isfile('boomeraxe_room.png') and os.path.isfile('boomeraxe_room.txt'):
    img=Image.open('boomeraxe_room.png')
    pix=img.convert('RGB')
    
elif os.path.isfile('E:\image_to_script\boomeraxe.png') and os.path.isfile('E:\image_to_script\boomeraxe.txt'):
    img=Image.open('E:\image_to_script\boomeraxe.png')
    pix=img.convert('RGB')

else:
    print '\nFile(s) Missing : Make sure \'boomeraxe_room.PNG\' and \'boomeraxe_room.TXT\' are in the same folder as \'image_to_script.PY\''
    print '\nPress any key to exit...'
    raw_input()
    quit()

while True:
    print '\n'    
    print '[0] Entire image convert'
    print '[1] Section convert'
    print '\n'
    
    choice=raw_input()
    script=['0']*(img.size[0]*img.size[1])
    
    if choice=='0':
        corners=[0,0,img.size[0],img.size[1]]   # x_min, y_min, x_max, y_max
        convert_image()
        break
            
    elif choice=='1':        
        while True:
            try:
                print 'Input pixel corners (x_min,y_min,x_max,y_max) : '
                c_string=raw_input()

                corners=c_string.split(',')
                corners=map(int,corners)
                                         
                # Keeping within image bounds
                corners[0]=max(corners[0],0)
                corners[1]=max(corners[1],0)
                corners[2]=min(corners[2],img.size[0])
                corners[3]=min(corners[3],img.size[1])
                
                break
            
            except:
                print '\nError in input\n\n'
            
        with open('boomeraxe_room.txt','r+') as f:
            prev_data=f.readlines()
                
            if len(prev_data)==img.size[0]*img.size[1]:
                script=prev_data
                              
            convert_image()
            break
    
    else:
        print 'Invalid choice'

raw_input('\nArigato! >.< (Enter to exit)')
