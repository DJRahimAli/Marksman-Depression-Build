//Calculate current status
onground = (place_meeting_ext(x,y+1,[oWall,oCollision]));
onwall = (place_meeting_ext(x+1,y,[oWall,oCollision])) - (place_meeting_ext(x-1,y,[oWall,oCollision]));
if (collision_rectangle_ext(bbox_left-1, bbox_top, bbox_right+1, bbox_bottom, [oWall,oCollision], false, true)) walltouching = true; else walltouching = false;
if (collision_rectangle_ext(bbox_left-1, bbox_top+12, bbox_right+1, bbox_bottom-12, [oWall,oCollision], false, true)) wallsliding = true; else wallsliding = false;	

if (!global.fly)
{
	if (onground) currentjumpbuffer = jumpbuffer+1;
	if (wallsliding) currentwalljumpbuffer = walljumpbuffer+1;
	if (onground) || (crouch) currentwalljumpbuffer = 0;
}
else
{
	currentjumpbuffer = -2;
	currentwalljumpbuffer = 0;
}
if (crouch) wallsliding = false;

//Calculate horizontal movement
/*walkspmax = 4;
walkspcrouchmax = 2;*/
currentwalljumpdelay = max(currentwalljumpdelay-1,0);
if (!global.key_jump_held) && (currentwalljumpdelay <= walljumpdelay/2) currentwalljumpdelay /= 2;
/*
if (!onwallground) && (!global.fly)
{
	walkspmax = walkspmax/1.1;
	//walkspcrouchmax = walkspcrouchmax/1.1;
}*/

if (currentwalljumpdelay == 0)
{
	movedir = (global.key_right_held - global.key_left_held);

	if (global.fly) oWeapon.currentkickbackx = 0;
	hsp += movedir * accel;
	if (movedir == 0)
	{
		var hspfricfinal = hspfricground;
		if (!onground) && (!global.fly) hspfricfinal = hspfricair;
		hsp = lerp(hsp,0,hspfricfinal);
		hsp = clamp(hsp,-currentwalksp,currentwalksp) + oWeapon.currentkickbackx;
	}
	else
	{
		if (abs(hsp) >= currentwalksp) && (aimside != sign(hsp)) hsp = clamp(hsp,-currentwalksp*abs(movedir),currentwalksp*abs(movedir));
		else hsp = clamp(hsp,-currentwalksp*abs(movedir),currentwalksp*abs(movedir)) + oWeapon.currentkickbackx;
	}
}
oWeapon.currentkickbackx = 0;

#region awful smb1 type movement
/*
if (sign(vsp) = 0) hsp = lerp(hsp, move, accel);
*/
#endregion

#region Crouching
if (global.key_crouch_pressed)
{
	if (onground) || (crouchstuck) || (global.fly) currentwalksp = walkspcrouch;
}

if (global.key_crouch_pressed)
{
	if (onground) || (crouchstuck) || (global.fly) crouch = true;
}

if (global.key_crouch_released)
{
	if (!crouchstuck) currentwalksp = walkspcrouch;
}

if (crouch) && (onground) currentwalksp = walkspcrouch; else currentwalksp = walksp;

if (place_meeting_ext(x,y-4,[oWall,oCollision])) && (onground) && (!global.noclip)
{
	crouchstuck = true;
	crouch = true;
	currentwalksp = walkspcrouch;
}

if (!place_meeting_ext(x,y-6,[oWall,oCollision]))
{
	crouchstuck = false;
	if (!global.key_crouch_held)
	{
		crouch = false;
		currentwalksp = walksp;
	}
}
#endregion

