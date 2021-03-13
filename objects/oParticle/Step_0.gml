//Create Particles
if !(oPlayer.sprite_index = sPlayer || oPlayer.sprite_index = sPlayerC)
{
	part_particles_create(particleSystem,oPlayer.x,oPlayer.y,particleType_Player_Fade,1);
}

#region //Animated Trail Particle
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
#endregion

#endregion
