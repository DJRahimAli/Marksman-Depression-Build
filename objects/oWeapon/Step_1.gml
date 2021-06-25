//Next Weapon
if mouse_wheel_down()
{
	image_speed = 0;
	image_index = 0;
	currentweapon += 1;
	if (currentweapon >= array_length(weapons)) currentweapon = 0;
	SetWeapon(currentweapon);
}

//Previous Weapon
if mouse_wheel_up()
{
	image_speed = 0;
	image_index = 0;
	if (muzzleflash) with (oMuzzleflash)
	{
		image_alpha = 0;
		image_speed = 0;
		image_index = 0;
	}
	currentweapon -= 1;
	if (currentweapon < 0) currentweapon = array_length(weapons)-1;
	SetWeapon(currentweapon);
}
