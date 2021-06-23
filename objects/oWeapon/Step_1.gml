if keyboard_check_pressed(ord("G"))
{
	currentweapon -= 1;
	if (currentweapon < 0) currentweapon = array_length(weapons)-1;
	SetWeapon(currentweapon);
}

if keyboard_check_pressed(ord("H"))
{
	currentweapon += 1;
	if (currentweapon >= array_length(weapons)) currentweapon = 0;
	SetWeapon(currentweapon);
}
