vsp = vsp + grv;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall) || place_meeting(x,y+vsp,oCrate) || place_meeting(x,y+vsp,oPlayer))
{
	while !(place_meeting(x,y+vsp,oWall) || place_meeting(x,y+vsp,oCrate) || place_meeting(x,y+vsp,oPlayer))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

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
