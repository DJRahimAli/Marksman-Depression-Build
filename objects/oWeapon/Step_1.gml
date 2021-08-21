//Change Weapon
if (currentswitchdelay > 0) currentswitchdelay--;

if (currentswitchdelay == 0)
{
	stopattack = false;
	if (global.hascontrol)
	{
		//Next Weapon
		if mouse_wheel_down()
		{
			stopattack = true;
			image_speed = 0;
			image_index = 0;
			if (primarymuzzleflash) || (secondarymuzzleflash) with (oMuzzleflash)
			{
				image_alpha = 0;
				image_speed = 0;
				image_index = 0;
				currentxoffset = 0;
				currentyoffset = 0;
				currentsprite = -1;
			}
			currentweapon += 1;
			if (currentweapon >= array_length(weapons)) currentweapon = 0;
			SetWeapon(currentweapon);
			currentswitchdelay = switchdelay;
		}

		//Previous Weapon
		if mouse_wheel_up()
		{
			stopattack = true;
			image_speed = 0;
			image_index = 0;
			if (primarymuzzleflash) || (secondarymuzzleflash) with (oMuzzleflash)
			{
				image_alpha = 0;
				image_speed = 0;
				image_index = 0;
				currentxoffset = 0;
				currentyoffset = 0;
				currentsprite = -1;
			}
			currentweapon -= 1;
			if (currentweapon < 0) currentweapon = array_length(weapons)-1;
			SetWeapon(currentweapon);
			currentswitchdelay = switchdelay;
		}
	}
}
else stopattack = true;

if (primaryfiremodetype == firemodetypes.pumpsingle) || (primaryfiremodetype == firemodetypes.pumpautomatic)
{
	if (animationplaying == false) && (animstate == animstates.primary)
	{
		animationplaying = true;
		if (spritepumplooping) animationlooping = true; else animationlooping = false;
		animstate = animstates.pump;
		#region Shell
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
		#endregion
		if (soundpump != -1)
		{
			audio_sound_gain(soundpump,random_range(soundpumpgainmin,soundpumpgainmax),0);
			audio_sound_pitch(audio_play_sound(soundpump,5,false),(random_range(soundpumppitchmin,soundpumppitchmax)));
		}
	}
	if (animationplaying == false) && (animstate == animstates.secondary)
	{
		animationplaying = true;
		if (spritepumplooping) animationlooping = true; else animationlooping = false;
		animstate = animstates.pump;
		#region Shell
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
		#endregion
		if (soundpump != -1)
		{
			audio_sound_gain(soundpump,random_range(soundpumpgainmin,soundpumpgainmax),0);
			audio_sound_pitch(audio_play_sound(soundpump,5,false),(random_range(soundpumppitchmin,soundpumppitchmax)));
		}
	}
}

if (oPlayer.wallsliding == 0) || (global.noclip) && (aimsidetype != aimsidetypes.movedirection) 
{
	currentminmaxangle = 360;
	delta = max(-currentminmaxangle, min(currentminmaxangle, angle_difference(pointdir, 0)));
	image_angle += angle_difference(delta, image_angle) * currentrspeed;
}
		
if (aimsidetype == aimsidetypes.movedirection) &&  (oPlayer.wallsliding == 0)
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

if (oPlayer.wallsliding != 0)
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
