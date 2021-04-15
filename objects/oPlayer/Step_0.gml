hp = string_format(hp, 0, 0);
if (hp < 0) hp = 0;

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

//Calculate horizontal movement
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

//Calculate current status
onground = place_meeting(x,y+1,oWall);
if (onground) jumpbuffer = 5+1;

#region //awful smb1 type movement
/*
if (sign(vsp) = 0) hsp = lerp(hsp, move, accel);
*/
#endregion

#region //Crouching
if (key_crouch)
{
	if (place_meeting(x,y+1,oWall)) || (crouchstuck) || (global.fly)
	{
		walksp = walkspcrouchrate;
	}
}

if (key_crouch_held)
{
	if (place_meeting(x,y+1,oWall)) || (crouchstuck) || (global.fly)
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

if (crouch) && (place_meeting(x,y+1,oWall))
{
	walksp = walkspcrouchrate;
	if instance_exists(oWeapon) oWeapon.ironsights = true;
}
else
{
	walksp = walksprate;
	if instance_exists(oWeapon) oWeapon.ironsights = false;
}

if (place_meeting(x,y-8,oWall)) && (place_meeting(x,y+2,oWall)) && (!global.noclip)
{
	crouchstuck = true;
	crouch = true;
	walksp = walkspcrouchrate;
}

if (place_meeting(x,y-8,oWall)) && (crouch) && (global.fly) && (!global.noclip)
{
	crouchstuck = true;
	crouch = true;
}

if (!place_meeting(x,y-16*size,oWall)) && (!global.noclip)
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

	if (onground) || (place_meeting(x,y+1,oSpring)) multijump = multijumpamt;

	if (jumpbuffer > -1) jumpbuffer--;

	if (jumpbuffer > 0)
	{
		if (key_jump) && (!crouchstuck)
		{
			jumpbuffer = 0;
			jumpheight = 6;
			vsp = -jumpheight;
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
		vsp = lerp(vsp,0,vspfricfinal) + gunkickx;
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
if (place_meeting(x,y+1,oSpring)) && (!crouch)
{
	jumpbuffer = 0;
	jumpheight = 10;
	vsp = -jumpheight;
}

//Horizontal Collision
if (size < 1)
{
	if (place_meeting(x+hsp,y-1,oWall)) && (!global.noclip)
	{
		while (!place_meeting(x+sign(hsp),y-1,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
}
else
{	
	if (place_meeting(x+hsp,y,oWall)) && (!global.noclip)
	{
		while (!place_meeting(x+sign(hsp),y,oWall))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall)) && (!global.noclip)
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

#region //Animation
hspnodec = string_format(hsp, 0, 0);
vspnodec = string_format(vsp, 0, 0);

if instance_exists(oWeapon)
{
	if (hsp != 0) && (oWeapon.holstered)
	{
		image_xscale = sign(hsp)*size;
	}
	var aimside = sign(hsp);
}
else
{
	if (hsp != 0)
	{
		image_xscale = sign(hsp)*size;
	}
	var aimside = sign(hsp);
}

if instance_exists(oWeapon)
{
	if (!oWeapon.holstered)
	{
		if (!controller)
		{
			var aimside = sign(mouse_x - x)*size;
		}
		else
		{
			var aimside = oWeapon.image_yscale;
		}
		if (aimside != 0) image_xscale = aimside;
	}
}

if (!place_meeting(x,y+1,oWall))
{
	if (!crouch)
	{
		sprite_index = sPlayerA;
	}
	else
	{
		sprite_index = sPlayerAC;
	}
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	if (sprite_index == sPlayerA) || (sprite_index == sPlayerAC)
	{
		audio_sound_pitch(snd_Landing,random_range(0.8, 1.2));
		audio_play_sound(snd_Landing,4,false);
		if (!global.noclip)
		{
			repeat(5)
			{
				with(instance_create_layer(x,bbox_bottom,"Particles",oDust))
				{
					vsp = 0;
				}
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
#endregion

//Suicide
if (key_suicide)
{
	suicide = 1;
	hp = 0;
}
