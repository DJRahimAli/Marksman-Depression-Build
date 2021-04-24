// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function SaveGame(){
	if (room != rMenu) && (room != rEnding) && (global.hp != 0)
	{
		/// @desc Save Game

		//Overwrite old save
		if (file_exists(SAVEFILE)) file_delete(SAVEFILE);

		//Create new save
		var file;
		file = file_text_open_write(SAVEFILE);
		file_text_write_real(file,global.hp);
		file_text_write_real(file,global.kills);
		file_text_write_real(file,global.hasweapon);
		file_text_write_real(file,oPlayer.x);
		file_text_write_real(file,oPlayer.y);
		file_text_write_real(file,room);
		file_text_close(file);
	}
}