//if (image_angle > 90) && (image_angle < 270) aimside = -1; else aimside = 1;
if sign(oCrosshair.x - oPlayer.x) aimside = 1; else aimside = -1;

if (aimside != 0)
{
	if (oPlayer.crouch)
	{
		currentxoffset = crouchxoffset*aimside;
		currentyoffset = crouchyoffset;
	}
	else
	{
		currentxoffset = xoffset*aimside;
		currentyoffset = yoffset;
	}

	image_yscale = aimside*yscale;
}

//Aimside Types
var playersize = 2;

with (oPlayer) 
{
	switch (oWeapon.aimsidetype)
	{
		case aimsidetypes.movedirection:
		if (hspnodec != 0)
		{
			if (movedir != 0) aimside = sign(hsp);
			image_xscale = aimside*playersize;
		}
		
		if (hsp == 0) && (wallsliding != 0) && (!global.noclip)
		{
			aimside = -onwall;
			image_xscale = aimside*playersize;
		}
		break;
		case aimsidetypes.weapondirection:
		/*if (!oWeapon.holstered)
		{*/
			aimside = oWeapon.aimside;
			if (oWeapon.aimside != 0) image_xscale = aimside*playersize;
		//}
		break;
	}
}

if (oPlayer.crouch) && (oPlayer.onground) ironsights = true; else ironsights = false;

if (oPlayer.wallsliding != 0) && (oPlayer.aimside == oPlayer.onwall)
{
	currentrspeed = 1;
}
else currentrspeed = rspeed;

