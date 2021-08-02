switch (animstate)
{
	case animstates.idle:
	if (aimside == -1)
	{
		currentsprite = spriteleft;
		oArm.currentsprite = armspriteleft;
	}
	if (aimside == 1)
	{
		currentsprite = spriteright;
		oArm.currentsprite = armspriteright;
	}
	sprite_index = currentsprite;
	image_speed = spritespeed;
	break;
	case animstates.primary:
	if (aimside == -1)
	{
		currentsprite = spriteprimaryleft;
		oArm.currentsprite = armspriteprimaryleft;
	}
	if (aimside == 1)
	{
		currentsprite = spriteprimaryright;
		oArm.currentsprite = armspriteprimaryright;
	}
	sprite_index = currentsprite;
	image_speed = spriteprimaryspeed;
	break;
	case animstates.secondary: break;
	case animstates.pump:
	if (aimside == -1)
	{
		currentsprite = spritepumpleft;
		oArm.currentsprite = armspritepumpleft;
	}
	if (aimside == 1)
	{
		currentsprite = spritepumpright;
		oArm.currentsprite = armspritepumpright;
	}
	sprite_index = currentsprite;
	image_speed = spritepumpspeed;
	break;
	case animstates.startup: 
	if (aimside == -1)
	{
		currentsprite = spritestartupleft;
		oArm.currentsprite = armspritestartupleft;
	}
	if (aimside == 1)
	{
		currentsprite = spritestartupright;
		oArm.currentsprite = armspritestartupright;
	}
	sprite_index = currentsprite;
	image_speed = spritestartupspeed;
	break;
	case animstates.reload: break;
	case animstates.empty:
	if (aimside == -1)
	{
		currentsprite = spriteemptyleft;
		oArm.currentsprite = armspriteemptyleft;
	}
	if (aimside == 1)
	{
		currentsprite = spriteemptyright;
		oArm.currentsprite = armspriteemptyright;
	}
	sprite_index = currentsprite;
	image_speed = spriteemptyspeed;
	break;
}

if (image_angle > 90) && (image_angle < 270) aimside = -1; else aimside = 1;

currentxoffset = xoffset*aimside;

image_yscale = aimside*yscale;

//Aimside Types
var playersize = 2;

with (oPlayer) switch (oWeapon.aimsidetype)
{
	case aimsidetypes.movedirection:
	if (hspnodec != 0)
	{
		if (movedir != 0) aimside = sign(hsp);
		image_xscale = aimside*playersize;
	}
		
	if (hsp < 1 && onwall != 0) 
	{
		aimside = -onwall;
		image_xscale = aimside*playersize;
	}
	break;
	case aimsidetypes.weapondirection:
	/*if (!oWeapon.holstered)
	{*/
		aimside = oWeapon.aimside;
		image_xscale = aimside*playersize;
	//}
	break;
	default:
	if (hspnodec != 0)
	{
		aimside = sign(hsp);
		image_xscale = aimside*playersize;
	}
		
	if (hsp < 1 && onwall != 0) 
	{
		aimside = -onwall;
		image_xscale = aimside*playersize;
	};
}

if (oPlayer.crouch) && (oPlayer.onground) ironsights = true; else ironsights = false;

if (oPlayer.onwall != 0 && oPlayer.aimside == oPlayer.onwall)
{
	currentrspeed = 1;
	oCrosshair.currentrspeed = 1;
}
else
{
	currentrspeed = rspeed;
	oCrosshair.currentrspeed = crosshairrspeed;
}

if (currentswitchdelay < switchdelay)
{
	if (xoffset == lastxoffset) currentxfollowspeed = xfollowspeed; else if (xfollowspeed != 0) currentxfollowspeed = 1;
	if (yoffset == lastyoffset) currentyfollowspeed = yfollowspeed; else if (yfollowspeed != 0) currentyfollowspeed = 1;
	lastxoffset = currentxoffset;
	lastyoffset = currentyoffset;
	x = lerp(x,oPlayer.x+currentxoffset,currentxfollowspeed);
	y = lerp(y,oPlayer.y+currentyoffset,currentyfollowspeed);
}
else
{
	x = oPlayer.x+currentxoffset;
	y = oPlayer.y+currentyoffset;
}

