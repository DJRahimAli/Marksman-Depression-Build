/*if (oWeapon.image_angle > 240) && (oWeapon.image_angle < 300)
{
	hsp = -random_range(-1,-2) * other.owner.facingx;
	vsp = random_range(-4,-5) //* other.owner.facingy;
}
else
{
	hsp = random_range(-3,-4) * other.owner.facingx;
	vsp = random_range(4,5) //* other.owner.facingy;
}*/

hsp = 0;
vsp = random_range(-4,-5);

grv = 0.3;
done = 0;
shelllife = 200;
shellalphalength = 40; 
