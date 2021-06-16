x = oWeaponNew.x;
y = oWeaponNew.y;

image_angle = oWeaponNew.image_angle;
image_xscale = oWeaponNew.image_xscale;
image_yscale = oWeaponNew.image_yscale;

x += lengthdir_x(25,image_angle);
y += lengthdir_y(25,image_angle);

/*if (oWeaponNew.stopshooting)
{
	image_alpha = 0;
}
