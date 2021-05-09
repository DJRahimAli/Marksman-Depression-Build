global.hp = string_format(global.hp, 0, 0);
if (global.hp < 0) global.hp = 0;

#region //Get Player Input
key_interact = keyboard_check_pressed(ord("E"));
key_suicide = keyboard_check_pressed(ord("K"));

if (key_interact) || (key_suicide)
{
	controller = false;
}

if (gamepad_button_check_pressed(0,gp_face1))
{
	key_interact = true;
	controller = true;
}

if (hascontrol)
{
	key_left = keyboard_check(ord("A"));// || keyboard_check(vk_left);
	key_right = keyboard_check(ord("D"));// || keyboard_check(vk_right);
	key_up = keyboard_check(ord("W"));
	key_down = keyboard_check(ord("S"))
	key_jump = keyboard_check_pressed(vk_space);
	key_jump_held = keyboard_check(vk_space);
	key_crouch = keyboard_check_pressed(vk_control);
	key_crouch_held = keyboard_check(vk_control);
	key_uncrouch = keyboard_check_released(vk_control);
	key_holster = keyboard_check_pressed(ord("H"));
	key_gun = keyboard_check_pressed(ord("2"));

	key_flyup = key_up || keyboard_check(vk_space);
	key_flydown = key_down

	if (key_left) || (key_right) || (key_up) || (key_down) || (key_jump) || (key_jump_held) || (key_crouch) || (key_crouch_held) || (key_uncrouch) || (key_holster) || (key_gun) || (key_flyup) || (key_flydown) || (mouse_check_button(mb_left))
	{
		controller = false;
	}

	if (abs(gamepad_axis_value(0,gp_axislh)) > deadzone)
	{
		key_left = abs(min(gamepad_axis_value(0,gp_axislh),0));
		key_right = max(gamepad_axis_value(0,gp_axislh),0);
		controller = true;
	}

	if (abs(gamepad_axis_value(0,gp_axislv)) > deadzone)
	{
		key_up = abs(min(gamepad_axis_value(0,gp_axislv),0));
		key_down = max(gamepad_axis_value(0,gp_axislv),0);
		key_flyup = key_up;
		key_flydown = key_down;
		controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_shoulderl))
	{
		key_jump = true;
		controller = true;
	}

	if (gamepad_button_check(0,gp_shoulderl))
	{
		key_jump_held = true;
		controller = true;
	}

	if (gamepad_button_check(0,gp_shoulderl))
	{
		key_flyup = true;
		controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_shoulderlb))
	{
		key_crouch = true;
		controller = true;
	}

	if (gamepad_button_check(0,gp_shoulderlb))
	{
		key_crouch_held = true;
		controller = true;
	}

	if (gamepad_button_check_released(0,gp_shoulderlb))
	{
		key_uncrouch = true;
		controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_face4))
	{
		key_suicide = true;
		controller = true;
	}

	if (gamepad_button_check(0,gp_shoulderrb))
	{
		controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_padd))
	{
		key_holster = true;
		controller = true;
	}

	if (gamepad_button_check_pressed(0,gp_padr))
	{
		key_gun = true;
		controller = true;
	}
}
else
{
	key_left = false;
	key_right = false;
	key_up = false;
	key_down = false;
	key_jump = false;
	key_jump_held = false;
	key_crouch = false;
	key_crouch_held = false;
	key_uncrouch = false;
	key_holster = false;
	key_gun = false;

	key_flyup = false;
	key_flydown = false;
}
#endregion

//Calculate current status
onground = (place_meeting(x,y+1,oWall) || place_meeting(x,y+1,oCollision));
onwall = (place_meeting(x+1,y,oWall) || place_meeting(x+1,y,oCollision)) - (place_meeting(x-1,y,oWall) || place_meeting(x-1,y,oCollision));
if (onground) jumpbuffer = 5+1;
if (crouch) onwall = 0;

