with (other)
{
	hp--;
	flash = 3;
	hitfrom = other.direction;
}

audio_play_sound(snd_Hurt,10,false);

instance_destroy();
