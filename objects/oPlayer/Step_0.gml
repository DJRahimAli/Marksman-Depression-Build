//Get Player Input
key_left = keyboard_check(ord("A"));
key_right = keyboard_check(ord("D"));
key_jump = keyboard_check_pressed(vk_space);
#region //Sprinting
//key_walk = keyboard_check_released(vk_shift);
//key_sprint = keyboard_check_pressed(vk_shift);
#endregion

//Calculate Movement
var move = key_right - key_left;

hsp = move * wlksp;

vsp = vsp + grv;

if (place_meeting(x,y+1,oWall)) && (key_jump)
{
	vsp = -7;
	audio_play_sound(snd_PlayerJump,10,false)
}

//Horizontal Collision 
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision 
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//

#region //Sprinting
//var sprint = key_sprint - key_walk;

//if (!place_meeting(x,y+1,oWall))
//{
//	sprint = 0;
//}

//if sprint = 1
//{
//	wlksp += 1;
//	audio_play_sound(snd_PlayerSprint,10,false)
//}
//if sprint = -1
//{
//	wlksp -= 1;
//}
#endregion