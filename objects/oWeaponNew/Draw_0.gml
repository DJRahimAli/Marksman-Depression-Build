var wp_map = weapons[weapon];
if (wp_map[? "sprite"] != -1)
{
	draw_sprite_ext(
	wp_map[? "sprite"],
	image_index,
	x-lengthdir_x(currentrecoil,direction),
	y-lengthdir_y(currentrecoil,direction),
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
	);
}