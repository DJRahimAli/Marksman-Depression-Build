/// @desc Follow player and copy weapon angle
x = oPlayer.x;
y = oPlayer.y+5;

image_angle = oWeapon.image_angle;
image_alpha = oWeapon.image_alpha;

if (oWeapon.ironsights)
{
	x = x + lengthdir_x(5,image_angle);
	y = y + lengthdir_y(5,image_angle);
}