//Set angle of weapon
if (global.controller == 0) if (global.hascontrol)
{
	mouseangle = point_direction(x,y,mouse_x,mouse_y);
	pointdir = mouseangle;
	//image_angle = clamp(image_angle, 0, 360);
	//image_angle = image_angle mod 360;
}
	
if (global.controller == 1)
{
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	if (global.hascontrol)
	{
		if (abs(controllerh) > global.deadzone) || (abs(controllerv) > global.deadzone)
		{
			controllerangle = point_direction(0,0,controllerh,controllerv);
			pointdir = controllerangle;
		}
	}
}

if (oPlayer.onwall == 0) && (aimsidetype != aimsidetypes.movedirection)
{
	currentminmaxangle = 360;
	delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(pointdir, 0)));
	image_angle += angle_difference(delta, image_angle) * currentrspeed;
}
		
if (aimsidetype == aimsidetypes.movedirection) && (oPlayer.onwall == 0)
{
	currentminmaxangle = hspminmaxangle;
	if (oPlayer.aimside == 1)
	{
		delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(pointdir, 0)));
		image_angle += angle_difference(delta, image_angle) * currentrspeed;
	}
	if (oPlayer.aimside == -1)
	{
		delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(pointdir - 180, 0)));
		image_angle += angle_difference(delta, image_angle - 180) * currentrspeed;
	}
}

if (oPlayer.onwall != 0)
{
	currentminmaxangle = wallminmaxangle;
	if (oPlayer.onwall < 0)
	{
		delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(pointdir, 0)));
		image_angle += angle_difference(delta, image_angle) * currentrspeed;
	}
	if (oPlayer.onwall > 0)
	{
		delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(pointdir - 180, 0)));
		image_angle += angle_difference(delta, image_angle - 180) * currentrspeed;
	}
}

if (image_angle > 360) image_angle -= 360;
if (image_angle < 0) image_angle += 360;

//if (image_angle > 90) && (image_angle < 270) image_yscale = -1; else image_yscale = 1;

if (currentswitchdelay < switchdelay)
{
	if (ironsights) currentdistance = lerp(currentdistance, ironsightdistance, ironsightspeed); else currentdistance = lerp(currentdistance, distance, ironsightspeed);
}
else
{
	if (ironsights) currentdistance = ironsightdistance; else currentdistance = distance;
}

if (xfollowspeed != 0) x += lengthdir_x(currentdistance-currentrecoil,image_angle);
if (yfollowspeed != 0) y += lengthdir_y(currentdistance-currentrecoil,image_angle);

if (place_meeting_ext(x,y,[oWall,oBulletWall])) stopattack = true;

//if (stopattack) image_alpha = 0.5; else image_alpha = 1;

//Firemodes
if (global.hascontrol && !stopattack)
{
	switch (primaryfiremodetype)
	{
		case firemodetypes.single: primaryattack = global.key_primaryattack_pressed; break;
		case firemodetypes.automatic: primaryattack = global.key_primaryattack_held; break;
		case firemodetypes.burstsingle: primaryattack = global.key_primaryattack_pressed; break;
		case firemodetypes.burstautomatic: primaryattack = global.key_primaryattack_held; break;
		case firemodetypes.pumpsingle: primaryattack = global.key_primaryattack_pressed; break;
		case firemodetypes.pumpautomatic: primaryattack = global.key_primaryattack_held; break;
	}
	switch (secondaryfiremodetype)
	{
		case firemodetypes.single: secondaryattack = global.key_secondaryattack_pressed; break;
		case firemodetypes.automatic: secondaryattack = global.key_secondaryattack_held; break;
		case firemodetypes.burstsingle: secondaryattack = global.key_secondaryattack_pressed; break;
		case firemodetypes.burstautomatic: secondaryattack = global.key_secondaryattack_held; break;
		case firemodetypes.pumpsingle: secondaryattack = global.key_secondaryattack_pressed; break;
		case firemodetypes.pumpautomatic: secondaryattack = global.key_secondaryattack_held; break;
	}
}
else
{
	primaryattack = false;
	secondaryattack = false;
}

var attacktype = (secondaryattack - primaryattack);

