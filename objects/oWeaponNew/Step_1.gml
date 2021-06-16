x = oPlayer.x;
y = oPlayer.y+8;

//Set angle of weapon
if (global.controller == 0)
{
	if (global.hascontrol)
	{
		mouseangle = point_direction(x,y,mouse_x,mouse_y);
		pointdir = mouseangle;
		//image_angle = clamp(image_angle, 0, 360);
		//image_angle = image_angle mod 360;
	}
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

if (ironsights) currentdistance = lerp(currentdistance, ironsightdistance, 0.5); else currentdistance = lerp(currentdistance, distance, 0.5);

x += lengthdir_x(currentdistance-currentrecoil,image_angle);
y += lengthdir_y(currentdistance-currentrecoil,image_angle);

var primaryattack;
if (automatic) primaryattack = global.key_primaryattack_held; else primaryattack = global.key_primaryattack_pressed;

if (primaryattack)
{
	if (currentcd == 0)
	{
		currentcd = cooldown;
		currentdelay = startup;
	}
}

if (currentdelay == 0) && (projectile != -1)
{
	if (ammo[weapon] != 0)
	{
		image_speed = 1;
		image_index = 1;
		with (oMuzzleFlash)
		{
			image_alpha = 1;
			image_speed = 1;
			image_index = 0;
		}
		with (instance_create_layer(x+lengthdir_x(projectilelength,image_angle),y+lengthdir_y(projectilelength,image_angle),"Projectiles",projectile))
		{
			if (oWeaponNew.ironsights) oWeaponNew.currentspread = random_range(oWeaponNew.ironsightspreadmin,oWeaponNew.ironsightspreadmax); else oWeaponNew.currentspread = random_range(oWeaponNew.spreadmin,oWeaponNew.spreadmax);
			direction = other.image_angle + oWeaponNew.currentspread;
			image_angle = direction;
			spd = oWeaponNew.projectilespeed;
		}
		with (instance_create_layer(x+lengthdir_x(shelllength,image_angle),y+lengthdir_y(shelllength,image_angle),"Shells",shell))
		{
			hsp -= lengthdir_x(random_range(3,4), other.image_angle);
			if (other.image_angle >= 45) && (other.image_angle <= 135) vsp = random_range(4,5); else vsp = random_range(-4,-5);
			direction = other.image_angle;
			image_xscale = other.image_yscale;
			image_yscale = other.image_yscale;
		}
		ammo[weapon] -= 1;
		with (oPlayer)
		{
			kickbackx = lengthdir_x(ds_map_find_value(other.weapons[other.weapon],"kickback"), other.image_angle);
			//kickbacky = lengthdir_y(ds_map_find_value(other.weapons[other.weapon],"kickback"), -other.image_angle);
		}
		CrosshairShake(crosshairshakemagnitude,crosshairshakelength);
		//ScreenShake(2,10);
		currentrecoil = recoil;
	}
}
currentdelay = max(-1,currentdelay-1);
if (currentdelay == -1) currentcd = max(0,currentcd-1);
currentrecoil = max(0,floor(currentrecoil*0.8));
ammo[weapon] = 1;
//depth = oPlayer.depth-1;
