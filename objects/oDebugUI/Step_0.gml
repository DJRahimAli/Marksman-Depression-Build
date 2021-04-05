//Get Player Input
key_debug = keyboard_check_pressed(vk_f1);
key_cheat = keyboard_check_pressed(vk_f2);

//Cheat Keys
key_fly = keyboard_check_pressed(ord("V"));
key_camclamp = keyboard_check_pressed(vk_f3);

if instance_exists(oPlayer)
{
	if (key_fly)
	{
		oPlayer.controller = false;
	}

	if (gamepad_button_check_pressed(0,gp_padu))
	{
		key_fly = true;
		oPlayer.controller = true;
	}
}

//Debug UI Toggle
if (key_debug)
{
	global.debug = !global.debug;
}

//Cheat Toggle
if (key_cheat)
{
	global.cheat = !global.cheat;
}

//Cheat Toggles
if instance_exists(oPlayer)
{
	if (key_fly) && (global.cheat)
	{
		global.fly = !global.fly;
	}
}

if (key_camclamp) && (global.cheat)
{
	oCamera.camclamp = !oCamera.camclamp;
}

//Disable Cheats
if (!global.cheat)
{
	global.fly = false;
	oCamera.camclamp = true;
}
