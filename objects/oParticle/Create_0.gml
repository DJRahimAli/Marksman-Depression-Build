image_alpha = 0;

if instance_exists(oPlayer)
{
	image_xscale = oPlayer.image_xscale;
	image_yscale = oPlayer.image_yscale;
	image_speed = oPlayer.image_speed;
	image_index = oPlayer.image_index;
	sprite_index = oPlayer.sprite_index;
}

if instance_exists(oPlayerDead)
{
	image_xscale = oPlayerDead.image_xscale;
	image_yscale = oPlayerDead.image_yscale;
	image_speed = oPlayerDead.image_speed;
	image_index = oPlayerDead.image_index;
	sprite_index = oPlayerDead.sprite_index;
}

if (global.rainbowtrail) image_blend = make_colour_hsv(random(255), 255, 255);
