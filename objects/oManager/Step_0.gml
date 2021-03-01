key_debug = keyboard_check_pressed(vk_f1);
key_cheat = keyboard_check_pressed(vk_f2);
key_fly = keyboard_check_pressed(ord("V"));

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

//Update NekoPresence so async events will execute.
np_update();
