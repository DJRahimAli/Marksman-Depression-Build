key_debug = keyboard_check_pressed(vk_f1);
key_cheat = keyboard_check_pressed(vk_f2);

key_fly = keyboard_check_pressed(ord("V"));

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

//Disable Cheats
if (!global.cheat)
{
	global.fly = 0
}

//Cheat Toggles
if (key_fly)
{
	if (global.fly) || (!global.cheat) global.fly = 0 else global.fly = 1;
}

//Create Particles
part_particles_create(particleSystem,oPlayer.x,oPlayer.y,particleType_Player_Fade,1)
