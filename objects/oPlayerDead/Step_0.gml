if (done == 0)
{
	with (instance_create_layer(x,y,layer,oParticle)) particletype = particletypes.playerdead;
	vsp += grv;

	//Horizontal Collision
	if (place_meeting_ext(x+hsp,y,[oWall,oCollision]))
	{
		var onepixel = sign(hsp);
		while !(place_meeting_ext(x+onepixel,y,[oWall,oCollision])) x += onepixel;
		hsp = 0;
	}
	x += hsp;

	//Vertical Collision
	if (place_meeting_ext(x,y+vsp,[oWall,oCollision]))
	{
		if (vsp > 0)
		{
			//done = 1;
			image_index = 1;
			//alarm[0] = 60;
		}
		var onepixel = sign(vsp);
		while !(place_meeting_ext(x,y+onepixel,[oWall,oCollision])) y += onepixel;
		vsp = 0;
	}
	y += vsp;

	if (place_meeting_ext(x,y+1,[oWall,oCollision]))
	{
		/*repeat(5)
		{
			with(instance_create_layer(x,bbox_bottom,"Particles",oDust))
			{
				hsp = random_range(-2,2);
			}
		}*/
		done = 1;
	}
}

//Reset Room
if (done && keyboard_check_pressed(vk_anykey)
|| mouse_check_button_pressed(mb_any)
|| gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(0,gp_shoulderlb) || gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(0,gp_shoulderrb)
|| gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face3)  || gamepad_button_check_pressed(0,gp_face4)
|| gamepad_button_check_pressed(0,gp_padu) || gamepad_button_check_pressed(0,gp_padd) || gamepad_button_check_pressed(0,gp_padl) || gamepad_button_check_pressed(0,gp_padr)
|| gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(0,gp_select))
{
	TransitionStart(room,sqFadeOut,sqFadeIn);
	var file = file_text_open_read(SAVEFILE);
	currenthp = file_text_read_real(file);
	file_text_close(file);
	global.levelchanging = false;
	global.hasweapon = false;
}
