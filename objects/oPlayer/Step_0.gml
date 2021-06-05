global.hp = string_format(global.hp, 0, 0);
if (global.hp < 0) global.hp = 0;

//Calculate current status
onground = (place_meeting(x,y+1,oWall) || place_meeting(x,y+1,oCollision));
onwall = (place_meeting(x+1,y,oWall) || place_meeting(x+1,y,oCollision)) - (place_meeting(x-1,y,oWall) || place_meeting(x-1,y,oCollision));
wallsliding = (collision_rectangle(bbox_left-1, bbox_top+6, bbox_right+1, bbox_bottom-2, oWall, false, true) || collision_rectangle(bbox_left-1, bbox_top+6, bbox_right+1, bbox_bottom-2, oCollision, false, true));
if (!global.fly)
{
	if (onground) jumpbuffer = 5+1;
	if (wallsliding) walljumpbuffer = walljumpbuffermax+1;
	if (onground && onwall != 0 || crouch) walljumpbuffer = 0;
}
else
{
	jumpbuffer = -2;
	walljumpbuffer = 0;
}
if (crouch) wallsliding = 0;

//Calculate horizontal movement
walksprate = 4;
walkspcrouchrate = 2;
walljumpdelay = max(walljumpdelay-1,0);
if (!global.key_jump_held && walljumpdelay <= walljumpdelaymax/2) walljumpdelay /= 2;
/*
if (!onwallground) && (!global.fly)
{
	walksprate = walksprate/1.1;
	//walkspcrouchrate = walkspcrouchrate/1.1;
}*/

if (walljumpdelay == 0)
{
	var dir = (global.key_right_held - global.key_left_held);

	if (global.fly) kickbackx = 0;
	hsp += dir * accel;
	if (dir == 0)
	{
		var hspfricfinal = hspfricground;
		if (!onground) && (!global.fly) hspfricfinal = hspfricair;
		hsp = lerp(hsp,0,hspfricfinal) + kickbackx;
	}
	hsp = clamp(hsp,-walksp,walksp);
}
kickbackx = 0;

//Wall jump
if (!global.fly)
{
	if (walljumpbuffer > 0) walljumpbuffer--;
	
	if (walljumpheight > 0) walljumpheight-=0.05;
	if (vsp > 0 || global.fly) walljumpheight = 0;
	
	if (wallsliding) walljumpdirection = onwall;
	
	if (walljumpbuffer > 0) && (global.key_jump_pressed)
	{
		walljumpbuffer = 0;
		walljumpdelay = walljumpdelaymax;
		jumpheight = 5+walljumpheight;
		hsp = walljumpdirection * -jumpheight;
		vsp = -jumpheight;
		walljumpheight += 1;
		hspfrac = 0;
		vspfrac = 0;
		audio_sound_pitch(snd_Landing,random_range(0.8, 1.2));
		audio_play_sound(snd_Landing,4,false);
		audio_play_sound(snd_MultiJump,10,false);
	}
}

#region //awful smb1 type movement
/*
if (sign(vsp) = 0) hsp = lerp(hsp, move, accel);
*/
#endregion

#region //Crouching
if (global.key_crouch_pressed)
{
	if (onground) || (crouchstuck) || (global.fly)
	{
		walksp = walkspcrouchrate;
	}
}

if (global.key_crouch_pressed)
{
	if (onground) || (crouchstuck) || (global.fly)
	{
		crouch = true;
	}
}

if (global.key_crouch_released)
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
	if (!global.key_crouch_held)
	{
		crouch = false;
		walksp = walksprate;
	}
}
#endregion

#region //Holstering
if (global.key_holster_pressed) && instance_exists(oWeapon)
{
	oWeapon.holstered = !oWeapon.holstered;
}

if (global.key_gun_pressed) && instance_exists(oWeapon)
{
	oWeapon.holstered = false;
}
#endregion