//Calculate horizontal movement
walksprate = 4;
walkspcrouchrate = 2;
/*
if (!onwallground) && (!global.fly)
{
	walksprate = walksprate/1.1;
	//walkspcrouchrate = walkspcrouchrate/1.1;
}*/

var dir = (key_right - key_left);

if (global.fly) gunkickx = 0;
hsp += dir * accel;
if (dir == 0)
{
	var hspfricfinal = hspfricground;
	if (!onground) && (!global.fly) hspfricfinal = hspfricair;
	hsp = lerp(hsp,0,hspfricfinal) + gunkickx;
}
hsp = clamp(hsp,-walksp,walksp);
gunkickx = 0;

#region //awful smb1 type movement
/*
if (sign(vsp) = 0) hsp = lerp(hsp, move, accel);
*/
#endregion

#region //Crouching
if (key_crouch)
{
	if (onground) || (crouchstuck) || (global.fly)
	{
		walksp = walkspcrouchrate;
	}
}

if (key_crouch_held)
{
	if (onground) || (crouchstuck) || (global.fly)
	{
		crouch = true;
	}
}

if (key_uncrouch)
{
	if (!crouchstuck)
	{
		walksp = walkspcrouchrate;
	}
}

if (crouch) && (onground)
{
	walksp = walkspcrouchrate;
	if instance_exists(oWeapon) oWeapon.ironsights = true;
}
else
{
	walksp = walksprate;
	if instance_exists(oWeapon) oWeapon.ironsights = false;
}

if (place_meeting(x,y-8,oWall) && (onground) || place_meeting(x,y-8,oCollision)) && (!global.noclip)
{
	crouchstuck = true;
	crouch = true;
	walksp = walkspcrouchrate;
}

if !place_meeting(x,y-16,oWall) && !place_meeting(x,y-16,oCollision)
{
	crouchstuck = false;
	if (!key_crouch_held)
	{
		crouch = false;
		walksp = walksprate;
	}
}
#endregion

#region //Holstering
if (key_holster) && instance_exists(oWeapon)
{
	oWeapon.holstered = !oWeapon.holstered;
}

if (key_gun) && instance_exists(oWeapon)
{
	oWeapon.holstered = false;
}
#endregion

//Jumping or Fly Up/Down
if (!global.fly)
{
	vsp = (vsp + grv) + gunkicky;
	gunkicky = 0;

	if (onground) || place_meeting(x,y+1,oSpring) multijump = multijumpamt;

	if (jumpbuffer > -1) jumpbuffer--;

	if (jumpbuffer > 0)
	{
		if (key_jump) && (!crouchstuck)
		{
			jumpbuffer = 0;
			jumpheight = 6;
			vsp = -jumpheight;
			vspfrac = 0;
			audio_play_sound(snd_Jump,10,false);
		}
	}

	if (jumpbuffer < 0)
	{
		if (key_jump) && (multijump > 0)
		{
			multijump--;
			jumpheight = 2.5;
			vsp = -jumpheight;
			audio_play_sound(snd_MultiJump,10,false);
		}
	}
	vsp = clamp(vsp,-vspmax,vspmax);

	//Detect when moving
	if (hspnodec != 0) || (jumpbuffer < 0)
	{
		moving = true;
		instance_create_layer(x,y,"Player",oParticle)
	}
	else 
	{
		moving = false;
	}
}
else
{
	var dirfly = (key_down - key_up);
	
	vsp += dirfly * accel;
	if (dirfly == 0)
	{
		var vspfricfinal = hspfricground;
		vsp = lerp(vsp,0,vspfricfinal);
	}
	vsp = clamp(vsp,-walksp,walksp);
	
	//Detect when moving
	if (hspnodec != 0) || (vspnodec != 0)
	{
		moving = true;
		instance_create_layer(x,y,"Player",oParticle)
	}
	else 
	{
		moving = false;
	}
}

//Variable Jump
if (vsp < 0) && (!key_jump_held) && (!global.fly) vsp += grv; //0.45;

