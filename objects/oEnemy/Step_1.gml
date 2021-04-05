//Hit Sound
if (hp != lasthp)
{
	if (hp < lasthp) audio_play_sound(snd_Hurt,10,false);
	lasthp = hp;
}

if (hp <= 0)
{
	with(instance_create_layer(x,y,layer,oEnemyDead))
	{
		direction = other.hitfrom;
		hsp = lengthdir_x(3,direction);
		vsp = lengthdir_y(3,direction)-2;
		if (sign(hsp) != 0) image_xscale = sign(hsp)*other.size;
		image_yscale = other.size;
	}
	
	with (mygun) instance_destroy();
	instance_destroy();
}