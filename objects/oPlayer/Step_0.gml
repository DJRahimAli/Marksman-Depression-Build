global.hp = string_format(global.hp, 0, 0);
if (global.hp < 0) global.hp = 0;

//Calculate current status
onground = (place_meeting(x,y+1,oWall) || place_meeting(x,y+1,oCollision));
onwall = (place_meeting(x+1,y,oWall) || place_meeting(x+1,y,oCollision)) - (place_meeting(x-1,y,oWall) || place_meeting(x-1,y,oCollision));
wallsliding = (collision_rectangle(bbox_left-1, bbox_top+6, bbox_right+1, bbox_bottom-6, oWall, false, true) || collision_rectangle(bbox_left-1, bbox_top+6, bbox_right+1, bbox_bottom-6, oCollision, false, true));
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
/*walkspmax = 4;
walkspcrouchmax = 2;*/
walljumpdelay = max(walljumpdelay-1,0);
if (!global.key_jump_held && walljumpdelay <= walljumpdelaymax/2) walljumpdelay /= 2;
/*
if (!onwallground) && (!global.fly)
{
	walkspmax = walkspmax/1.1;
	//walkspcrouchmax = walkspcrouchmax/1.1;
}*/

if (walljumpdelay == 0)
{
	var dir = (global.key_right_held - global.key_left_held);

	if (global.fly) oWeapon.currentkickbackx = 0;
	hsp += dir * accel;
	if (dir == 0)
	{
		var hspfricfinal = hspfricground;
		if (!onground) && (!global.fly) hspfricfinal = hspfricair;
		hsp = lerp(hsp,0,hspfricfinal) + oWeapon.currentkickbackx;
		hsp = clamp(hsp,-walksp,walksp);
	}
	else
	{
		hsp += oWeapon.currentkickbackx;
		hsp = clamp(hsp,-walksp*abs(dir),walksp*abs(dir));
	}
}
oWeapon.currentkickbackx = 0;

//Wall jump
if (vsp > 0 || global.fly) walljumpheight = 0;

