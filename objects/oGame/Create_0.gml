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

#region //Get Input
//Keyboard Input
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
global.key_flyup = global.key_up || global.key_jump;
global.key_flydown = global.key_down;
global.key_interact = ord("E");
global.key_suicide = ord("K");
#endregion

global.controller = false;
global.deadzone = 0.2;
global.hascontrol = true;

global.levelchanging = false;
global.os = 0;
global.kills = 0;
global.killsthisroom = 0;
killtextscale = 1;

//window_set_cursor (cr_none)
//cursor_sprite = sCursor;

//test = 0;