if (attacktype == -1)
{
	if (currentcd == 0)
	{
		currentcd = random_range(primarycooldownmin,primarycooldownmax);
		if (currentprimaryammo[weapon] != 0) currentdelay = primarystartup;
	}

	if (currentdelay == -1) && (currentprimaryammo[weapon] == 0) && (global.key_primaryattack_pressed)
	{
		animationplaying = true;
		if (spriteemptylooping) animationlooping = true; else animationlooping = false;
		animstate = animstates.empty;
		
		if (soundempty != -1)
		{
			audio_sound_gain(soundempty,random_range(soundemptygainmin,soundemptygainmax),0);
			audio_sound_pitch(audio_play_sound(soundempty,5,false),(random_range(soundemptypitchmin,soundemptypitchmax)));
		}
	}

	if (currentdelay == 0)
	{
		if (currentprimaryammo[weapon] != 0)
		{
			animationplaying = true;
			if (spriteprimarylooping) animationlooping = true; else animationlooping = false;
			animstate = animstates.primary;
			image_index = 0;
			if (ironsights) currentrecoil = random_range(primaryironsightrecoilmin,primaryironsightrecoilmax); else currentrecoil = random_range(primaryrecoilmin,primaryrecoilmax);
			currentkickbackx = lengthdir_x(random_range(primarykickbackxmin,primarykickbackxmax), image_angle);
			currentkickbacky = lengthdir_y(random_range(primarykickbackymin,primarykickbackymax), image_angle);
			if (ironsights)
			{
				Shake(random_range(primarycrosshairironsightshakemagnitudemin,primarycrosshairironsightshakemagnitudemax),random_range(primarycrosshairironsightshakelengthmin,primarycrosshairironsightshakelengthmax),oCrosshair);
				Shake(random_range(primarycameraironsightshakemagnitudemin,primarycameraironsightshakemagnitudemax),random_range(primarycameraironsightshakelengthmin,primarycameraironsightshakelengthmax),oCamera);
			}
			else
			{
				Shake(random_range(primarycrosshairshakemagnitudemin,primarycrosshairshakemagnitudemax),random_range(primarycrosshairshakelengthmin,primarycrosshairshakelengthmax),oCrosshair);
				Shake(random_range(primarycamerashakemagnitudemin,primarycamerashakemagnitudemax),random_range(primarycamerashakelengthmin,primarycamerashakelengthmax),oCamera);
			}
		
			#region Muzzleflash
				if (primarymuzzleflash) with (oMuzzleflash)
				{
					image_alpha = 1;
					image_speed = oWeapon.primarymuzzleflashspritespeed;
					image_index = 0;
					currentxoffset = oWeapon.primarymuzzleflashxoffset;
					currentyoffset = oWeapon.primarymuzzleflashyoffset;
					currentsprite = oWeapon.primarymuzzleflashsprite;
				}
			#endregion
		
			#region Projectile
				if (aimside == -1)
				{
					var projectileangleoffset = point_direction(0, 0, primaryprojectilexoffset, -primaryprojectileyoffset);
					var projectiledistanceoffset = point_distance(0, 0, primaryprojectilexoffset, -primaryprojectileyoffset);
				}
				if (aimside == 1)
				{
					var projectileangleoffset = point_direction(0, 0, primaryprojectilexoffset, primaryprojectileyoffset);
					var projectiledistanceoffset = point_distance(0, 0, primaryprojectilexoffset, primaryprojectileyoffset);
				}
				var projectilex = x+lengthdir_x(projectiledistanceoffset,image_angle+projectileangleoffset);
				var projectiley = y+lengthdir_y(projectiledistanceoffset,image_angle+projectileangleoffset);
				if (primaryprojectile != -1) repeat(primaryprojectileamount) with (instance_create_layer(projectilex,projectiley,"Projectiles",primaryprojectile))
				{
					if (oWeapon.ironsights) oWeapon.currentspread = random_range(oWeapon.primaryironsightspreadmin,oWeapon.primaryironsightspreadmax); else oWeapon.currentspread = random_range(oWeapon.primaryspreadmin,oWeapon.primaryspreadmax);
					direction = other.image_angle + oWeapon.currentspread;
					image_angle = direction;
					life = random_range(oWeapon.primaryprojectilelifemin,oWeapon.primaryprojectilelifemax);
					alphalength = oWeapon.primaryprojectilealphalength;
					spd = random_range(oWeapon.primaryprojectilespeedmin,oWeapon.primaryprojectilespeedmax);
					currentsprite = oWeapon.primaryprojectilesprite;
					currentprojectilexscale = oWeapon.primaryprojectilexscale;
					currentprojectileyscale = oWeapon.primaryprojectileyscale;
					currenthitspark = oWeapon.primaryhitspark;
					currenthitsparksprite = oWeapon.primaryhitsparksprite;
					currenthitsparkxscale = oWeapon.primaryhitsparkxscale;
					currenthitsparkyscale = oWeapon.primaryhitsparkyscale;
					currenthitsparkalpha = oWeapon.primaryhitsparkalpha;
				}
			#endregion
		
			#region Shell
				if (primaryfiremodetype == firemodetypes.single) || (primaryfiremodetype == firemodetypes.automatic)
				{
					if (aimside == -1)
					{
						var shellangleoffset = point_direction(0, 0, primaryshellxoffset, -primaryshellyoffset);
						var shelldistanceoffset = point_distance(0, 0, primaryshellxoffset, -primaryshellyoffset);
					}
					if (aimside == 1)
					{
						var shellangleoffset = point_direction(0, 0, primaryshellxoffset, primaryshellyoffset);
						var shelldistanceoffset = point_distance(0, 0, primaryshellxoffset, primaryshellyoffset);
					}
					var shellx = x+lengthdir_x(shelldistanceoffset,image_angle+shellangleoffset);
					var shelly = y+lengthdir_y(shelldistanceoffset,image_angle+shellangleoffset);
					if (primaryshell != -1) repeat(primaryshellamount) with (instance_create_layer(shellx,shelly,"Shells",primaryshell))
					{
						//direction = other.image_angle;
						life = random_range(oWeapon.primaryshelllifemin,oWeapon.primaryshelllifemax);
						alphalength = oWeapon.primaryshellalphalength;
						hsp = lengthdir_x(random_range(oWeapon.primaryshellhspmin,oWeapon.primaryshellhspmax),other.image_angle);
						if (other.image_angle >= 45) && (other.image_angle <= 135) vsp = random_range(-oWeapon.primaryshellvspmin,-oWeapon.primaryshellvspmax); else vsp = random_range(oWeapon.primaryshellvspmin,oWeapon.primaryshellvspmax);
						currentshellbouncehspmin = oWeapon.primaryshellbouncehspmin;
						currentshellbouncehspmax = oWeapon.primaryshellbouncehspmax;
						
						currentshellbouncevspmin = oWeapon.primaryshellbouncevspmin;
						currentshellbouncevspmax = oWeapon.primaryshellbouncevspmax;
						grv = oWeapon.primaryshellgrv;
						currentsprite = oWeapon.primaryshellsprite;
						//if (direction > 90) && (direction < 270) image_xscale = -oWeapon.primaryshellxscale; else image_xscale = oWeapon.primaryshellxscale;
						currentshellxscale = oWeapon.primaryshellxscale;
						currentshellyscale = oWeapon.primaryshellyscale;
					}
				}
			#endregion
			currentprimaryammo[weapon] -= primaryammospent;
			if (soundprimary != -1)
			{
				audio_sound_gain(soundprimary,random_range(soundprimarygainmin,soundprimarygainmax),0);
				audio_sound_pitch(audio_play_sound(soundprimary,5,false),(random_range(soundprimarypitchmin,soundprimarypitchmax)));
			}
		}
	}

	if (primarystartup != 0) && (currentdelay == primarystartup) && (soundstartup != -1)
	{
		animationplaying = true;
		if (spritestartuplooping) animationlooping = true; else animationlooping = false;
		animstate = animstates.startup;
		audio_sound_gain(soundstartup,random_range(soundstartupgainmin,soundstartupgainmax),0);
		audio_sound_pitch(audio_play_sound(soundstartup,5,false),(random_range(soundstartuppitchmin,soundstartuppitchmax)));
	}
}
	
