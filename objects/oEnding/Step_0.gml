/// @desc Move player towards center
layer_x(layerid, min(layer_get_x(layerid)+1.50,RES_W * 0.5 - 306));

//Progress Text
letters += spd;
text = string_copy(endtext[currentline],1,floor(letters));

//Next Line
if (letters >= length) && (keyboard_check_pressed(vk_anykey)
|| mouse_check_button_pressed(mb_any)
|| gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(0,gp_shoulderl) || gamepad_button_check_pressed(0,gp_shoulderlb) || gamepad_button_check_pressed(0,gp_shoulderr) || gamepad_button_check_pressed(0,gp_shoulderrb)
|| gamepad_button_check_pressed(0,gp_face1) || gamepad_button_check_pressed(0,gp_face2) || gamepad_button_check_pressed(0,gp_face3)  || gamepad_button_check_pressed(0,gp_face4)
|| gamepad_button_check_pressed(0,gp_padu) || gamepad_button_check_pressed(0,gp_padd) || gamepad_button_check_pressed(0,gp_padl) || gamepad_button_check_pressed(0,gp_padr)
|| gamepad_button_check_pressed(0,gp_start) || gamepad_button_check_pressed(0,gp_select))
{
	if (currentline+1 == array_length_1d(endtext))
	{
		SlideTransition(TRANS_MODE.RESTART);
	}
	else
	{
		currentline++
		letters = 0;
		length = string_length(endtext[currentline]);
	}
}
