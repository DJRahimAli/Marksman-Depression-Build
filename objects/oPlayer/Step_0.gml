//Get Player Input
key_left = keyboard_check(ord("A"));// || keyboard_check(vk_left);
key_right = keyboard_check(ord("D"));// || keyboard_check(vk_right);
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"));
key_jump = keyboard_check_pressed(vk_space);
key_crouch = keyboard_check(vk_control);
key_holster = keyboard_check_pressed(ord("H"));
key_gun = keyboard_check_pressed(ord("2"));
key_flyup = key_up || keyboard_check(vk_space);
key_flydown = key_down || key_crouch;

//Stupid Ass Holstering (Gross!) (Disgiusting!) (This will get fucking changed bro!)
if (key_holster) && instance_number(oGun) = 1
{
	instance_destroy(oGun);
}

if (key_gun) && instance_number(oGun) = 0
{
	instance_create_layer(x,y,"Gun",oGun);
}

//Calculate Movement
var move = (key_right - key_left) * wlksp;

hsp = lerp(hsp, move, accel);

if (global.fly)
{
var movefly = (key_flydown - key_flyup) * wlksp;

vsp = lerp(vsp, movefly, accel);
}
else
{
vsp = vsp + grv;

if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -7;
}

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
part_particles_create(oManager.particleSystem,x,y,oManager.particleType_Player_Fade,1)

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

if (hsp != 0) && !instance_exists(oGun)
{
	image_xscale = sign(hsp);
	part_type_scale(oManager.particleType_Player_Fade,sign(hsp),1)
}
