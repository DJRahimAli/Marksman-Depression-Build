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
		hsp = lengthdir_x(random_range(2,3),direction);
		vsp = lengthdir_y(random_range(2,3),direction)-2;
		var onepixel = sign(hsp);
		if (onepixel != 0) image_xscale = onepixel*other.size;
		image_yscale = other.size;
	}
	
	with (mygun) instance_destroy();
	if (instance_exists(oPlayer))
	{
		global.kills++;
		global.killsthisroom++;
		with (oGame) killtextscale = 2;
	}
	instance_destroy();
}
