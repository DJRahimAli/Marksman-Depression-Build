//Create Particles
if instance_exists(oPlayer)
{
	if !oPlayer.sprite_index = sPlayer || oPlayer.sprite_index = sPlayerC
	{
		part_particles_create(particleSystem,oPlayer.x,oPlayer.y,particleType_Player_Fade,1);
	}
}

if instance_exists(oPlayerDead)
{
	if oPlayerDead.sprite_index = sPlayerD && oPlayerDead.image_index = 0
	{
		part_particles_create(particleSystem,oPlayerDead.x,oPlayerDead.y,particleType_Player_Fade,1);
	}
}

#region //Animated Trail Particle
if instance_exists(oPlayer)
{
	if oPlayer.sprite_index = sPlayer && oPlayer.image_index = 0
	{
		part_type_sprite(particleType_Player_Fade,sPlayer,0,0,0);
	}

	if oPlayer.sprite_index = sPlayerA && oPlayer.image_index = 0
	{
		part_type_sprite(particleType_Player_Fade,sPlayerA,0,0,0);
	}

	if oPlayer.sprite_index = sPlayerA && oPlayer.image_index = 1
	{
		part_type_sprite(particleType_Player_Fade,sPlayerTrailA,0,0,0);
	}

	if oPlayer.sprite_index = sPlayerR && oPlayer.image_index = 0
	{
		part_type_sprite(particleType_Player_Fade,sPlayerR,0,0,0);
	}

	if oPlayer.sprite_index = sPlayerR && oPlayer.image_index = 1
	{
		part_type_sprite(particleType_Player_Fade,sPlayerTrailR,0,0,0);
	}
#region //Crouching
	if oPlayer.sprite_index = sPlayerC && oPlayer.image_index = 0
	{
		part_type_sprite(particleType_Player_Fade,sPlayerC,0,0,0);
	}

	if oPlayer.sprite_index = sPlayerAC && oPlayer.image_index = 0
	{
		part_type_sprite(particleType_Player_Fade,sPlayerAC,0,0,0);
	}

	if oPlayer.sprite_index = sPlayerAC && oPlayer.image_index = 1
	{
		part_type_sprite(particleType_Player_Fade,sPlayerTrailAC,0,0,0);
	}

	if oPlayer.sprite_index = sPlayerRC && oPlayer.image_index = 0
	{
		part_type_sprite(particleType_Player_Fade,sPlayerRC,0,0,0);
	}

	if oPlayer.sprite_index = sPlayerRC && oPlayer.image_index = 1
	{
		part_type_sprite(particleType_Player_Fade,sPlayerTrailRC,0,0,0);
	}
}
#endregion

#region //Dead
if instance_exists(oPlayerDead)
{
	if oPlayerDead.sprite_index = sPlayerD && oPlayerDead.image_index = 0
	{
		part_type_sprite(particleType_Player_Fade,sPlayerD,0,0,0);
		with (oPlayerDead) part_type_scale(oParticle.particleType_Player_Fade,sign(hsp),oPlayerDead.size);
	}
}
#endregion

#endregion
