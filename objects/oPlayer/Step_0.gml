//Get Player Input
key_left = keyboard_check(ord("A"));// || keyboard_check(vk_left);
key_right = keyboard_check(ord("D"));// || keyboard_check(vk_right);
key_up = keyboard_check(ord("W"));
key_down = keyboard_check(ord("S"))
key_jump = keyboard_check_pressed(vk_space);
key_crouch = keyboard_check_pressed(vk_control);
key_crouched = keyboard_check(vk_control);
key_uncrouch = keyboard_check_released(vk_control);

key_flyup = key_up || keyboard_check(vk_space);
key_flydown = key_down

if (key_left) || (key_right) || (key_up) || (key_down) || (key_jump) || (key_flyup) || (key_flydown) || (mouse_check_button(mb_left))
{
	controller = 0;
}

if (abs(gamepad_axis_value(0,gp_axislh)) > deadzone)
{
	key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
	key_right = max(gamepad_axis_value(0,gp_axislh),0);
	controller = 1;
}

if (abs(gamepad_axis_value(0,gp_axislv)) > deadzone)
{
	key_up = abs(min(gamepad_axis_value(0,gp_axislv),0));
	key_down = max(gamepad_axis_value(0,gp_axislv),0);
	key_flyup = key_up;
	key_flydown = key_down;
	controller = 1;
}

if (gamepad_button_check_pressed(0,gp_shoulderl))
{
	key_jump = 1;
	controller = 1;
}

if (gamepad_button_check(0,gp_shoulderl))
{
	key_flyup = 1;
	controller = 1;
}

if (gamepad_button_check(0,gp_shoulderrb))
{
	controller = 1;
}

#region //Stupid Ass Holstering (Gross!) (Disgiusting!) (This will get fucking changed bro!)
key_holster = keyboard_check_pressed(ord("H"));
key_gun = keyboard_check_pressed(ord("2"));
if (key_holster) && instance_number(oWeapon) = 1
{
	instance_destroy(oWeapon);
}
#endregion

if (key_gun) && instance_number(oWeapon) = 0
{
	instance_create_layer(x,y,"Weapon",oWeapon);
}

//Calculate Movement
var move = (key_right - key_left) * walksp;

hsp = lerp(hsp, move, accel);

#region //awful smb1 type movement
/*
if (sign(vsp) = 0) hsp = lerp(hsp, move, accel);
*/
#endregion

#region //Crouching (Unfinished and Buggy!)
if (key_crouch)
{
	if (place_meeting(x,y+1,oWall)) 
	{
		crouch = 1;
		walksp --;
	}
}

if (key_crouched)
{
	if (!crouch) notactuallycrouching = 1;
}

if (key_uncrouch)
{
	if (!notactuallycrouching)
	{
		crouch = 0;
		walksp ++;
	}
}

if (place_meeting(x,y-8,oWall)) && (place_meeting(x,y+1,oWall))
{
	crouch = 1;
	crouchstuck = 1;
}

if (!place_meeting(x,y-16,oWall)) && (place_meeting(x,y+1,oWall))
{
	if (!key_crouched)
	{
		crouch = 0;
	}
	crouchstuck = 0;
}
#endregion

if (global.fly)
{
	var movefly = (key_flydown - key_flyup) * walksp;
	
	vsp = lerp(vsp, movefly, accel);
}
else
{
	vsp = vsp + grv;
	
	if (place_meeting(x,y+1,oWall)) && (key_jump) && (!crouchstuck)
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
hspstr = string_format(hsp, 0, 0);

if (!place_meeting(x,y+1,oWall))
{
	if (!crouch) sprite_index = sPlayerA;
	if (crouch) sprite_index = sPlayerAC;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	image_speed = 1;
	if (hspstr == 0)
	{
		if (!crouch) sprite_index = sPlayer;
		if (crouch) sprite_index = sPlayerC;
	}
	else
	{
		if (!crouch) sprite_index = sPlayerR;
		if (crouch) sprite_index = sPlayerRC;
	}
}

#region //Animated Trail Particle
if sprite_index = sPlayer
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayer,0,0,0);
}

if sprite_index = sPlayerA && image_index = 0
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayerA,0,0,0);
}

if sprite_index = sPlayerA && image_index = 1
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayerTrailA,0,0,0);
}

if sprite_index = sPlayerR && image_index = 0
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayerR,0,0,0);
}

if sprite_index = sPlayerR && image_index = 1
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayer,0,0,0);
}
#endregion

#region //Animated Trail Particle Crouching
if sprite_index = sPlayerC
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayerC,0,0,0);
}

if sprite_index = sPlayerAC && image_index = 0
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayerAC,0,0,0);
}

if sprite_index = sPlayerAC && image_index = 1
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayerTrailAC,0,0,0);
}

if sprite_index = sPlayerRC && image_index = 0
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayerRC,0,0,0);
}

if sprite_index = sPlayerRC && image_index = 1
{
	with (oManager) part_type_sprite(particleType_Player_Fade,sPlayerC,0,0,0);
}
#endregion

if (hsp != 0) && !instance_exists(oWeapon)
{
	image_xscale = sign(hsp);
	with (oManager) part_type_scale(particleType_Player_Fade,sign(hsp),1);
}
