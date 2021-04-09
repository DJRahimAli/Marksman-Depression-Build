//Get Player Input
key_debug = keyboard_check_pressed(vk_f1);
key_cheat = keyboard_check_pressed(vk_f2);

//Cheat Keys
key_fly = keyboard_check_pressed(ord("V"));
key_noclip = keyboard_check_pressed(ord("N"));
key_god = keyboard_check_pressed(ord("G"));
key_camclamp = keyboard_check_pressed(vk_f3);

if instance_exists(oPlayer)
{
	if (key_fly) || (key_noclip) || (key_god) oPlayer.controller = false;

	if (gamepad_button_check_pressed(0,gp_padu))
	{
		key_fly = true;
		oPlayer.controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_padd))
	{
		key_noclip = true;
		oPlayer.controller = true;
	}
}

//Debug UI Toggle
if (key_debug) global.debug = !global.debug;

//Cheat Toggle
if (key_cheat) global.cheat = !global.cheat;

#region //Cheat Toggles
if instance_exists(oPlayer)
{
	if (key_fly) && (global.cheat) global.fly = !global.fly;

	if (key_noclip) && (global.cheat) global.noclip = !global.noclip;
		
	if (key_god) && (global.cheat) global.god = !global.god;
}

if (key_camclamp) && (global.cheat) oCamera.camclamp = !oCamera.camclamp;

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
