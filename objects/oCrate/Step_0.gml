/// @desc ?
with (mywall)
{
	x = other.x;
	y = other.y;
}

//Hit Sound
if (hp != lasthp)
{
	if (hp < lasthp) audio_play_sound(snd_Hurt,10,false);
	lasthp = hp;
}
