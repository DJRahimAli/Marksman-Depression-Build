/// @desc Control Menu

//Item ease in
menu_x += (menu_x_target - menu_x) / menu_speed;

//Keyboard Controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up)) || (gamepad_button_check_pressed(0,gp_padu))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down)) || (gamepad_button_check_pressed(0,gp_padd))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}
	
	if (keyboard_check_pressed(vk_enter)) || (gamepad_button_check_pressed(0,gp_face1))
	{
		menu_x_target = gui_width+200;
		menu_commited = menu_cursor;
		ScreenShake(4,30);
		menu_control = false;
	}
}

if (menu_x > gui_width+150) && (menu_commited != -1)
{
	switch (menu_commited)
	{
		case 3: SlideTransition(TRANS_MODE.NEXT); break;
		case 2:
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
		case 1: SlideTransition(TRANS_MODE.RESTART); break;
		case 0: SlideTransition(TRANS_MODE.QUIT); break;
	}
}
