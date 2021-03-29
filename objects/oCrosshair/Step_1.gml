/// @desc Follow player and copy weapon angle
x = oPlayer.x;
y = oPlayer.y+5;

image_angle = oWeapon.image_angle;

if (oWeapon.stopshooting)
{
	image_alpha = 0;
}
else
{
	image_alpha = 1;
}

x = x + lengthdir_x(crosshairdistance,image_angle);
y = y + lengthdir_y(crosshairdistance,image_angle);

if (oWeapon.ironsights)
{
	x = x + lengthdir_x(crosshaircrouchdistance,image_angle);
	y = y + lengthdir_y(crosshaircrouchdistance,image_angle);
}
