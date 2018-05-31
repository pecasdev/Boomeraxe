ini_open('boomeraxe.ini')
if binding_select=0
{
    ini_write_real(global.selected_profile,'up',global.k[? 'up'])
}

if binding_select=1
{
    ini_write_real(global.selected_profile,'down',global.k[? 'down'])
}

if binding_select=2
{
    ini_write_real(global.selected_profile,'left',global.k[? 'left'])
}

if binding_select=3
{
    ini_write_real(global.selected_profile,'right',global.k[? 'right'])
}

if binding_select=4
{
    ini_write_real(global.selected_profile,'jump',global.k[? 'jump'])
}

if binding_select=5
{
    ini_write_real(global.selected_profile,'throw',global.k[? 'throw'])
}

if binding_select=6
{
    ini_write_real(global.selected_profile,'dash',global.k[? 'dash'])
}
ini_close()


ini_open(global.selected_profile+'.boomeraxe.')
if binding_select=0
{
    ini_write_real(global.selected_profile,'up',global.k[? 'up'])
}

if binding_select=1
{
    ini_write_real(global.selected_profile,'down',global.k[? 'down'])
}

if binding_select=2
{
    ini_write_real(global.selected_profile,'left',global.k[? 'left'])
}

if binding_select=3
{
    ini_write_real(global.selected_profile,'right',global.k[? 'right'])
}

if binding_select=4
{
    ini_write_real(global.selected_profile,'jump',global.k[? 'jump'])
}

if binding_select=5
{
    ini_write_real(global.selected_profile,'throw',global.k[? 'throw'])
}

if binding_select=6
{
    ini_write_real(global.selected_profile,'dash',global.k[? 'dash'])
}
ini_close()
