if (currentsprite != -1) draw_self();

if (oPlayer.flash > 0)
{
	oPlayer.flash--;
	shader_set(shWhite);
	shader_reset();
}

if (currentreloaddelay > 0)
{
	reloadbarcolour = min(reloaddelay,reloadbarcolour+1);
}
else
{
	reloadbarcolour = 0;
}

draw_circular_bar(x ,y ,currentreloaddelay, reloaddelay, MakeColorHSVTransition(reloadbarcolour, reloaddelay, 0, 100, 255, 255, 255, 255), 10, 1, 4);

/*if (currentsprite != -1)
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
