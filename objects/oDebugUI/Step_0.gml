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
