/// @desc Progress Text
letters += spd;
text_current = string_copy(text,1,floor(letters));

draw_set_font(fSign)
if (h == 0) h = string_height(text);
w = string_width(text_current);

//Destroy when done
if(instance_exists(oPlayer))
{
	if (letters >= length) && (global.key_interact_pressed) || (oPlayer.moving)
	{
		instance_destroy();
		with (oCamera) follow = oPlayer;
		global.hascontrol = true;
	}
}
else
{
	instance_destroy();
	with (oCamera) follow = oPlayerDead;
	global.hascontrol = true;
}
