//Hit Sound
if (global.hp != lasthp)
{
	if (global.hp < lasthp) audio_play_sound(snd_Hurt,10,false);
	lasthp = global.hp;
}

if (global.hp <= 0)
{
/// @desc Death
with (oWeapon) instance_destroy();
with (oCrosshair) instance_destroy();
instance_change(oPlayerDead,true);

if (!suicide)
{
	direction = hitfrom;
	hsp = lengthdir_x(6,direction);
	vsp = lengthdir_y(4,direction)-2;
}
else
{
	hsp = -sign(image_xscale)*6;
	vsp = -2;
}
if (sign(hsp) != 0) image_xscale = sign(hsp);

global.kills -= global.killsthisroom;
}
