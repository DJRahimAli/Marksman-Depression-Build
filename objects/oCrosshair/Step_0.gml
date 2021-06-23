/// @desc Follow player and copy weapon angle
x = oPlayer.x;
y = oPlayer.y+10;
	
/*if (oWeapon.holstered)
{
	direction += angle_difference(270, direction) * currentrspeed/2;
	if (direction >= 240) && (direction <= 300) direction = 0;
}
else
{*/
	if (oPlayer.onwall == 0)
	{
		minmaxangle = 360;
		delta = max(-minmaxangle, min(minmaxangle, angle_difference(oWeaponNew.pointdir, 0)));
		direction += angle_difference(delta, direction) * currentrspeed;
	}
	
	if (oPlayer.onwall < 0)
	{
		minmaxangle = 60;
		delta = max(-minmaxangle, min(minmaxangle, angle_difference(oWeaponNew.pointdir, 0)));
		direction += angle_difference(delta, direction) * currentrspeed;
	}
	
	if (oPlayer.onwall > 0)
	{
		minmaxangle = 60;
		delta = max(-minmaxangle, min(minmaxangle, angle_difference(oWeaponNew.pointdir - 180, 0)));
		direction += angle_difference(delta, direction - 180) * currentrspeed;
	}
//}
	
if (direction > 360) direction -= 360;
if (direction < 0) direction += 360;
	
if (oWeaponNew.ironsights)
{
	currentdistance = lerp(currentdistance, oWeaponNew.crosshairironsightdistance, oWeaponNew.crosshairironsightspeed);
	currentshakemagnitude = oWeaponNew.crosshairironsightshakemagnitude;
	currentshakelength = oWeaponNew.crosshairironsightshakelength;
}
else
{
	//currentdistance = lerp(currentdistance, oWeaponNew.crosshairdistance, oWeaponNew.crosshairironsightspeed);
	currentdistance = oWeaponNew.crosshairdistance;
	currentshakemagnitude = oWeaponNew.crosshairshakemagnitude;
	currentshakelength = oWeaponNew.crosshairshakelength;
}

x += lengthdir_x(currentdistance,direction);
y += lengthdir_y(currentdistance,direction);

//Crosshair Shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));
	
if (oWeaponNew.stopattack) image_alpha = 0; else image_alpha = 1;

//if (oWeapon.ironsights) crosshaircrouchdistance = lerp(crosshaircrouchdistance, crosshaircrouchdistancerate, 0.5); else crosshaircrouchdistance = lerp(crosshaircrouchdistance, 0, 0.5);