//Spring Jump
if place_meeting(x,y+1,oSpring) && (!crouch)
{
	jumpbuffer = 0;
	jumpheight = 10;
	vsp = -jumpheight;
	vspfrac = 0;
}

/*
//Dump fractions and get final integer speeds
hsp += hspfrac;
vsp += vspfrac;
hspfrac = frac(hsp);
vspfrac = frac(vsp);
hsp -= hspfrac;
vsp -= vspfrac;
*/

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall) || place_meeting(x+hsp,y,oCollision)) && (!global.noclip)
{
	var onepixel = sign(hsp);
	while !(place_meeting(x+onepixel,y,oWall) || place_meeting(x+onepixel,y,oCollision)) x += onepixel;
	hsp = 0;
	hspfrac = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall) || place_meeting(x,y+vsp,oCollision)) && (!global.noclip)
{
	var onepixel = sign(vsp);
	while !(place_meeting(x,y+onepixel,oWall) || place_meeting(x,y+onepixel,oCollision)) y += onepixel;
	vsp = 0;
	vspfrac = 0;
}
y += vsp;

#region //Animation
hspnodec = string_format(hsp, 0, 0);
vspnodec = string_format(vsp, 0, 0);

if instance_exists(oWeapon)
{
	if (hspnodec != 0) && (oWeapon.holstered)
	{
		var aimside = sign(hsp);
		image_xscale = aimside;
	}
}
else
{
	if (hspnodec != 0)
	{
		var aimside = sign(hsp);
		image_xscale = aimside;
	}
}

if instance_exists(oWeapon)
{
	if (!oWeapon.holstered) && (hascontrol)
	{
		if (oWeapon.image_angle > 90) && (oWeapon.image_angle < 270)
		{
			var aimside = -1;
		}
		else
		{
			var aimside = 1;
		}
		if (aimside != 0) image_xscale = aimside;
	}
}

if (!onground)
{
	if (onwall != 0)
	{
		if (!global.fly)
		{
			sprite_index = sPlayerW;
			image_xscale = -onwall;
			image_speed = 1;
			if (audio_is_playing(snd_Sliding) == false)
			{
				audio_play_sound(snd_Sliding, 10, true);
			}
		}
	}
	else
	{
		if (audio_is_playing(snd_Sliding) == true)
		{
			audio_stop_sound(snd_Sliding);
		}
		if (!crouch)
		{
			sprite_index = sPlayerA;
		}
		else
		{
			sprite_index = sPlayerAC;
		}
		image_speed = 0;
		image_index = (vspnodec > 0);
	}
	//if (sign(vspnodec) > 0) image_index = 1; else image_index = 0;
}
else
{
	if (audio_is_playing(snd_Sliding) == true)
	{
		audio_stop_sound(snd_Sliding);
	}
	if (!global.noclip)
	{
		if (sprite_index == sPlayerA) || (sprite_index == sPlayerAC)
		{
			audio_sound_pitch(snd_Landing,random_range(0.8, 1.2));
			audio_play_sound(snd_Landing,4,false);
			repeat(5)
			{
				with(instance_create_layer(x,bbox_bottom,"Particles",oDust))
				{
					vsp = 0;
				}
			}
		}
		if (hspnodec == 0)
		{
			if (!crouch)
			{
				sprite_index = sPlayer;
			}
			else
			{
				sprite_index = sPlayerC;
			}
		}
		else
		{
			if (!crouch) && (!global.noclip)
			{
				image_speed = (1 * hsp/4);
				sprite_index = sPlayerR;
				if (aimside != sign(hsp)) sprite_index = sPlayerRB;
			}
			else
			{
				image_speed = (1 * hsp/4);
				sprite_index = sPlayerRC;
				if (aimside != sign(hsp)) sprite_index = sPlayerRBC;
			}
		}
	}
}
#endregion

//Suicide
if (key_suicide)
{
	suicide = 1;
	global.hp = 0;
	lasthp = 0;
}
