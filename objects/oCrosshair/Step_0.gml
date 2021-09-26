/// @desc Follow player and copy weapon angle
x = oPlayer.x;
y = oPlayer.y;

direction = oWeapon.image_angle;
	
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

x += lengthdir_x(1,direction);
y += lengthdir_y(1,direction);

//Crosshair Shake
drawnx = x+oWeapon.crosshairxoffset;
drawny = y+oWeapon.crosshairyoffset;

drawnx += lengthdir_x(currentdistance,direction);
drawny += lengthdir_y(currentdistance,direction);

drawnx += random_range(-shake_remain,shake_remain);
drawny += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));
	
if (oWeapon.stopattack) image_alpha = 0; else image_alpha = 1;

//if (oWeapon.ironsights) crosshaircrouchdistance = lerp(crosshaircrouchdistance, crosshaircrouchdistancerate, 0.5); else crosshaircrouchdistance = lerp(crosshaircrouchdistance, 0, 0.5);


//Reload Bar Colour
if (oWeapon.currentreloaddelay > 0)
{
	reloadbarcolour = min(oWeapon.reloaddelay,reloadbarcolour+1);
}
else
{
	reloadbarcolour = 0;
}
