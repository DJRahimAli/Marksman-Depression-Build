vsp += grv;

//Vertical Collision
if (place_meeting_ext(x,y+vsp,[oWall,oCrate,oPlayer]))
{
	var onepixel = sign(vsp);
	while (!place_meeting_ext(x,y+onepixel,[oWall,oCrate,oPlayer])) y += onepixel;
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