//Calculate vertical movement "Jumping or Fly Up/Down"
if (!global.fly)
{
	var grvfinal = grv;
	var vspmaxfinal = vspmax;
	if (currentwalljumpbuffer)
	{
		grvfinal = grvwall;
		if (vsp > 0) vspmaxfinal = vspmaxwall;
	}
	vsp = (vsp + grvfinal) + oWeapon.currentkickbacky;
	oWeapon.currentkickbacky = 0;
	vsp = clamp(vsp,-vspmaxfinal,vspmaxfinal);

	if (currentjumpbuffer > 0 || place_meeting(x,y+1,oSpring)) currentmultijump = multijump;

	if (currentjumpbuffer > -1) currentjumpbuffer--;

	if (global.key_jump_pressed) && (currentjumpbuffer > 0) && (!crouchstuck)
	{
		if (!crouch)
		{
			currentjumpbuffer = 0;
			vsp = -jumpheight;
			vspfrac = 0;
			audio_play_sound(snd_Jump,10,false);
		}
		
		if (crouch)
		{
			currentjumpbuffer = 0;
			vsp = -jumpheightcrouch;
			vspfrac = 0;
			audio_play_sound(snd_Jump,10,false);
		}
	}
	
	if (global.key_jump_pressed) && (currentmultijump > 0) && (currentjumpbuffer == -1) && (currentwalljumpbuffer == 0)
	{
		currentmultijump--;
		vsp = -jumpheightmulti;
		audio_play_sound(snd_MultiJump,10,false);
	}
	//vsp = clamp(vsp,-vspmax,vspmax);

	//Detect when moving
	if (hspnodec != 0) || (currentjumpbuffer < 0) moving = true; else moving = false;
}
else
{
	var flydir = (global.key_down_held - global.key_up_held);
	if (global.key_jump_held) && (flydir <= 0) var flydir = -1;

	if (global.fly) oWeapon.currentkickbacky = 0;
	vsp += flydir * accel;
	if (flydir == 0)
	{
		var vspfricfinal = hspfricground;
		vsp = lerp(vsp,0,vspfricfinal) + oWeapon.currentkickbacky;
		vsp = clamp(vsp,-currentwalksp,currentwalksp);
	}
	else
	{
		if (abs(vsp) >= currentwalksp) vsp = clamp(vsp,-currentwalksp*abs(flydir),currentwalksp*abs(flydir));
		else vsp = clamp(vsp,-currentwalksp*abs(flydir),currentwalksp*abs(flydir)) + oWeapon.currentkickbacky;
	}
	oWeapon.currentkickbacky = 0;
	
	//Detect when moving
	if (hspnodec != 0) || (vspnodec != 0) moving = true; else moving = false;
}

//Variable Jump
if (vsp < 0) && (!global.key_jump_held) && (!global.fly) vsp += grvfinal*2; //0.45;

//Wall jump
if (vsp > 0 || global.fly) walljumpheight = 0;

if (!global.fly)
{
	if (currentwalljumpbuffer > 0) currentwalljumpbuffer--;
	
	if (walljumpheight > 0) walljumpheight -= 0.05;
	
	if (onwall != 0) walljumpdirection = onwall;
	
	if (global.key_jump_pressed) && (currentwalljumpbuffer > 0) && (currentwalljumpdelay < walljumpdelay-6.5)
	{
		currentwalljumpbuffer = 0;
		currentwalljumpdelay = walljumpdelay;
		hsp = walljumpdirection * -(jumpheightwall+walljumpheight/2);
		vsp = -(jumpheightwall+walljumpheight);
		walljumpheight += 1;
		hspfrac = 0;
		vspfrac = 0;
		audio_sound_pitch(snd_Landing,random_range(0.8, 1.2));
		audio_play_sound(snd_Landing,4,false);
		audio_play_sound(snd_MultiJump,10,false);
	}
}

//Spring Jump
if place_meeting(x,y+1,oSpring) && (!crouch)
{
	currentjumpbuffer = 0;
	vsp = -jumpheightspring;
	vspfrac = 0;
}

//Dump fractions and get final integer speeds
/*
hsp += hspfrac;
hspfrac = frac(hsp);
hsp -= hspfrac;
*/

