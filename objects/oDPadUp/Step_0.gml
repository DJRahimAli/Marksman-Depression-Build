x = oDPad.x;
y = oDPad.y;

if (mouse_check_button(mb_left)) && (position_meeting(mouse_x, mouse_y, id))
{
	global.key_up_held = true;
	image_index = 1;
}
else
{
	image_index = 0;
}
