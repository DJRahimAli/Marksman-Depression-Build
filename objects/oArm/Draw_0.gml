if (currentsprite != -1)
{
	draw_sprite_ext(
	currentsprite,
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

if (oPlayer.flash > 0)
{
	oPlayer.flash--;
	shader_set(shWhite);
	shader_reset();
}
