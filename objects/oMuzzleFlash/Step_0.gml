x = oWeapon.x;
y = oWeapon.y;

if (oWeapon.aimside == -1)
{
	var muzzleflashangleoffset = point_direction(0, 0, oWeapon.muzzleflashxoffset, -oWeapon.muzzleflashyoffset);
	var muzzleflashdistanceoffset = point_distance(0, 0, oWeapon.muzzleflashxoffset, -oWeapon.muzzleflashyoffset);
}
if (oWeapon.aimside == 1)
{
	var muzzleflashangleoffset = point_direction(0, 0, oWeapon.muzzleflashxoffset, oWeapon.muzzleflashyoffset);
	var muzzleflashdistanceoffset = point_distance(0, 0, oWeapon.muzzleflashxoffset, oWeapon.muzzleflashyoffset);
}
x += lengthdir_x(muzzleflashdistanceoffset,image_angle+muzzleflashangleoffset);
y += lengthdir_y(muzzleflashdistanceoffset,image_angle+muzzleflashangleoffset);

image_angle = oWeapon.image_angle;
image_xscale = oWeapon.image_xscale;
image_yscale = oWeapon.image_yscale;

/*if (oWeapon.stopshooting)
{
	image_alpha = 0;
}
