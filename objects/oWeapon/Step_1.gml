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
			var shellangleoffset = point_direction(0, 0, shellxoffset, -shellyoffset);
			var shelldistanceoffset = point_distance(0, 0, shellxoffset, -shellyoffset);
		}
		if (aimside == 1)
		{
			var shellangleoffset = point_direction(0, 0, shellxoffset, shellyoffset);
			var shelldistanceoffset = point_distance(0, 0, shellxoffset, shellyoffset);
		}
		var shellx = x+lengthdir_x(shelldistanceoffset,image_angle+shellangleoffset);
		var shelly = y+lengthdir_y(shelldistanceoffset,image_angle+shellangleoffset);
		if (shell != -1) repeat(shellamount) with (instance_create_layer(shellx,shelly,"Shells",shell))
		{
			//direction = other.image_angle;
			life = random_range(oWeapon.shelllifemin,oWeapon.shelllifemax);
			alphalength = oWeapon.shellalphalength;
			hsp = lengthdir_x(random_range(oWeapon.shellhspmin,oWeapon.shellhspmax),other.image_angle);
			if (other.image_angle >= 45) && (other.image_angle <= 135) vsp = random_range(-oWeapon.shellvspmin,-oWeapon.shellvspmax); else vsp = random_range(oWeapon.shellvspmin,oWeapon.shellvspmax);
			grv = oWeapon.shellgrv;
			if (direction > 90) && (direction < 270) image_xscale = -oWeapon.shellxscale; else image_xscale = oWeapon.shellxscale;
			image_yscale = oWeapon.shellyscale;
		}
		#endregion
		if (soundpump != -1) audio_sound_pitch(audio_play_sound(soundpump,5,false),(random_range(soundpumppitchmin,soundpumppitchmax)));
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
