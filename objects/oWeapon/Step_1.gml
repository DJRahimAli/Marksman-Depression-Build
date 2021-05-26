x = oPlayer.x;
y = oPlayer.y+8;

//Set angle of weapon
if (image_angle > 360) image_angle -= 360;
if (image_angle < 0) image_angle += 360;

if (holstered)
{
	image_angle += angle_difference(270, image_angle) * rspeed/2;
	if (image_angle >= 240) && (image_angle <= 300) image_alpha = 0;
}
else
{
	if (global.controller == 0)
	{
		if (global.hascontrol)
		{
			mouseangle = point_direction(x,y,mouse_x,mouse_y);
			image_angle += angle_difference(mouseangle, image_angle) * rspeed;
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
				controllerangle = point_direction(0,0,controllerh,controllerv)
			}
			image_angle += angle_difference(controllerangle, image_angle) * rspeed;
		}
	}
}

//Flip weapon
if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
}
else
{
	image_yscale = 1;
}

if (firingdelay > -1) firingdelay--;
recoil = max(0,recoil -1);

x = x + lengthdir_x(weapondistance-weaponcrouchdistance-recoil,image_angle);
y = y + lengthdir_y(weapondistance-weaponcrouchdistance-recoil,image_angle);

if (ironsights)
{
	weaponcrouchdistance = lerp(weaponcrouchdistance, weaponcrouchdistancerate, 0.5);
}
else
{
	weaponcrouchdistance = lerp(weaponcrouchdistance, 0, 0.5);
}

if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall)) || (place_meeting(x,y,oCollision)) || (holstered)
{
	stopshooting = true;
}
else
{
	stopshooting = false;
}

if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall)) || (place_meeting(x,y,oCollision))
{
	if (!holstered) image_alpha = 0.5;
}
else
{
	if (!holstered) image_alpha = 1;
}

if (global.hascontrol)
{
	//image_angle = point_direction(x,y,mouse_x,mouse_y);
	if (global.key_primaryattack_held) && (firingdelay < 0) && (!stopshooting)
	{
		image_speed = 1;
		image_index = 1;
		recoil = 4;
		firingdelay = 15;
		//ScreenShake(2,10);
		audio_sound_pitch(snd_PistolFire,(choose(0.98,1.0,1.02)));
		audio_play_sound(snd_PistolFire,5,false);
		with (oMuzzleFlash)
		{
			image_alpha = 1;
			image_speed = 1;
			image_index = 0;
		}
		with (instance_create_layer(x,y,"Bullets",oBullet))
		{
			spd = 25;
			if (other.weaponcrouchdistance == 0)
			{
				direction = other.image_angle + random_range(-2,3);
			}
			if (other.weaponcrouchdistance > 0)
			{
				direction = other.image_angle + random_range(-1,2);
			}
			image_angle = direction;
			image_xscale = other.image_xscale;
			image_yscale = other.image_yscale;
		}
		with (oPlayer)
		{
			kickbackx = lengthdir_x(1.5, other.image_angle-180);
			kickbacky = lengthdir_y(0.5, other.image_angle-180);
		}
		with (instance_create_layer(x,y,"Shells",oShell))
		{
			hsp = lengthdir_x(random_range(3,4), other.image_angle-180);
			if (other.image_angle >= 45) && (other.image_angle <= 135)
			{
				vsp = random_range(4,5);
			}
			else
			{
				vsp = random_range(-4,-5);
			}
			direction = other.image_angle;
			image_xscale = other.image_yscale;
			image_yscale = other.image_yscale;
		}
	}
}
