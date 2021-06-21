x = oPlayer.x;
y = oPlayer.y+8;

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

if (image_angle > 90) && (image_angle < 270) image_yscale = -1; else image_yscale = 1;

if (ironsights) currentdistance = lerp(currentdistance, ironsightdistance, ironsightspeed); else currentdistance = lerp(currentdistance, distance, ironsightspeed);

x += lengthdir_x(currentdistance-currentrecoil,image_angle);
y += lengthdir_y(currentdistance-currentrecoil,image_angle);

if (place_meeting(x,y,oWall) || place_meeting(x,y,oBulletWall) || place_meeting(x,y,oCollision))
{
	stopattack = true;
	image_alpha = 0.5;
}
else
{
	stopattack = false;
	image_alpha = 1;
}

var primaryattack;
//Firemodes
switch (firemodetype)
{
	case "single": primaryattack = global.key_primaryattack_pressed; break;
	case "automatic": primaryattack = global.key_primaryattack_held; break;
	default: primaryattack = global.key_primaryattack_pressed;
}

if (!global.hascontrol) || (stopattack) primaryattack = false;

if (primaryattack) if (currentcd == 0)
{
	currentcd = cooldown;
	currentdelay = startup;
}

if (currentdelay == 0)
{
	if (ammo[weapon] != 0)
	{
		image_speed = 1;
		image_index = 1;
		if (soundprimary != -1) audio_sound_pitch(audio_play_sound(soundprimary,5,false),(random_range(soundprimarypitchmin,soundprimarypitchmax)));
		if (muzzleflash) with (oMuzzleflash)
		{
			image_alpha = 1;
			image_speed = 1;
			image_index = 0;
		}
		if (projectile != -1) repeat(projectileamount) with (instance_create_layer(x+lengthdir_x(projectilelength,image_angle),y+lengthdir_y(projectilelength,image_angle),"Projectiles",projectile))
		{
			if (oWeaponNew.ironsights) oWeaponNew.currentspread = random_range(oWeaponNew.ironsightspreadmin,oWeaponNew.ironsightspreadmax); else oWeaponNew.currentspread = random_range(oWeaponNew.spreadmin,oWeaponNew.spreadmax);
			direction = other.image_angle + oWeaponNew.currentspread;
			image_angle = direction;
			life = random_range(oWeaponNew.projectilelifemin,oWeaponNew.projectilelifemax);
			alphalength = oWeaponNew.projectilealphalength;
			spd = random_range(oWeaponNew.projectilespeedmin,oWeaponNew.projectilespeedmax);
		}
		if (shell != -1) repeat(shellamount) with (instance_create_layer(x+lengthdir_x(shelllength,image_angle),y+lengthdir_y(shelllength,image_angle),"Shells",shell))
		{
			life = random_range(oWeaponNew.shelllifemin,oWeaponNew.shelllifemax);
			alphalength = oWeaponNew.shellalphalength;
			hsp = lengthdir_x(random_range(oWeaponNew.shellhspmin,oWeaponNew.shellhspmax), other.image_angle);
			if (other.image_angle >= 45) && (other.image_angle <= 135) vsp = random_range(-oWeaponNew.shellvspmin,-oWeaponNew.shellvspmax); else vsp = random_range(oWeaponNew.shellvspmin,oWeaponNew.shellvspmax);
			grv = oWeaponNew.shellgrv;
			direction = other.image_angle;
			image_xscale = other.image_yscale;
		}
		currentkickbackx = lengthdir_x(kickbackx, image_angle);
		currentkickbacky = lengthdir_y(kickbacky, image_angle);
		Shake(oCrosshair.currentshakemagnitude,crosshairshakelength,oCrosshair);
		//Shake(2,10,oCamera);
		ammo[weapon] -= 1;
		if (ironsights) currentrecoil = ironsightrecoil; else currentrecoil = recoil;
	}
	
	if (ammo[weapon] == 0)
	{
		//set reload key to true here for an autoreload?
		if (soundempty != -1) audio_sound_pitch(audio_play_sound(soundempty,5,false),(random_range(soundemptypitchmin,soundemptypitchmax)));
	}
}

currentdelay = max(-1,currentdelay-1);
if (currentdelay == -1) currentcd = max(0,currentcd-1);
currentrecoil = max(0,floor(currentrecoil*0.8));
//ammo[weapon] = 1;//infinite ammo
//depth = oPlayer.depth-1;
