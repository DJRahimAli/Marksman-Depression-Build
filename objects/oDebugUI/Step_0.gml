//Get Player Input
global.key_debug = keyboard_check_pressed(vk_f1);
global.key_debugfps = keyboard_check_pressed(vk_f2);
global.key_cheat = keyboard_check_pressed(vk_f3);

//Cheat Keys
global.key_fly = keyboard_check_pressed(ord("V"));
global.key_noclip = keyboard_check_pressed(ord("N"));
global.key_god = keyboard_check_pressed(ord("G"));
global.key_camclamp = keyboard_check_pressed(vk_f4);

if instance_exists(oPlayer)
{
	if (global.key_fly) || (global.key_noclip) || (global.key_god) oPlayer.controller = false;

	if (gamepad_button_check_pressed(0,gp_padu))
	{
		global.key_fly = true;
		oPlayer.controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_padd))
	{
		global.key_noclip = true;
		oPlayer.controller = true;
	}
}

//Debug UI Toggle
if (global.key_debug) global.debug = !global.debug;

//FPS UI Toggle
if (global.key_debugfps) global.debugfps = !global.debugfps;

//Cheat Toggle
if (global.key_cheat) global.cheat = !global.cheat;

#region Cheat Toggles
if (global.key_fly) && (global.cheat) global.fly = !global.fly;

if (global.key_noclip) && (global.cheat) global.noclip = !global.noclip;

if (global.key_god) && (global.cheat) global.god = !global.god;

if (global.key_camclamp) && (global.cheat) oCamera.camclamp = !oCamera.camclamp;

#endregion

//Disable Cheats
if (!global.cheat)
{
	global.fly = false;
	global.noclip = false;
	global.god = false;
	oCamera.camclamp = true;
}

//Set Visibility
/*if (global.debug)
{
	visible = true;
}
else
{
	visible = false;
}*/
