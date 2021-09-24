#macro RES_W 1920
#macro RES_H 1080
display_set_gui_size(RES_W,RES_H);

//Detect operating system
switch (os_type)
{
   case "os_windows": global.os = 0; break;
   case "os_linux": global.os = 1; break;
   case "os_macosx": global.os = 2; break;
   case "os_android": global.os = 3; break;
   case "os_ios": global.os = 4; break;
   case "os_ps3": global.os = 5; break;
   case "os_ps4": global.os = 6; break;
   case "os_psvita": global.os = 7; break;
   case "os_xboxone": global.os = 8; break;
   case "os_uwp": global.os = 9; break;
   case "os_unknown": global.os = 10; break;
}

#region Get Input
#region Keyboard & Mouse Input
global.key_left = ord("A");
global.key_right = ord("D");
global.key_up = ord("W");
global.key_down = ord("S");
global.key_jump = vk_space;
global.key_crouch = vk_control;
global.key_primaryattack = mb_left;
global.key_secondaryattack = mb_right;
global.key_reload = ord("R");
global.key_holster = ord("H");
global.key_gun = ord("2");
global.key_interact = ord("E");
global.key_suicide = ord("K");

#region Held
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
	
#region Pressed
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

global.key_interact_pressed = keyboard_check_pressed(global.key_interact);
global.key_suicide_pressed = keyboard_check_pressed(global.key_suicide);
#endregion
	
#region Released
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
#endregion

global.controller = false;
global.deadzone = 0.2;
global.hascontrol = true;

global.levelchanging = false;
global.os = 0;
global.kills = 0;
global.killsthisroom = 0;
killtextscale = 1;

rainbowhue = 255;

//window_set_cursor (cr_none)
//cursor_sprite = sCursor;

//test = 0;
