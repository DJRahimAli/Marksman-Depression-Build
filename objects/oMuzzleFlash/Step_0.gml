x = oWeapon.x;
y = oWeapon.y;

image_angle = oWeapon.image_angle;

image_xscale = currentxscale;
if (image_angle > 90) && (image_angle < 270) image_yscale = -currentyscale; else image_yscale = currentyscale;

if (oWeapon.aimside == -1)
{
	var muzzleflashangleoffset = point_direction(0, 0, currentxoffset, -currentyoffset);
	var muzzleflashdistanceoffset = point_distance(0, 0, currentxoffset, -currentyoffset);
}
if (oWeapon.aimside == 1)
{
	var muzzleflashangleoffset = point_direction(0, 0, currentxoffset, currentyoffset);
	var muzzleflashdistanceoffset = point_distance(0, 0, currentxoffset, currentyoffset);
}

x += lengthdir_x(muzzleflashdistanceoffset,image_angle+muzzleflashangleoffset);
y += lengthdir_y(muzzleflashdistanceoffset,image_angle+muzzleflashangleoffset);

/*if (oWeapon.stopshooting)
{
	image_alpha = 0;
}
