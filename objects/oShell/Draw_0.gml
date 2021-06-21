if (oWeaponNew.shellsprite != -1)
{
	draw_sprite_ext(
	oWeaponNew.shellsprite,
	image_index,
	x,
	y,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
	);
}

//draw_sprite_ext(sprite_index, image_index, x, y, image_xscale, image_yscale, my_angle, image_blend, image_alpha);
draw_set_color(c_red);
//draw_rectangle(bbox_left,bbox_top,bbox_right,bbox_bottom,false);
