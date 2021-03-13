//Detect operating system
switch (os_type)
{
   case os_windows: global.os = 0; break;
   case os_linux: global.os = 1; break;
   case os_macosx: global.os = 2; break;
   case os_android: global.os = 3; break;
   case os_ios: global.os = 4; break;
   case os_ps3: global.os = 5; break;
   case os_ps4: global.os = 6; break;
   case os_psvita: global.os = 7; break;
   case os_xboxone: global.os = 8; break;
   case os_uwp: global.os = 9; break;
   case os_unknown: global.os = 10; break;
}

//Get Player Input
key_debug = keyboard_check_pressed(vk_f1);
key_cheat = keyboard_check_pressed(vk_f2);

//Cheat Keys
key_fly = keyboard_check_pressed(ord("V"));
key_camclamp = keyboard_check_pressed(vk_f3);

if (key_fly)
{
	oPlayer.controller = false;
}

if (gamepad_button_check_pressed(0,gp_padu))
{
	key_fly = true;
	oPlayer.controller = true;
}

//Debug UI Toggle
if (key_debug)
{
	if (global.debug)
	{
		global.debug = false;
	}
	else
	{
		global.debug = true;
	}
}

//Cheat Toggle
if (key_cheat)
{
	if (global.cheat)
	{
		global.cheat = false;
	}
	else
	{
		global.cheat = true;
	}
}

//Cheat Toggles
if (key_fly)
{
	if (global.fly) || (!global.cheat)
	{
		global.fly = false;
	}
	else
	{
		global.fly = true;
	}
}

if (key_camclamp)
{
	if (oCamera.camclamp) || (!global.cheat)
	{
		oCamera.camclamp = false;
	}
	else
	{
		oCamera.camclamp = true;
	}
}

//Disable Cheats
if (!global.cheat)
{
	global.fly = false;
	oCamera.camclamp = true;
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
