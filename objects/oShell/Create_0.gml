if (oWeapon.image_angle > 240) && (oWeapon.image_angle < 300)
{
	hsp = -2 * oPlayer.facingx;
	vsp = -5 * oPlayer.facingy;
}
else
{
	hsp = -4 * oPlayer.facingx;
	vsp = 5 * oPlayer.facingy;
}
grv = 0.3;
done = 0;
shelllife = 200;
shellalphalength = 40; 
