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

if (oWeapon.ironsights)
{
	x = x + lengthdir_x(5,image_angle);
	y = y + lengthdir_y(5,image_angle);
}
