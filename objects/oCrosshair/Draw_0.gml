if (oWeapon.crosshairsprite != -1) && (oWeapon.stopattack <= 1)
{
	draw_sprite_ext(
	oWeapon.crosshairsprite,
	image_index,
	drawnx,
	drawny,
	image_xscale,
	image_yscale,
	image_angle,
	image_blend,
	image_alpha
	);
}

draw_circular_bar(drawnx, drawny, oWeapon.currentreloaddelay, oWeapon.reloaddelay, MakeColorHSVTransition(reloadbarcolour, oWeapon.reloaddelay, 0, 100, 255, 255, 255, 255), 14, 1, 4);
