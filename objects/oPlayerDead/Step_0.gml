if (done == 0)
{
	instance_create_layer(x,y,"Player",oParticle);
	vsp = vsp + grv;

	//Horizontal Collision
	if (place_meeting(x+hsp,y,oWall) || place_meeting(x+hsp,y,oCollision))
	{
		while !(place_meeting(x+sign(hsp),y,oWall) || place_meeting(x+sign(hsp),y,oCollision))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	//Vertical Collision
	if (place_meeting(x,y+vsp,oWall) || place_meeting(x,y+vsp,oCollision))
	{
		if (vsp > 0)
		{
			//done = 1;
			image_index = 1;
			//alarm[0] = 60;
		}
		while !(place_meeting(x,y+sign(vsp),oWall) || place_meeting(x,y+vsp,oCollision))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;

	if (place_meeting(x,y+1,oWall) || place_meeting(x,y+1,oCollision))
	{
		repeat(5)
		{
			with(instance_create_layer(x,bbox_bottom,"Particles",oDust))
			{
				vsp = 0;
			}
		}
		done = 1;
	}
}

//Reset Room
if (done)
&&
keyboard_check_pressed(vk_anykey)
||
mouse_check_button_pressed(mb_any)
||
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
{
	SlideTransition(TRANS_MODE.GOTO,room);
	var file = file_text_open_read(SAVEFILE);
	global.hp = file_text_read_real(file);
	file_text_close(file);
	global.levelchanging = false;
}
