if (done == 0)
{
	instance_create_layer(x,y,"Player",oParticle);
	vsp = vsp + grv;

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
		if (vsp > 0)
		{
			done = 1;
			image_index = 1;
			//alarm[0] = 60;
		}
		while (!place_meeting(x,y+sign(vsp),oWall))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}

//Reset Room
if (done)
&&
gamepad_button_check_pressed(0,gp_face1)
||
gamepad_button_check_pressed(0,gp_face2)
||
gamepad_button_check_pressed(0,gp_face3)
||
gamepad_button_check_pressed(0,gp_face4)
||
gamepad_button_check_pressed(0,gp_select)
||
gamepad_button_check_pressed(0,gp_start)
||
gamepad_button_check_pressed(0,gp_shoulderl)
||
gamepad_button_check_pressed(0,gp_shoulderlb)
||
gamepad_button_check_pressed(0,gp_shoulderr)
||
gamepad_button_check_pressed(0,gp_shoulderrb)
SlideTransition(TRANS_MODE.GOTO,room);
