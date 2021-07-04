/// @desc Follow player and copy weapon angle
x = oPlayer.x+oWeapon.crosshairxoffset;
y = oPlayer.y+oWeapon.crosshairyoffset;

if (oPlayer.onwall == 0)
{
	minmaxangle = 360;
	delta = max(-minmaxangle, min(minmaxangle, angle_difference(oWeapon.pointdir, 0)));
	direction += angle_difference(delta, direction) * currentrspeed;
}
	
if (oPlayer.onwall < 0)
{
	minmaxangle = 60;
	delta = max(-minmaxangle, min(minmaxangle, angle_difference(oWeapon.pointdir, 0)));
	direction += angle_difference(delta, direction) * currentrspeed;
}
	
if (oPlayer.onwall > 0)
{
	minmaxangle = 60;
	delta = max(-minmaxangle, min(minmaxangle, angle_difference(oWeapon.pointdir - 180, 0)));
	direction += angle_difference(delta, direction - 180) * currentrspeed;
}

if (direction > 360) direction -= 360;
if (direction < 0) direction += 360;

if (oWeapon.ironsights)
{
	currentdistance = lerp(currentdistance, oWeapon.crosshairironsightdistance, oWeapon.crosshairironsightspeed);
	currentshakemagnitude = random_range(oWeapon.crosshairironsightshakemagnitudemin,oWeapon.crosshairironsightshakemagnitudemax);
	currentshakelength = random_range(oWeapon.crosshairironsightshakelengthmin,oWeapon.crosshairironsightshakelengthmax);
}
else
{
	currentdistance = lerp(currentdistance, oWeapon.crosshairdistance, oWeapon.crosshairironsightspeed);
	currentshakemagnitude = random_range(oWeapon.crosshairshakemagnitudemin,oWeapon.crosshairshakemagnitudemax);
	currentshakelength = random_range(oWeapon.crosshairshakelengthmin,oWeapon.crosshairshakelengthmax);
}

x += lengthdir_x(currentdistance,direction);
y += lengthdir_y(currentdistance,direction);

//Crosshair Shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));
	
if (oWeapon.stopattack) image_alpha = 0; else image_alpha = 1;

//if (oWeapon.ironsights) crosshaircrouchdistance = lerp(crosshaircrouchdistance, crosshaircrouchdistancerate, 0.5); else crosshaircrouchdistance = lerp(crosshaircrouchdistance, 0, 0.5);
