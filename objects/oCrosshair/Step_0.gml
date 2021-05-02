/// @desc Follow player and copy weapon angle
x = oPlayer.x;
y = oPlayer.y+10;

if (oPlayer.controller == false)
{
	if (oPlayer.hascontrol) && (!oWeapon.holstered)
	{
	direction += angle_difference(oWeapon.mouseangle, direction) * rspeed;
	if (direction > 360) direction -= 360;
	if (direction < 0) direction += 360;
	}
}
else
{
	if (oPlayer.hascontrol) && (!oWeapon.holstered)
	{
	direction += angle_difference(oWeapon.controllerangle, direction) * rspeed;
	if (direction > 360) direction -= 360;
	if (direction < 0) direction += 360;
	}
}

x = x + lengthdir_x(crosshairdistance+crosshaircrouchdistance,direction);
y = y + lengthdir_y(crosshairdistance+crosshaircrouchdistance,direction);

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
