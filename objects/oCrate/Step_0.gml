vsp += grv;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall) || place_meeting(x,y+vsp,oCrate) || place_meeting(x,y+vsp,oPlayer))
{
	var onepixel = sign(vsp);
	while !(place_meeting(x,y+onepixel,oWall) || place_meeting(x,y+onepixel,oCrate) || place_meeting(x,y+onepixel,oPlayer)) y += onepixel;
	vsp = 0;
}
y += vsp;

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
