/// @desc Follow player and copy weapon angle
x = oPlayer.x;
y = oPlayer.y+5*oPlayer.size/1;

if (oPlayer.controller == false)
{
	if (oPlayer.hascontrol) && instance_exists(oWeapon) image_angle = point_direction(x,y,mouse_x,mouse_y);
}
else
{
	if (oPlayer.hascontrol) && instance_exists(oWeapon) image_angle = oWeapon.controllerangle;
}

x = x + lengthdir_x(crosshairdistance*oPlayer.size/1,image_angle);
y = y + lengthdir_y(crosshairdistance*oPlayer.size/1,image_angle);

if instance_exists(oWeapon)
{
	if (oWeapon.stopshooting)
	{
		image_alpha = 0;
	}
	else
	{
		image_alpha = 1;
	}

	if (oWeapon.ironsights)
	{
		x = x + lengthdir_x(crosshaircrouchdistance*oPlayer.size/1,image_angle);
		y = y + lengthdir_y(crosshaircrouchdistance*oPlayer.size/1,image_angle);
	}
}
else
{
	image_alpha = 0;
}
