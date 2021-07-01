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

if (particlelife == 0) || (image_alpha < 0) instance_destroy();

particlelife--;
image_alpha = particlelife/particlealphalength;
