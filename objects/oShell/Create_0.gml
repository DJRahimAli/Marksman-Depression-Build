if (oWeapon.image_angle > 240) && (oWeapon.image_angle < 300)
{
	hsp = -random_range(-1,-2) * oPlayer.facingx;
	vsp = random_range(-4,-5) * oPlayer.facingy;
}
else
{
	hsp = random_range(-3,-4) * oPlayer.facingx;
	vsp = random_range(4,5) * oPlayer.facingy;
}
grv = 0.3;
done = 0;
shelllife = 200;
shellalphalength = 40; 
