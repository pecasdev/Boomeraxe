ini_open('boomeraxe.ini')

ini_write_real(global.selected_profile,'up',global.k[? 'up'])
ini_write_real(global.selected_profile,'down',global.k[? 'down'])
ini_write_real(global.selected_profile,'left',global.k[? 'left'])
ini_write_real(global.selected_profile,'right',global.k[? 'right'])
ini_write_real(global.selected_profile,'jump',global.k[? 'jump'])
ini_write_real(global.selected_profile,'throw',global.k[? 'throw'])
ini_write_real(global.selected_profile,'dash',global.k[? 'dash'])

ini_close()


ini_open(global.selected_profile+'.boomeraxe.')

ini_write_real('save','up',global.k[? 'up'])
ini_write_real('save','down',global.k[? 'down'])
ini_write_real('save','left',global.k[? 'left'])
ini_write_real('save','right',global.k[? 'right'])
ini_write_real('save','jump',global.k[? 'jump'])
ini_write_real('save','throw',global.k[? 'throw'])
ini_write_real('save','dash',global.k[? 'dash'])

ini_close()