//Calculate vertical movement "Jumping or Fly Up/Down"
if (!global.fly)
{
	var grvfinal = grv;
	var vspmaxfinal = vspmax;
	if (wallsliding)
	{
		grvfinal = grvwall;
		if (vsp > 0) vspmaxfinal = vspmaxwall;
	}
	vsp = (vsp + grvfinal) + kickbacky;
	kickbacky = 0;
	vsp = clamp(vsp,-vspmaxfinal,vspmaxfinal);

	if (jumpbuffer > 0 || place_meeting(x,y+1,oSpring)) multijump = multijumpamt;

	if (jumpbuffer > -1) jumpbuffer--;

	if (jumpbuffer > 0)
	{
		if (global.key_jump_pressed) && (!crouchstuck)
		{
			jumpbuffer = 0;
			jumpheight = 6;
			vsp = -jumpheight;
			vspfrac = 0;
			audio_play_sound(snd_Jump,10,false);
		}
	}

	if (jumpbuffer == -1) && (wallsliding == 0)
	{
		if (global.key_jump_pressed) && (multijump > 0)
		{
			multijump--;
			jumpheight = 2.5;
			vsp = -jumpheight;
			audio_play_sound(snd_MultiJump,10,false);
		}
	}
	//vsp = clamp(vsp,-vspmax,vspmax);

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
	var dirfly = (global.key_down_held - (global.key_up_held || global.key_jump_held));
	
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
if (vsp < 0) && (!global.key_jump_held) && (!global.fly) vsp += grvfinal; //0.45;

//Spring Jump
if place_meeting(x,y+1,oSpring) && (!crouch)
{
	jumpbuffer = 0;
	jumpheight = 10;
	vsp = -jumpheight;
	vspfrac = 0;
}

//Dump fractions and get final integer speeds
/*
hsp += hspfrac;
hspfrac = frac(hsp);
hsp -= hspfrac;
*/

if (wallsliding) && (!global.fly)
{
	vsp += vspfrac;
	vspfrac = frac(vsp);
	vsp -= vspfrac;
}

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
	if (!oWeapon.holstered)
	{
		if (oWeapon.image_angle > 90) && (oWeapon.image_angle < 270)
		{
			aimside = -1;
		}
		else
		{
			aimside = 1;
		}
		image_xscale = aimside;
	}
	
	if (oWeapon.holstered)
	{
		if (hspnodec != 0)
		{
			aimside = sign(hsp);
			image_xscale = aimside;
		}
	
		if (hsp < 1 && onwall != 0) 
		{
			aimside = -onwall;
			image_xscale = aimside;
		}
	}
	
	if (onwall != 0 && aimside == onwall)
	{
		oWeapon.rspeed = 1;
		oCrosshair.rspeed = 1;
	}
	else
	{
		oWeapon.rspeed = 0.25;
		oCrosshair.rspeed = 0.45;
	}
}
else
{
	if (hspnodec != 0)
	{
		aimside = sign(hsp);
		image_xscale = aimside;
	}
	
	if (hsp < 1 && onwall != 0) 
	{
		aimside = -onwall;
		image_xscale = aimside;
	}
}

if (!onground)
{
	if (wallsliding)
	{
		if (!global.fly)
		{
			sprite_index = sPlayerW;
			image_speed = 1;
			
			var side = bbox_left;
			if (onwall == 1) side = bbox_right;
			dust++;
			if ((dust > 2) && (vsp > 0)) with (instance_create_layer(side,y,"Particles",oDust))
			{
				other.dust = 0;
				hspeed = -other.onwall*0.5;
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
		if (!moving && dir == 0)
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
				if (hspnodec != 0 && aimside != sign(hsp)) sprite_index = sPlayerRB;
			}
			else
			{
				image_speed = (1 * hsp/4);
				sprite_index = sPlayerRC;
				if (hspnodec != 0 && aimside != sign(hsp)) sprite_index = sPlayerRBC;
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
	suicide = 1;
	global.hp = 0;
	lasthp = 0;
}
