if (image_angle > 90) && (image_angle < 270) currentxoffset = -xoffset; else currentxoffset = xoffset;

x = oPlayer.x+currentxoffset;
y = oPlayer.y+currentyoffset;

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

if (oPlayer.onwall == 0)
{
	minmaxangle = 360;
	delta = max(-minmaxangle, min(minmaxangle, angle_difference(pointdir, 0)));
	image_angle += angle_difference(delta, image_angle) * currentrspeed;
}
		
if (oPlayer.onwall < 0)
{
	minmaxangle = 60;
	delta = max(-minmaxangle, min(minmaxangle, angle_difference(pointdir, 0)));
	image_angle += angle_difference(delta, image_angle) * currentrspeed;
}
	
if (oPlayer.onwall > 0)
{
	minmaxangle = 60;
	delta = max(-minmaxangle, min(minmaxangle, angle_difference(pointdir - 180, 0)));
	image_angle += angle_difference(delta, image_angle - 180) * currentrspeed;
}

if (image_angle > 360) image_angle -= 360;
if (image_angle < 0) image_angle += 360;

//if (image_angle > 90) && (image_angle < 270) image_yscale = -1; else image_yscale = 1;

if (ironsights) currentdistance = lerp(currentdistance, ironsightdistance, ironsightspeed); else currentdistance = distance; //else currentdistance = lerp(currentdistance, distance, ironsightspeed);

x += lengthdir_x(currentdistance-currentrecoil,image_angle);
y += lengthdir_y(currentdistance-currentrecoil,image_angle);

if (place_meeting(x,y,oWall) || place_meeting(x,y,oBulletWall) || place_meeting(x,y,oCollision)) stopattack = true;

if (stopattack) image_alpha = 0.5; else image_alpha = 1;

var primaryattack;
//Firemodes
switch (firemodetype)
{
	case "single": primaryattack = global.key_primaryattack_pressed; break;
	case "automatic": primaryattack = global.key_primaryattack_held; break;
	default: primaryattack = global.key_primaryattack_pressed;
}

if (primaryattack) if (!global.hascontrol || !stopattack) && (currentcd == 0)
{
	currentcd = random_range(cooldownmin,cooldownmax);
	currentdelay = startup;
	
	if (currentprimaryammo[weapon] == 0)
	{
		if (spriteemptylooping) animationlooping = true; else animationlooping = false;
		currentsprite = spriteempty;
		sprite_index = currentsprite;
		image_speed = spriteemptyspeed;
		image_index = 0;
		//set reload key to true here for an autoreload?
		if (soundempty != -1) audio_sound_pitch(audio_play_sound(soundempty,5,false),(random_range(soundemptypitchmin,soundemptypitchmax)));
	}
}

if (currentdelay == 0)
{
	if (currentprimaryammo[weapon] != 0)
	{
		if (spriteprimarylooping) animationlooping = true; else animationlooping = false;
		currentsprite = spriteprimary;
		sprite_index = currentsprite;
		image_speed = spriteprimaryspeed;
		image_index = 0;
		if (ironsights) currentrecoil = random_range(ironsightrecoilmin,ironsightrecoilmax); else currentrecoil = random_range(recoilmin,recoilmax);
		currentkickbackx = lengthdir_x(random_range(kickbackxmin,kickbackxmax), image_angle);
		currentkickbacky = lengthdir_y(random_range(kickbackymin,kickbackymax), image_angle);
		Shake(oCrosshair.currentshakemagnitude,oCrosshair.currentshakelength,oCrosshair);
		//Shake(2,10,oCamera);
		if (soundprimary != -1) audio_sound_pitch(audio_play_sound(soundprimary,5,false),(random_range(soundprimarypitchmin,soundprimarypitchmax)));
		if (muzzleflash) with (oMuzzleflash)
		{
			image_alpha = 1;
			image_speed = oWeapon.muzzleflashspritespeed;
			image_index = 0;
		}
		#region Projectile
		var projectileangleoffset = point_direction(0, 0, projectilexoffset, projectileyoffset);
		var projectiledistanceoffset = point_distance(0, 0, projectilexoffset, projectileyoffset);
		var projectilex = x+lengthdir_x(projectiledistanceoffset,image_angle+projectileangleoffset);
		var projectiley = y+lengthdir_y(projectiledistanceoffset,image_angle+projectileangleoffset);
		if (projectile != -1) repeat(projectileamount) with (instance_create_layer(projectilex,projectiley,"Projectiles",projectile))
		{
			if (oWeapon.ironsights) oWeapon.currentspread = random_range(oWeapon.ironsightspreadmin,oWeapon.ironsightspreadmax); else oWeapon.currentspread = random_range(oWeapon.spreadmin,oWeapon.spreadmax);
			direction = other.image_angle + oWeapon.currentspread;
			image_angle = direction;
			life = random_range(oWeapon.projectilelifemin,oWeapon.projectilelifemax);
			alphalength = oWeapon.projectilealphalength;
			spd = random_range(oWeapon.projectilespeedmin,oWeapon.projectilespeedmax);
			image_xscale = oWeapon.projectilexscale;
			if (image_angle > 90) && (image_angle < 270) image_yscale = -oWeapon.projectileyscale; else image_yscale = oWeapon.projectileyscale;
		}
		#endregion
		#region Shell
		if (shell != -1) repeat(shellamount) with (instance_create_layer(x+lengthdir_x(shelllength,image_angle)+shellxoffset,y+lengthdir_y(shelllength,image_angle)+shellyoffset,"Shells",shell))
		{
			//direction = other.image_angle;
			life = random_range(oWeapon.shelllifemin,oWeapon.shelllifemax);
			alphalength = oWeapon.shellalphalength;
			//hsp = lengthdir_x(random_range(oWeapon.shellhspmin,oWeapon.shellhspmax), direction);
			if (direction > 90) && (direction < 270)
			{
				hsp = -random_range(oWeapon.shellhspmin,oWeapon.shellhspmax);
				image_xscale = -oWeapon.shellxscale;
			}
			else
			{
				hsp = random_range(oWeapon.shellhspmin,oWeapon.shellhspmax);
				image_xscale = oWeapon.shellxscale;
			}
			//if (other.image_angle >= 45) && (other.image_angle <= 135) vsp = random_range(-oWeapon.shellvspmin,-oWeapon.shellvspmax); else vsp = random_range(oWeapon.shellvspmin,oWeapon.shellvspmax);
			vsp = random_range(oWeapon.shellvspmin,oWeapon.shellvspmax);
			grv = oWeapon.shellgrv;
			image_yscale = oWeapon.shellyscale;
		}
		#endregion
		currentprimaryammo[weapon] -= 1;
	}
}

if (currentprimaryammo[weapon] != 0) && (startup != 0) && (currentdelay == startup)
{
	if (spritestartuplooping) animationlooping = true; else animationlooping = false;
	currentsprite = spritestartup;
	sprite_index = currentsprite;
	image_speed = spritestartupspeed;
	image_index = 0;
	if (soundstartup != -1) audio_sound_pitch(audio_play_sound(soundstartup,5,false),(random_range(soundstartuppitchmin,soundstartuppitchmax)));
}

currentdelay = max(-1,currentdelay-1);
if (currentdelay == -1) currentcd = max(0,currentcd-1);
currentrecoil = max(0,currentrecoil*0.8);
//currentrecoil = max(0,floor(currentrecoil*0.8));
//currentprimaryammo[weapon] = 1;//infinite ammo
//depth = oPlayer.depth-1;
