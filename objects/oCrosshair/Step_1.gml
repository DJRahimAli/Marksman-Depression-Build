/// @desc Follow player and copy weapon angle
x = oPlayer.x;
y = oPlayer.y+5*oPlayer.size/1;

if (oPlayer.controller == false)
{
	if (oPlayer.hascontrol) && instance_exists(oWeapon)
	{
	direction += angle_difference(oWeapon.mouseangle, direction) * rspeed;
	if (direction > 360) direction -= 360;
	if (direction < 0) direction += 360;
	}
}
else
{
	if (oPlayer.hascontrol) && instance_exists(oWeapon)
	{
	direction += angle_difference(oWeapon.controllerangle, direction) * rspeed;
	if (direction > 360) direction -= 360;
	if (direction < 0) direction += 360;
	}
}

x = x + lengthdir_x((crosshairdistance+crosshaircrouchdistance)*oPlayer.size/1,direction);
y = y + lengthdir_y((crosshairdistance+crosshaircrouchdistance)*oPlayer.size/1,direction);

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
		crosshaircrouchdistance = lerp(crosshaircrouchdistance, crosshaircrouchdistancerate, 0.5);
	}
	else
	{
		crosshaircrouchdistance = lerp(crosshaircrouchdistance, 0, 0.5);
	}
}
else
{
	image_alpha = 0;
}
