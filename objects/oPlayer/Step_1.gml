//Hit Sound
if (global.hp != lasthp)
{
	if (global.hp < lasthp) audio_play_sound(snd_PlayerHurt,10,false);
	lasthp = global.hp;
}

if (global.hp <= 0)
{
/// @desc Death
with (oWeapon) instance_destroy();
instance_change(oPlayerDead,true);

if (!suicide)
{
	direction = hitfrom;
	hsp = lengthdir_x(random_range(5,6),direction);
	vsp = lengthdir_y(random_range(3,4),direction)-2;
}
else
{
	hsp = -sign(image_xscale)*random_range(5,6);
	vsp = -random_range(3,4);
}
if (sign(hsp) != 0) image_xscale = sign(hsp);

global.kills -= global.killsthisroom;
}
