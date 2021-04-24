//test = 0;

if (!file_exists(SAVEFILE)) SaveGame();

var file = file_text_open_read(SAVEFILE);
var ignore = file_text_read_real(file);
var ignore2 = file_text_read_real(file);
var ignore3 = file_text_read_real(file);
if (global.levelchanging == false)
{
	x = file_text_read_real(file);
	y = file_text_read_real(file);
}
file_text_close(file);
