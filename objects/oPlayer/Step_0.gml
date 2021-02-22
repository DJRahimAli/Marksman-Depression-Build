//Get Player Input
key_left = keyboard_check(ord("A"));// || keyboard_check(vk_left);
key_right = keyboard_check(ord("D"));// || keyboard_check(vk_right);
key_jump = keyboard_check_pressed(vk_space);
key_debug = keyboard_check_pressed(vk_f1);

//Debug UI Toggle
if (key_debug)
{
	if (debug) debug = 0 else debug = 1;
}

//Calculate Movement
var move = (key_right - key_left) * wlksp;

hsp = lerp(hsp, move, accel);

vsp = vsp + grv;

if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -7;
}

//Horizontal Collision 
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision 
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
hspstr = string_format(hsp, 0, 0);

if (!place_meeting(x,y+1,oWall))
{
	sprite_index = sPlayerA;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hspstr == 0)
	{
		sprite_index = sPlayer;
	}
	else
	{
		sprite_index = sPlayerR;
	}
}

//if (hsp != 0) image_xscale = sign(hsp);
