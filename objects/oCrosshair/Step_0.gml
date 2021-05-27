/// @desc Follow player and copy weapon angle
x = oPlayer.x;
y = oPlayer.y+10;

if (direction > 360) direction -= 360;
if (direction < 0) direction += 360;

if (oWeapon.holstered)
{
	direction += angle_difference(270, direction) * rspeed/2;
	if (direction >= 240) && (direction <= 300) image_alpha = 0;
}
else
{
	if (global.controller == 0)
	{
		if (global.hascontrol) direction += angle_difference(oWeapon.mouseangle, direction) * rspeed;
	}
	
	if (global.controller == 1)
	{
		if (global.hascontrol) direction += angle_difference(oWeapon.controllerangle, direction) * rspeed;
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
