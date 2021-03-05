//Get Player Input
key_debug = keyboard_check_pressed(vk_f1);
key_cheat = keyboard_check_pressed(vk_f2);

//Cheat Keys
key_fly = keyboard_check_pressed(ord("V"));
key_camclamp = keyboard_check_pressed(vk_f3);

if (key_fly)
{
	oPlayer.controller = 0;
}

if (gamepad_button_check_pressed(0,gp_padd))
{
	key_fly = 1;
	oPlayer.controller = 1;
}

//Debug UI Toggle
if (key_debug)
{
	if (global.debug) global.debug = 0 else global.debug = 1;
}

//Cheat Toggle
if (key_cheat)
{
	if (global.cheat) global.cheat = 0 else global.cheat = 1;
}

//Cheat Toggles
if (key_fly)
{
	if (global.fly) || (!global.cheat)
	{
		global.fly = 0
	}
	else
	{
		global.fly = 1;
	}
}

if (key_camclamp)
{
	if (oCamera.camclamp) || (!global.cheat)
	{
		oCamera.camclamp = 0;
	}
	else
	{
		oCamera.camclamp = 1;
	}
}

//Disable Cheats
if (!global.cheat)
{
	global.fly = 0;
	oCamera.camclamp = 1;
}

//Create Particles
if !(oPlayer.sprite_index = sPlayer || oPlayer.sprite_index = sPlayerC)
{
	part_particles_create(particleSystem,oPlayer.x,oPlayer.y,particleType_Player_Fade,1);
}

#region //Animated Trail Particle
if oPlayer.sprite_index = sPlayer && oPlayer.image_index = 0
{
	part_type_sprite(particleType_Player_Fade,sPlayer,0,0,0);
}

if oPlayer.sprite_index = sPlayerA && oPlayer.image_index = 0
{
	part_type_sprite(particleType_Player_Fade,sPlayerA,0,0,0);
}

if oPlayer.sprite_index = sPlayerA && oPlayer.image_index = 1
{
	part_type_sprite(particleType_Player_Fade,sPlayerTrailA,0,0,0);
}

if oPlayer.sprite_index = sPlayerR && oPlayer.image_index = 0
{
	part_type_sprite(particleType_Player_Fade,sPlayerR,0,0,0);
}

if oPlayer.sprite_index = sPlayerR && oPlayer.image_index = 1
{
	part_type_sprite(particleType_Player_Fade,sPlayerTrailR,0,0,0);
}

#region //Crouching
if oPlayer.sprite_index = sPlayerC && oPlayer.image_index = 0
{
	part_type_sprite(particleType_Player_Fade,sPlayerC,0,0,0);
}

if oPlayer.sprite_index = sPlayerAC && oPlayer.image_index = 0
{
	part_type_sprite(particleType_Player_Fade,sPlayerAC,0,0,0);
}

if oPlayer.sprite_index = sPlayerAC && oPlayer.image_index = 1
{
	part_type_sprite(particleType_Player_Fade,sPlayerTrailAC,0,0,0);
}

if oPlayer.sprite_index = sPlayerRC && oPlayer.image_index = 0
{
	part_type_sprite(particleType_Player_Fade,sPlayerRC,0,0,0);
}

if oPlayer.sprite_index = sPlayerRC && oPlayer.image_index = 1
{
	part_type_sprite(particleType_Player_Fade,sPlayerTrailRC,0,0,0);
}
#endregion

#endregion
