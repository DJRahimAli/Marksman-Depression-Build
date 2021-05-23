//test = 0;
global.hascontrol = true;

if (!file_exists(SAVEFILE)) SaveGame();

var file = file_text_open_read(SAVEFILE);
var ignore = file_text_read_real(file);
var ignore2 = file_text_read_real(file);
if (global.levelchanging == false)
{
	global.hasweapon = file_text_read_real(file);
	x = file_text_read_real(file);
	y = file_text_read_real(file);
}
file_text_close(file);
