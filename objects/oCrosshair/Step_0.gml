/// @desc Follow player and copy weapon angle
x = oPlayer.x;//+oWeapon.crosshairxoffset;
y = oPlayer.y;//+oWeapon.crosshairyoffset;

if (oPlayer.wallsliding == 0) && (oWeapon.aimsidetype != aimsidetypes.movedirection)
{
	currentminmaxangle = 360;
	delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(oWeapon.pointdir, 0)));
	direction += angle_difference(delta, direction) * currentrspeed;
}

if (oWeapon.aimsidetype == aimsidetypes.movedirection) && (oPlayer.wallsliding == 0)
{
	currentminmaxangle = oWeapon.hspminmaxangle;
	if (oPlayer.aimside == 1)
	{
		delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(oWeapon.pointdir, 0)));
		direction += angle_difference(delta, direction) * currentrspeed;
	}
	if (oPlayer.aimside == -1)
	{
		delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(oWeapon.pointdir - 180, 0)));
		direction += angle_difference(delta, direction - 180) * currentrspeed;
	}
}

if (oPlayer.wallsliding != 0)
{
	currentminmaxangle = oWeapon.wallminmaxangle;
	if (oPlayer.onwall < 0)
	{
		delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(oWeapon.pointdir, 0)));
		direction += angle_difference(delta, direction) * currentrspeed;
	}
	if (oPlayer.onwall > 0)
	{
		delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(oWeapon.pointdir - 180, 0)));
		direction += angle_difference(delta, direction - 180) * currentrspeed;
	}
}
	
if (direction > 360) direction -= 360;
if (direction < 0) direction += 360;

if (oWeapon.ironsights)
{
	currentdistance = lerp(currentdistance, oWeapon.crosshairironsightdistance, oWeapon.crosshairironsightspeed);
}
else
{
	currentdistance = lerp(currentdistance, oWeapon.crosshairdistance, oWeapon.crosshairironsightspeed);
}

x += lengthdir_x(currentdistance,direction);
y += lengthdir_y(currentdistance,direction);

//Crosshair Shake
drawnx = x;
drawny = y;

drawnx += random_range(-shake_remain,shake_remain);
drawny += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));
	
if (oWeapon.stopattack) image_alpha = 0; else image_alpha = 1;

//if (oWeapon.ironsights) crosshaircrouchdistance = lerp(crosshaircrouchdistance, crosshaircrouchdistancerate, 0.5); else crosshaircrouchdistance = lerp(crosshaircrouchdistance, 0, 0.5);
