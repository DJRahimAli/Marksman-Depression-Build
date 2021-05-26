x = oDPad.x;
y = oDPad.y;

if (mouse_check_button(mb_left)) && (position_meeting(mouse_x, mouse_y, id))
{
	if (global.controller == 2) global.key_right_held = true;
	global.controller = 2;
	image_index = 1;
}
else
{
	if (global.controller == 2) global.key_right_held = false;
	image_index = 0;
}