if (currentswitchdelay < switchdelay)
{
	if (currentxoffset == lastxoffset) currentxfollowspeed = xfollowspeed; else if (xfollowspeed != 0) currentxfollowspeed = 1;
	if (currentyoffset == lastyoffset) currentyfollowspeed = yfollowspeed; else if (yfollowspeed != 0) currentyfollowspeed = 1;
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
if (global.controller == 0) && (global.hascontrol)
{
	pointx = mouse_x;
	pointy = mouse_y;
	pointdir = point_direction(oPlayer.x,oPlayer.y,pointx,pointy);
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
			pointx = controllerh;
			pointy = controllerv;
			pointdir = point_direction(0,0,pointx,pointy);
		}
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

if (place_meeting_ext(x,y,[oWall,oBulletWall])) || (currentreloaddelay != -2) stopattack = true;

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

attacktype = (secondaryattack - primaryattack);

if (attacktype == -1)//Primary Fire
{
	if (currentcd == 0)
	{
		currentcd = random_range(primarycooldownmin,primarycooldownmax);
		if (currentprimaryammo[weapon] >= primaryammospent) currentdelay = primarystartup;
	}

	if (currentdelay == -1) && (currentprimaryammo[weapon] == 0) && (primaryammospent != 0) && (global.key_primaryattack_pressed)
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
		currentattacktype = attacktype;
		currentfiremodetype = primaryfiremodetype;
	
		if (currentprimaryammo[weapon] >= primaryammospent)
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
					image_alpha = oWeapon.primarymuzzleflashalpha;
					image_speed = oWeapon.primarymuzzleflashspritespeed;
					image_index = 0;
					currentxscale = oWeapon.primarymuzzleflashxscale;
					currentyscale = oWeapon.primarymuzzleflashyscale;
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
					currentprojectiledamage = oWeapon.primarydamage;
					
					currenthitspark = oWeapon.primaryhitspark;
					currenthitsparksprite = oWeapon.primaryhitsparksprite;
					currenthitsparkspritespeed = oWeapon.primaryhitsparkspritespeed;
					currenthitsparkxscale = oWeapon.primaryhitsparkxscale;
					currenthitsparkyscale = oWeapon.primaryhitsparkyscale;
					currenthitsparkalpha = oWeapon.primaryhitsparkalpha;
				}
			#endregion
		
			#region Shell
				if (currentfiremodetype == firemodetypes.single) || (currentfiremodetype == firemodetypes.automatic)
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
	
if (attacktype == 1)//Secondary Fire
{
	if (currentsecondaryammo[weapon] != -1)
	{
		if (currentcd == 0)
		{
			currentcd = random_range(secondarycooldownmin,secondarycooldownmax);
			if (currentsecondaryammo[weapon] >= secondaryammospent) currentdelay = secondarystartup;
		}
		if (currentdelay == -1) && (currentsecondaryammo[weapon] == 0) && (secondaryammospent != 0) && (global.key_secondaryattack_pressed)
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
			currentattacktype = attacktype;
			currentfiremodetype = secondaryfiremodetype;
			
			if (currentsecondaryammo[weapon] >= secondaryammospent)
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
						image_alpha = oWeapon.secondarymuzzleflashalpha;
						image_speed = oWeapon.secondarymuzzleflashspritespeed;
						image_index = 0;
						currentxscale = oWeapon.secondarymuzzleflashxscale;
						currentyscale = oWeapon.secondarymuzzleflashyscale;
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
						currentprojectiledamage = oWeapon.secondarydamage;
						
						currenthitspark = oWeapon.secondaryhitspark;
						currenthitsparksprite = oWeapon.secondaryhitsparksprite;
						currenthitsparkspritespeed = oWeapon.secondaryhitsparkspritespeed;
						currenthitsparkxscale = oWeapon.secondaryhitsparkxscale;
						currenthitsparkyscale = oWeapon.secondaryhitsparkyscale;
						currenthitsparkalpha = oWeapon.secondaryhitsparkalpha;
					}
				#endregion
		
				#region Shell
					if (currentfiremodetype == firemodetypes.single) || (currentfiremodetype == firemodetypes.automatic)
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
	}
	else
	{
		if (currentcd == 0)
		{
			currentcd = random_range(secondarycooldownmin,secondarycooldownmax);
			if (currentprimaryammo[weapon] >= primaryammospent) currentdelay = secondarystartup;
		}
		if (currentdelay == -1) && (currentprimaryammo[weapon] == 0) && (primaryammospent != 0) && (global.key_secondaryattack_pressed)
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
			currentattacktype = attacktype;
			currentfiremodetype = secondaryfiremodetype;
		
			if (currentprimaryammo[weapon] >= primaryammospent)
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
						image_alpha = oWeapon.secondarymuzzleflashalpha;
						image_speed = oWeapon.secondarymuzzleflashspritespeed;
						image_index = 0;
						currentxscale = oWeapon.secondarymuzzleflashxscale;
						currentyscale = oWeapon.secondarymuzzleflashyscale;
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
						currentprojectiledamage = oWeapon.primarydamage;
						
						currenthitspark = oWeapon.secondaryhitspark;
						currenthitsparksprite = oWeapon.secondaryhitsparksprite;
						currenthitsparkspritespeed = oWeapon.secondaryhitsparkspritespeed;
						currenthitsparkxscale = oWeapon.secondaryhitsparkxscale;
						currenthitsparkyscale = oWeapon.secondaryhitsparkyscale;
						currenthitsparkalpha = oWeapon.secondaryhitsparkalpha;
					}
				#endregion
		
				#region Shell
					if (currentfiremodetype == firemodetypes.single) || (currentfiremodetype == firemodetypes.automatic)
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
				currentprimaryammo[weapon] -= primaryammospent;
				if (soundsecondary != -1)
				{
					audio_sound_gain(soundsecondary,random_range(soundsecondarygainmin,soundsecondarygainmax),0);
					audio_sound_pitch(audio_play_sound(soundsecondary,5,false),(random_range(soundsecondarypitchmin,soundsecondarypitchmax)));
				}
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

//Mag Reload Start
if (reloadtype == reloadtypes.magazine) && (currentreloaddelay <= 0) && (currentprimaryammo[weapon] < primaryammo) && (currentprimaryreservedammo[weapon] != 0) && (reloading == false) && (global.key_reload_pressed)
//Auto Reloading
|| (reloadtype == reloadtypes.magazine) && (currentreloaddelay <= 0) && (currentprimaryammo[weapon] == 0) && (currentprimaryreservedammo[weapon] != 0) && (reloading == false)
{
	reloading = true;
	
	currentreloaddelay = reloaddelay;
	
	animationplaying = true;
	if (spritereloadlooping) animationlooping = true; else animationlooping = false;
	animstate = animstates.reload;
	
	audio_sound_gain(soundreloadstart,random_range(soundreloadstartgainmin,soundreloadstartgainmax),0);
	audio_sound_pitch(audio_play_sound(soundreloadstart,5,false),(random_range(soundreloadstartpitchmin,soundreloadstartpitchmax)));
}

//Mag Reload End
if (reloadtype == reloadtypes.magazine) && (currentreloaddelay <= 0) && (reloading == true)
{
	reloading = false;
	
	currentprimaryreservedammo[weapon] += currentprimaryammo[weapon];
	
	currentprimaryammo[weapon] = min(primaryammo,currentprimaryreservedammo[weapon]);
	
	currentprimaryreservedammo[weapon] -= currentprimaryammo[weapon];
	
	audio_sound_gain(soundreloadend,random_range(soundreloadendgainmin,soundreloadendgainmax),0);
	audio_sound_pitch(audio_play_sound(soundreloadend,5,false),(random_range(soundreloadendpitchmin,soundreloadendpitchmax)));
}

//Shell Reload Start
if (reloadtype == reloadtypes.shell) && (currentreloaddelay <= 0) && (currentprimaryammo[weapon] < primaryammo) && (currentprimaryreservedammo[weapon] != 0) && (reloading == false) && (global.key_reload_pressed)
//Reload Loop
|| (reloadtype == reloadtypes.shell) && (currentreloaddelay <= 0) && (currentprimaryammo[weapon] < primaryammo) && (currentprimaryreservedammo[weapon] != 0) && (reloading == false) && (reloadloop == true)
//Auto Reloading
|| (reloadtype == reloadtypes.shell) && (currentreloaddelay <= 0) && (currentprimaryammo[weapon] == 0) && (currentprimaryreservedammo[weapon] != 0) && (reloading == false) && (reloadloop == false)
{
	reloading = true;
	
	currentreloaddelay = reloaddelay;
	
	if (currentprimaryammo[weapon] < primaryammo) reloadloop = true; else reloadloop = false;
	
	image_index = 0;
	animationplaying = true;
	if (spritereloadlooping) animationlooping = true; else animationlooping = false;
	animstate = animstates.reload;
	
	audio_sound_gain(soundreloadstart,random_range(soundreloadstartgainmin,soundreloadstartgainmax),0);
	audio_sound_pitch(audio_play_sound(snd_Death,5,false),(random_range(soundreloadstartpitchmin,soundreloadstartpitchmax)));
}

//Shell Reload End
if (reloadtype == reloadtypes.shell) && (currentreloaddelay <= 0) && (reloading == true)
{
	reloading = false;
	
	currentprimaryammo[weapon]++;
	
	currentprimaryreservedammo[weapon]--;
	
	if (currentprimaryammo[weapon] < primaryammo) reloadloop = true; else reloadloop = false;
	
	audio_sound_gain(soundreloadend,random_range(soundreloadendgainmin,soundreloadendgainmax),0);
	audio_sound_pitch(audio_play_sound(soundreloadend,5,false),(random_range(soundreloadendpitchmin,soundreloadendpitchmax)));
}

if (!animationplaying) && (!animationlooping) animstate = animstates.idle;

currentreloaddelay = max(-2,currentreloaddelay-1);

currentdelay = max(-1,currentdelay-1);
if (currentdelay == -1) currentcd = max(0,currentcd-1);
currentrecoil = max(0,currentrecoil*0.8);
//currentrecoil = max(0,floor(currentrecoil*0.8));
//currentprimaryammo[weapon] = 1;//infinite ammo
//depth = oPlayer.depth-1;
