/// @desc Auto Save

//Overwrite old save
if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

//Create new save
var file;
file = file_text_open_write(SAVEFILE);
file_text_write_real(file,room);
file_text_write_real(file,global.kills);
file_text_write_real(file,global.hasweapon);
file_text_write_real(file,global.hpthisroom);
file_text_close(file);

if (global.hpthisroom > 0)
{
	hp = global.hpthisroom;
	lasthp = hp;
}
