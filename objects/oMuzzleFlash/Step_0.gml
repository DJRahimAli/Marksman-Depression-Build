x = oWeapon.x;
y = oWeapon.y;

image_angle = oWeapon.image_angle;
image_xscale = oWeapon.image_xscale;
image_yscale = oWeapon.image_yscale;

x += lengthdir_x(oWeapon.muzzleflashlength,image_angle);
y += lengthdir_y(oWeapon.muzzleflashlength,image_angle);

/*if (oWeapon.stopshooting)
{
	image_alpha = 0;
}
