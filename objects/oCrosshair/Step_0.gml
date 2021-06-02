/// @desc Follow player and copy weapon angle
x = oPlayer.x;
y = oPlayer.y+10;

if (direction > 360) direction -= 360;
if (direction < 0) direction += 360;

if (oWeapon.holstered)
{
	direction = direction + angle_difference(270, direction) * rspeed/2;
	if (direction >= 240) && (direction <= 300) direction = 0;
}
else
{
	if (oPlayer.onwall == 0)
	{
		minmaxangle = 360;
	}
	else
	{
		minmaxangle = 60;
	}
	
	if (oPlayer.onwall <= 0)
	{
		delta = max(-minmaxangle, min(minmaxangle, angle_difference(oWeapon.pointdir, 0)));
		direction += angle_difference(delta, direction) * rspeed;
	}
	
	if (oPlayer.onwall > 0)
	{
		delta = max(-minmaxangle, min(minmaxangle, angle_difference(oWeapon.pointdir - 180, 0)));
		direction += angle_difference(delta, direction - 180) * rspeed;
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
