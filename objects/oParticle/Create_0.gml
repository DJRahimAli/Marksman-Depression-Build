if instance_exists(oPlayer)
{
	image_xscale = oPlayer.image_xscale;
	image_yscale = oPlayer.image_yscale;
	image_speed = oPlayer.image_speed;
	sprite_index = oPlayer.sprite_index;
}

if instance_exists(oPlayerDead)
{
	image_xscale = oPlayerDead.image_xscale;
	image_yscale = oPlayerDead.image_yscale;
	image_speed = oPlayerDead.image_speed;
	sprite_index = oPlayerDead.sprite_index;
}

image_alpha = 0;

if (global.rainbowtrail) image_blend = make_colour_hsv(random(255), 255, 255);
