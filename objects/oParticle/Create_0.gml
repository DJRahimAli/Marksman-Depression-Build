particletype = 0;

enum particletypes
{
	player,
	playerdead,
	weapon,
	arm
}

particlelife = 10;
particlealphalength = 40;

if (global.rainbowtrail) image_blend = make_colour_hsv(oGame.rainbowhue, 255, 255);
