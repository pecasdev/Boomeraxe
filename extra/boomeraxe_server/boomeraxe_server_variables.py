# INI READING
ini=configparser.ConfigParser()
ini.read('boomeraxe.ini')
profile_count=int(float(ini_read('meta','profile_count')))

# SOCKET CREATE
s=socket.socket(socket.AF_INET,socket.SOCK_DGRAM)
s.setsockopt(socket.SOL_SOCKET,socket.SO_REUSEADDR,1)

# SOCKET CONNECT
udp_ip='192.168.0.200'   # WIFI
udp_port=9000
s.bind((udp_ip,udp_port))
