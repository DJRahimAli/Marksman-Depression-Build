/// @desc Control Menu

//Item ease in
if (menu_x > menu_x_target) || (menu_commited != -1)
{
	menu_x += (menu_x_target - menu_x) / menu_speed;
}
else
{
	menu_x = gui_width - gui_margin;
}

//Keyboard Controls
if (menu_control)
{
	if (keyboard_check_pressed(vk_up))
	{
		menu_cursor++;
		if (menu_cursor >= menu_items) menu_cursor = 0;
	}
	
	if (keyboard_check_pressed(vk_down))
	{
		menu_cursor--;
		if (menu_cursor < 0) menu_cursor = menu_items-1;
	}
	
	if (keyboard_check_pressed(vk_enter))
	{
		menu_x_target = gui_width+200;
		menu_commited = menu_cursor;
		ScreenShake(4,30);
		menu_control = false;
		oWindowFrame.stopwindowresize = true;
	}
}

if (menu_x > gui_width+150) && (menu_commited != -1)
{
	switch (menu_commited)
	{
		case 3: default: SlideTransition(TRANS_MODE.NEXT); break;
		case 1: SlideTransition(TRANS_MODE.RESTART); break;
		case 0: SlideTransition(TRANS_MODE.QUIT); break;
	}
}