if (currentwalljumpbuffer) && (!onground) && (!global.fly)
{
	vsp += vspfrac;
	vspfrac = frac(vsp);
	vsp -= vspfrac;
}

//Horizontal Collision
if (place_meeting_ext(x+hsp,y,[oWall,oCollision])) && (!global.noclip) 
{
	var onepixel = sign(hsp);
	while (!place_meeting_ext(x+onepixel,y,[oWall,oCollision])) x += onepixel;
	hsp = 0;
	hspfrac = 0;
}
x += hsp;

//Vertical Collision
if (place_meeting_ext(x,y+vsp,[oWall,oCollision])) && (!global.noclip)
{
	var onepixel = sign(vsp);
	while (!place_meeting_ext(x,y+onepixel,[oWall,oCollision])) y += onepixel;
	vsp = 0;
	vspfrac = 0;
}
y += vsp;

//Player Trail
if (moving && playertrail)
with (instance_create_layer(x,y,layer+1,oParticle)) particletype = particletypes.player;

#region Animation
hspnodec = string_format(hsp, 0, 0);
vspnodec = string_format(vsp, 0, 0);

if (!onground)
{
	if (currentwalljumpbuffer)
	{
		if (!global.fly)
		{
			sprite_index = sPlayerW;
			image_speed = 1;
			
			var side = bbox_left;
			if (onwall == 1) side = bbox_right;
			
			dust++;
			if (dust > 4) && (vsp > 0) with (instance_create_layer(side,y,"Particles",oDust))
			{
				other.dust = 0;
				hsp = -other.onwall*random_range(0.16,1.2);
				vsp = random_range(-0.8,0.8);
				if (audio_is_playing(snd_Sliding) == false)
				{
					audio_play_sound(snd_Sliding, 10, true);
				}
			}
		}
	}
	else
	{
		dust = 0;
		image_speed = 0;
		image_index = (vspnodec > 0);
		if (!crouch) sprite_index = sPlayerA; else sprite_index = sPlayerAC;
		if (audio_is_playing(snd_Sliding) == true)
		{
			audio_stop_sound(snd_Sliding);
		}
	}
	//if (sign(vspnodec) > 0) image_index = 1; else image_index = 0;
}
else
{
	dust = 0;
	if (!global.noclip)
	{
		/*if (sprite_index == sPlayerA) || (sprite_index == sPlayerAC)
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
		}*/
		if (hsp == 0 || movedir == 0)
		{
			if (!crouch)
			{
				image_speed = 0;
				sprite_index = sPlayer;
			}
			else
			{
				image_speed = 0;
				sprite_index = sPlayerC;
			}
		}
		if (onwall == 0) && (movedir != 0) && (abs(hsp) || abs(movedir))
		{
			if (!crouch) && (!global.noclip)
			{
				image_speed = clamp(abs(hsp)/currentwalksp,0.2,1);
				sprite_index = sPlayerR;
				//if (aimside != sign(hsp)) sprite_index = sPlayerRB;
			}
			else
			{
				image_speed = clamp(abs(hsp)/currentwalksp,0.2,1);
				sprite_index = sPlayerRC;
				//if (aimside != sign(hsp)) sprite_index = sPlayerRBC;
			}
		}
		if (onwall == 0) && (movedir == 0) && (abs(hsp) || abs(movedir))
		{
			if (!crouch) && (!global.noclip)
			{
				image_speed = 0;
				//if (aimside != sign(hsp)) sprite_index = sPlayerRB;
			}
			else
			{
				image_speed = 0;
				//if (aimside != sign(hsp)) sprite_index = sPlayerRBC;
			}
		}
	}
	if (audio_is_playing(snd_Sliding) == true)
	{
		audio_stop_sound(snd_Sliding);
	}
}

if (global.fly) && (audio_is_playing(snd_Sliding) == true)
{
	audio_stop_sound(snd_Sliding);
}
#endregion

//Suicide
if (global.key_suicide_pressed)
{
	suicide = true;
	currenthp = 0;
	lasthp = 0;
}
