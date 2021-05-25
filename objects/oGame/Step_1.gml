#region //Get Input
#region //Keyboard Input
#region //Held

#endregion

#region //Pressed
global.key_interact_pressed = keyboard_check_pressed(global.key_interact);
global.key_suicide_pressed = keyboard_check_pressed(global.key_suicide);
#endregion

#region //Released

#endregion
#endregion

if (global.key_interact_pressed)
{
	global.controller = false;
}

#region //Gamepad Input
if (gamepad_button_check_pressed(0,gp_face1))
{
	global.key_interact_pressed = true;
	global.controller = true;
}
#endregion

if (global.hascontrol)
{
	#region //Keyboard & Mouse Input
	#region //Held
	global.key_left_held = keyboard_check(global.key_left);
	global.key_right_held = keyboard_check(global.key_right);
	global.key_up_held = keyboard_check(global.key_up);
	global.key_down_held = keyboard_check(global.key_down);
	global.key_jump_held = keyboard_check(global.key_jump);
	global.key_crouch_held = keyboard_check(global.key_crouch);
	global.key_primaryattack_held = mouse_check_button(global.key_primaryattack);
	global.key_secondaryattack_held = mouse_check_button(global.key_secondaryattack);
	global.key_reload_held = keyboard_check(global.key_reload);
	global.key_holster_held = keyboard_check(global.key_holster);
	global.key_gun_held = keyboard_check(global.key_gun);
	#endregion
	
	#region //Pressed
	global.key_left_pressed = keyboard_check_pressed(global.key_left);
	global.key_right_pressed = keyboard_check_pressed(global.key_right);
	global.key_up_pressed = keyboard_check_pressed(global.key_up);
	global.key_down_pressed = keyboard_check_pressed(global.key_down);
	global.key_jump_pressed = keyboard_check_pressed(global.key_jump);
	global.key_crouch_pressed = keyboard_check_pressed(global.key_crouch);
	global.key_primaryattack_pressed = mouse_check_button_pressed(global.key_primaryattack);
	global.key_secondaryattack_pressed = mouse_check_button_pressed(global.key_secondaryattack);
	global.key_reload_pressed = keyboard_check_pressed(global.key_reload);
	global.key_holster_pressed = keyboard_check_pressed(global.key_holster);
	global.key_gun_pressed = keyboard_check_pressed(global.key_gun);
	#endregion
	
	#region //Released
	global.key_left_released = keyboard_check_released(global.key_left);
	global.key_right_released = keyboard_check_released(global.key_right);
	global.key_up_released = keyboard_check_released(global.key_up);
	global.key_down_released = keyboard_check_released(global.key_down);
	global.key_jump_released = keyboard_check_released(global.key_jump);
	global.key_crouch_released = keyboard_check_released(global.key_crouch);
	global.key_primaryattack_released = mouse_check_button_released(global.key_primaryattack);
	global.key_secondaryattack_released = mouse_check_button_released(global.key_secondaryattack);
	global.key_reload_released = keyboard_check_released(global.key_reload);
	global.key_holster_released = keyboard_check_released(global.key_holster);
	global.key_gun_released = keyboard_check_released(global.key_gun);
	#endregion
	#endregion
	
	if (global.key_left_held) || (global.key_right_held) || (global.key_up_held) || (global.key_down_held) || (global.key_jump_held) || (global.key_crouch_held) || (global.key_primaryattack_held) || (global.key_secondaryattack_held) || (global.key_reload_held) || (global.key_holster_held) || (global.key_gun_held) || (global.key_suicide_pressed)
	{
		global.controller = false;
	}
	
	#region //Gamepad Input
	if (abs(gamepad_axis_value(0,gp_axislh)) > global.deadzone)
	{
		global.key_left_held = abs(min(gamepad_axis_value(0,gp_axislh),0));
		global.key_right_held = max(gamepad_axis_value(0,gp_axislh),0);
		global.controller = true;
	}

	if (abs(gamepad_axis_value(0,gp_axislv)) > global.deadzone)
	{
		global.key_up_held = abs(min(gamepad_axis_value(0,gp_axislv),0));
		global.key_down_held = max(gamepad_axis_value(0,gp_axislv),0);
		global.controller = true;
	}

	if (gamepad_button_check(0,gp_shoulderl))
	{
		global.key_jump_held = true;
		global.controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_shoulderl))
	{
		global.key_jump_pressed = true;
		global.controller = true;
	}
	
	if (gamepad_button_check(0,gp_shoulderlb))
	{
		global.key_crouch_held = true;
		global.controller = true;
	}
	
	if (gamepad_button_check_pressed(0,gp_shoulderlb))
	{
		global.key_crouch_pressed = true;
		global.controller = true;
	}
	
	if (gamepad_button_check_released(0,gp_shoulderlb))
	{
		global.key_crouch_released = true;
		global.controller = true;
	}
	
	if (gamepad_button_check(0,gp_shoulderrb))
	{
		global.key_primaryattack_held = true;
		global.controller = true;
	}
	
	if (gamepad_button_check_pressed(0,gp_shoulderrb))
	{
		global.key_primaryattack_pressed = true;
		global.controller = true;
	}
	
	if (gamepad_button_check_pressed(0,gp_face4))
	{
		global.key_suicide_pressed = true;
		global.controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_padd))
	{
		global.key_holster_pressed = true;
		global.controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_padr))
	{
		global.key_gun_pressed = true;
		global.controller = true;
	}
	#endregion
}
else
{
	#region //Held
	global.key_left_held = false;
	global.key_right_held = false;
	global.key_up_held = false;
	global.key_down_held = false;
	global.key_jump_held = false;
	global.key_crouch_held = false;
	global.key_primaryattack_held = false;
	global.key_secondaryattack_held = false;
	global.key_reload_held = false;
	global.key_holster_held = false;
	global.key_gun_held = false;
	#endregion
	
	#region //Pressed
	global.key_left_pressed = false;
	global.key_right_pressed = false;
	global.key_up_pressed = false;
	global.key_down_pressed = false;
	global.key_jump_pressed = false;
	global.key_crouch_pressed = false;
	global.key_primaryattack_pressed = false;
	global.key_secondaryattack_pressed = false;
	global.key_reload_pressed = false;
	global.key_holster_pressed = false;
	global.key_gun_pressed = false;
	#endregion
	
	#region //Released
	global.key_left_released = false;
	global.key_right_released = false;
	global.key_up_released = false;
	global.key_down_released = false;
	global.key_jump_released = false;
	global.key_crouch_released = false;
	global.key_primaryattack_released = false;
	global.key_secondaryattack_released = false;
	global.key_reload_released = false;
	global.key_holster_released = false;
	global.key_gun_released = false;
	#endregion
}
#endregion