if (attacktype == 1)
{
	if (currentcd == 0)
	{
		currentcd = random_range(secondarycooldownmin,secondarycooldownmax);
		if (currentsecondaryammo[weapon] != 0) currentdelay = secondarystartup;
	}

	if (currentdelay == -1) && (currentsecondaryammo[weapon] == 0) && (global.key_secondaryattack_pressed)
	{
		animationplaying = true;
		if (spriteemptylooping) animationlooping = true; else animationlooping = false;
		animstate = animstates.empty;
		
		if (soundempty != -1)
		{
			audio_sound_gain(soundempty,random_range(soundemptygainmin,soundemptygainmax),0);
			audio_sound_pitch(audio_play_sound(soundempty,5,false),(random_range(soundemptypitchmin,soundemptypitchmax)));
		}
	}

	if (currentdelay == 0)
	{
		if (currentsecondaryammo[weapon] != 0)
		{
			animationplaying = true;
			if (spritesecondarylooping) animationlooping = true; else animationlooping = false;
			animstate = animstates.secondary;
			image_index = 0;
			if (ironsights) currentrecoil = random_range(secondaryironsightrecoilmin,secondaryironsightrecoilmax); else currentrecoil = random_range(secondaryrecoilmin,secondaryrecoilmax);
			currentkickbackx = lengthdir_x(random_range(secondarykickbackxmin,secondarykickbackxmax), image_angle);
			currentkickbacky = lengthdir_y(random_range(secondarykickbackymin,secondarykickbackymax), image_angle);
			if (ironsights)
			{
				Shake(random_range(secondarycrosshairironsightshakemagnitudemin,secondarycrosshairironsightshakemagnitudemax),random_range(secondarycrosshairironsightshakelengthmin,secondarycrosshairironsightshakelengthmax),oCrosshair);
				Shake(random_range(secondarycameraironsightshakemagnitudemin,secondarycameraironsightshakemagnitudemax),random_range(secondarycameraironsightshakelengthmin,secondarycameraironsightshakelengthmax),oCamera);
			}
			else
			{
				Shake(random_range(secondarycrosshairshakemagnitudemin,secondarycrosshairshakemagnitudemax),random_range(secondarycrosshairshakelengthmin,secondarycrosshairshakelengthmax),oCrosshair);
				Shake(random_range(secondarycamerashakemagnitudemin,secondarycamerashakemagnitudemax),random_range(secondarycamerashakelengthmin,secondarycamerashakelengthmax),oCamera);
			}
		
			#region Muzzleflash
				if (secondarymuzzleflash) with (oMuzzleflash)
				{
					image_alpha = 1;
					image_speed = oWeapon.secondarymuzzleflashspritespeed;
					image_index = 0;
					currentxoffset = oWeapon.secondarymuzzleflashxoffset;
					currentyoffset = oWeapon.secondarymuzzleflashyoffset;
					currentsprite = oWeapon.secondarymuzzleflashsprite;
				}
			#endregion
		
			#region Projectile
				if (aimside == -1)
				{
					var projectileangleoffset = point_direction(0, 0, secondaryprojectilexoffset, -secondaryprojectileyoffset);
					var projectiledistanceoffset = point_distance(0, 0, secondaryprojectilexoffset, -secondaryprojectileyoffset);
				}
				if (aimside == 1)
				{
					var projectileangleoffset = point_direction(0, 0, secondaryprojectilexoffset, secondaryprojectileyoffset);
					var projectiledistanceoffset = point_distance(0, 0, secondaryprojectilexoffset, secondaryprojectileyoffset);
				}
				var projectilex = x+lengthdir_x(projectiledistanceoffset,image_angle+projectileangleoffset);
				var projectiley = y+lengthdir_y(projectiledistanceoffset,image_angle+projectileangleoffset);
				if (secondaryprojectile != -1) repeat(secondaryprojectileamount) with (instance_create_layer(projectilex,projectiley,"Projectiles",secondaryprojectile))
				{
					if (oWeapon.ironsights) oWeapon.currentspread = random_range(oWeapon.secondaryironsightspreadmin,oWeapon.secondaryironsightspreadmax); else oWeapon.currentspread = random_range(oWeapon.secondaryspreadmin,oWeapon.secondaryspreadmax);
					direction = other.image_angle + oWeapon.currentspread;
					image_angle = direction;
					life = random_range(oWeapon.secondaryprojectilelifemin,oWeapon.secondaryprojectilelifemax);
					alphalength = oWeapon.secondaryprojectilealphalength;
					spd = random_range(oWeapon.secondaryprojectilespeedmin,oWeapon.secondaryprojectilespeedmax);
					currentsprite = oWeapon.secondaryprojectilesprite;
					currentprojectilexscale = oWeapon.secondaryprojectilexscale;
					currentprojectileyscale = oWeapon.secondaryprojectileyscale;
					currenthitspark = oWeapon.secondaryhitspark;
					currenthitsparksprite = oWeapon.secondaryhitsparksprite;
					currenthitsparkxscale = oWeapon.secondaryhitsparkxscale;
					currenthitsparkyscale = oWeapon.secondaryhitsparkyscale;
					currenthitsparkalpha = oWeapon.secondaryhitsparkalpha;
				}
			#endregion
		
			#region Shell
				if (secondaryfiremodetype == firemodetypes.single) || (secondaryfiremodetype == firemodetypes.automatic)
				{
					if (aimside == -1)
					{
						var shellangleoffset = point_direction(0, 0, secondaryshellxoffset, -secondaryshellyoffset);
						var shelldistanceoffset = point_distance(0, 0, secondaryshellxoffset, -secondaryshellyoffset);
					}
					if (aimside == 1)
					{
						var shellangleoffset = point_direction(0, 0, secondaryshellxoffset, secondaryshellyoffset);
						var shelldistanceoffset = point_distance(0, 0, secondaryshellxoffset, secondaryshellyoffset);
					}
					var shellx = x+lengthdir_x(shelldistanceoffset,image_angle+shellangleoffset);
					var shelly = y+lengthdir_y(shelldistanceoffset,image_angle+shellangleoffset);
					if (secondaryshell != -1) repeat(secondaryshellamount) with (instance_create_layer(shellx,shelly,"Shells",secondaryshell))
					{
						//direction = other.image_angle;
						life = random_range(oWeapon.secondaryshelllifemin,oWeapon.secondaryshelllifemax);
						alphalength = oWeapon.secondaryshellalphalength;
						hsp = lengthdir_x(random_range(oWeapon.secondaryshellhspmin,oWeapon.secondaryshellhspmax),other.image_angle);
						if (other.image_angle >= 45) && (other.image_angle <= 135) vsp = random_range(-oWeapon.secondaryshellvspmin,-oWeapon.secondaryshellvspmax); else vsp = random_range(oWeapon.secondaryshellvspmin,oWeapon.secondaryshellvspmax);
						currentshellbouncehspmin = oWeapon.secondaryshellbouncehspmin;
						currentshellbouncehspmax = oWeapon.secondaryshellbouncehspmax;
						
						currentshellbouncevspmin = oWeapon.secondaryshellbouncevspmin;
						currentshellbouncevspmax = oWeapon.secondaryshellbouncevspmax;
						grv = oWeapon.secondaryshellgrv;
						currentsprite = oWeapon.secondaryshellsprite;
						//if (direction > 90) && (direction < 270) image_xscale = -oWeapon.secondaryshellxscale; else image_xscale = oWeapon.secondaryshellxscale;
						currentshellxscale = oWeapon.secondaryshellxscale;
						currentshellyscale = oWeapon.secondaryshellyscale;
					}
				}
			#endregion
			currentsecondaryammo[weapon] -= secondaryammospent;
			if (soundsecondary != -1)
			{
				audio_sound_gain(soundsecondary,random_range(soundsecondarygainmin,soundsecondarygainmax),0);
				audio_sound_pitch(audio_play_sound(soundsecondary,5,false),(random_range(soundsecondarypitchmin,soundsecondarypitchmax)));
			}
		}
	}

	if (secondarystartup != 0) && (currentdelay == secondarystartup) && (soundstartup != -1)
	{
		animationplaying = true;
		if (spritestartuplooping) animationlooping = true; else animationlooping = false;
		animstate = animstates.startup;
		audio_sound_gain(soundstartup,random_range(soundstartupgainmin,soundstartupgainmax),0);
		audio_sound_pitch(audio_play_sound(soundstartup,5,false),(random_range(soundstartuppitchmin,soundstartuppitchmax)));
	}
}

if (!animationplaying) && (!animationlooping) animstate = animstates.idle;

currentdelay = max(-1,currentdelay-1);
if (currentdelay == -1) currentcd = max(0,currentcd-1);
currentrecoil = max(0,currentrecoil*0.8);
//currentrecoil = max(0,floor(currentrecoil*0.8));
//currentprimaryammo[weapon] = 1;//infinite ammo
//depth = oPlayer.depth-1;
