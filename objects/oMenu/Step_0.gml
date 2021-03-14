/// @desc Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Keyboard Controls
if (menu_control)
{
	if (keyboard_check_pressed(ord("W"))) || (gamepad_button_check_pressed(0,gp_padu))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
		audio_play_sound(snd_Landing,10,false);
	}
	
	if (keyboard_check_pressed(ord("S"))) || (gamepad_button_check_pressed(0,gp_padd))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
		audio_play_sound(snd_Landing,10,false);
	}
	
	if (keyboard_check_pressed(ord("E"))) || (gamepad_button_check_pressed(0,gp_face1))
	{
		menu_x_target = gui_width+200;
		menu_commited = menu_cursor;
		ScreenShake(4,30);
		menu_control = false;
		audio_play_sound(snd_PistolFire,10,false);
		audio_sound_pitch(snd_PistolFire,(choose(0.98,1.0,1.02)));
	}
}

if (menu_x > gui_width+150) && (menu_commited != -1)
{
	switch (menu_commited)
	{
		case 2: SlideTransition(TRANS_MODE.NEXT); break;
		case 1:
		{
			if (!file_exists(SAVEFILE))
			{
				SlideTransition(TRANS_MODE.NEXT)
			}
			else
			{
				var file = file_text_open_read(SAVEFILE);
				var target = file_text_read_real(file);
				file_text_close(file);
				SlideTransition(TRANS_MODE.GOTO,target);
			}
		}
		break;
		case 0: SlideTransition(TRANS_MODE.QUIT); break;
	}
}
