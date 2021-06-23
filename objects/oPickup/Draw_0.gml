switch (pickuptype)
{
	case 1: sprite = ds_map_find_value(oWeapon.weapons[weapon],"sprite"); break;
}

if (sprite != -1)
{
	draw_sprite_ext(
	sprite,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	my_angle,
	image_blend,
	image_alpha
	);
}

draw_set_color(c_red);
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