if (!global.fly)
{
	if (walljumpbuffer > 0) walljumpbuffer--;
	
	if (walljumpheight > 0) walljumpheight-=0.05;
	
	if (onwall != 0) walljumpdirection = onwall;
	
	if (global.key_jump_pressed) && (walljumpbuffer > 0) && (walljumpdelay < walljumpdelaymax-6.5)
	{
		walljumpbuffer = 0;
		walljumpdelay = walljumpdelaymax;
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

#region awful smb1 type movement
/*
if (sign(vsp) = 0) hsp = lerp(hsp, move, accel);
*/
#endregion

#region Crouching
if (global.key_crouch_pressed)
{
	if (onground) || (crouchstuck) || (global.fly) walksp = walkspcrouchmax;
}

if (global.key_crouch_pressed)
{
	if (onground) || (crouchstuck) || (global.fly) crouch = true;
}

if (global.key_crouch_released)
{
	if (!crouchstuck) walksp = walkspcrouchmax;
}

if (crouch) && (onground) walksp = walkspcrouchmax; else walksp = walkspmax;

if (place_meeting(x,y-8,oWall) && (onground) || place_meeting(x,y-8,oCollision)) && (!global.noclip)
{
	crouchstuck = true;
	crouch = true;
	walksp = walkspcrouchmax;
}

if !place_meeting(x,y-16,oWall) && !place_meeting(x,y-16,oCollision)
{
	crouchstuck = false;
	if (!global.key_crouch_held)
	{
		crouch = false;
		walksp = walkspmax;
	}
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
	vsp = (vsp + grvfinal) + oWeapon.currentkickbacky;
	oWeapon.currentkickbacky = 0;
	vsp = clamp(vsp,-vspmaxfinal,vspmaxfinal);

	if (jumpbuffer > 0 || place_meeting(x,y+1,oSpring)) multijump = multijumpmax;

	if (jumpbuffer > -1) jumpbuffer--;

	if (global.key_jump_pressed) && (jumpbuffer > 0) && (!crouchstuck)
	{
		if (!crouch)
		{
			jumpbuffer = 0;
			vsp = -jumpheight;
			vspfrac = 0;
			audio_play_sound(snd_Jump,10,false);
		}
		
		if (crouch)
		{
			jumpbuffer = 0;
			vsp = -jumpheightcrouch;
			vspfrac = 0;
			audio_play_sound(snd_Jump,10,false);
		}
	}
	
	if (global.key_jump_pressed) && (multijump > 0) && (jumpbuffer == -1) && (wallsliding == 0)
	{
		multijump--;
		vsp = -jumpheightmulti;
		audio_play_sound(snd_MultiJump,10,false);
	}
	//vsp = clamp(vsp,-vspmax,vspmax);

	//Detect when moving
	if (hspnodec != 0) || (jumpbuffer < 0) moving = true; else moving = false;
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
	if (hspnodec != 0) || (vspnodec != 0) moving = true; else moving = false;
}

//Variable Jump
if (vsp < 0) && (!global.key_jump_held) && (!global.fly) vsp += grvfinal*2; //0.45;

//Spring Jump
if place_meeting(x,y+1,oSpring) && (!crouch)
{
	jumpbuffer = 0;
	vsp = -jumpheightspring;
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

//Player Trail
if (moving && playertrail) instance_create_layer(x,y,"Player",oParticle);

#region Animation
hspnodec = string_format(hsp, 0, 0);
vspnodec = string_format(vsp, 0, 0);

if instance_exists(oWeapon)
{
	if (crouch) && (onground) && (oWeapon.ironsight) oWeapon.ironsights = true; else oWeapon.ironsights = false;
	
	//Aimside Types
	switch (oWeapon.aimsidetype)
	{
		case "hsp":
		if (hspnodec != 0)
		{
			aimside = sign(hsp);
			image_xscale = aimside*1.5;
		}
		
		if (hsp < 1 && onwall != 0) 
		{
			aimside = -onwall;
			image_xscale = aimside*1.5;
		}
		break;
		case "direction":
		/*if (!oWeapon.holstered)
		{*/
			if (oWeapon.image_angle > 90) && (oWeapon.image_angle < 270) aimside = -1; else aimside = 1;
			image_xscale = aimside*1.5;
		//}
		break;
		default:
		if (hspnodec != 0)
		{
			aimside = sign(hsp);
			image_xscale = aimside*1.5;
		}
		
		if (hsp < 1 && onwall != 0) 
		{
			aimside = -onwall;
			image_xscale = aimside*1.5;
		};
	}

	if (onwall != 0 && aimside == onwall)
	{
		oWeapon.currentrspeed = 1;
		oCrosshair.currentrspeed = 1;
	}
	else
	{
		oWeapon.currentrspeed = oWeapon.rspeed;
		oCrosshair.currentrspeed = oCrosshair.rspeed;
	}
}
else
{
	if (hspnodec != 0)
	{
		aimside = sign(hsp);
		image_xscale = aimside*1.5;
	}
		
	if (hsp < 1 && onwall != 0) 
	{
		aimside = -onwall;
		image_xscale = aimside*1.5;
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
				hsp = -other.onwall*random_range(0.08,0.6);
				hsp = -other.onwall*random_range(0.08,0.6);
				vsp = random_range(-0.4,0.4);
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
		if (!crouch) sprite_index = sPlayerA; else sprite_index = sPlayerAC;
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
		if (hsp == 0 || dir == 0)
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
		if (onwall == 0) && (abs(hsp) || abs(dir))
		{
			if (!crouch) && (!global.noclip)
			{
				image_speed = clamp(abs(hsp)/walkspmax,0.2,1);
				sprite_index = sPlayerR;
				//if (aimside != sign(hsp)) sprite_index = sPlayerRB;
			}
			else
			{
				image_speed = clamp(abs(hsp)/walkspcrouchmax,0.2,1);
				sprite_index = sPlayerRC;
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
	suicide = 1;
	global.hp = 0;
	lasthp = 0;
}
