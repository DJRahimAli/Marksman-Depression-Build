if instance_exists(oPlayer) && (particletype == particletypes.player) && (oPlayer.sprite_index != -1)
{
	draw_sprite_ext(
	oPlayer.sprite_index,
	oPlayer.image_index,
	x,
	y,
	oPlayer.image_xscale,
	oPlayer.image_yscale,
	image_angle,
	image_blend,
	image_alpha
	);
}
	
if instance_exists(oPlayerDead) && (particletype == particletypes.playerdead) && (oPlayerDead.sprite_index != -1)
{
	draw_sprite_ext(
	oPlayerDead.sprite_index,
	oPlayerDead.image_index,
	x,
	y,
	oPlayerDead.image_xscale,
	oPlayerDead.image_yscale,
	image_angle,
	image_blend,
	image_alpha
	);
}
	
if instance_exists(oWeapon) && (particletype == particletypes.weapon) && (oWeapon.sprite_index != -1)
{
	draw_sprite_ext(
	oWeapon.sprite_index,
	oWeapon.image_index,
	x,
	y,
	oWeapon.image_xscale,
	oWeapon.image_yscale,
	image_angle,
	image_blend,
	image_alpha
	);
}
	
if instance_exists(oArm) && (particletype == particletypes.arm) && (oArm.sprite_index != -1)
{
	draw_sprite_ext(
	oArm.sprite_index,
	oArm.image_index,
	x,
	y,
	oArm.image_xscale,
	oArm.image_yscale,
	image_angle,
	image_blend,
	image_alpha
	);
}

if instance_exists(oPlayer)
{
	if (oPlayer.flash > 0)
	{
		shader_set(shWhite);
		draw_self();
		shader_reset();
	}
}
