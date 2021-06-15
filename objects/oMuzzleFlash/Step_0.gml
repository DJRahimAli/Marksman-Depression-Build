x = oWeaponNew.x;
y = oWeaponNew.y;

direction = oWeaponNew.direction;
image_angle = direction;
image_xscale = oWeaponNew.image_xscale;
image_yscale = oWeaponNew.image_yscale;

x += lengthdir_x(25,direction);
y += lengthdir_y(25,direction);

/*if (oWeaponNew.stopshooting)
{
	image_alpha = 0;
}
