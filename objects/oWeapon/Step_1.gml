x = oPlayer.x;
y = oPlayer.y+8*oPlayer.size/1;

//Set angle of weapon
if (oPlayer.controller == false)
{
	if (oPlayer.hascontrol)
	{
		image_angle = point_direction(x,y,mouse_x,mouse_y);
	}
}
else
{
	var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	if (oPlayer.hascontrol)
	{
		if (abs(controllerh) > oPlayer.deadzone) || (abs(controllerv) > oPlayer.deadzone)
		{
			controllerangle = point_direction(0,0,controllerh,controllerv)
		}
		image_angle = controllerangle;
	}
}

//Flip weapon and player
if (image_angle > 90) && (image_angle < 270)
{
	oPlayer.facingx = -1;
	image_yscale = oPlayer.facingx*oPlayer.size;
	
	with (oCrosshair) image_yscale = oPlayer.facingx*oPlayer.size;
	
	if (!oWeapon.holstered) 
	{
		with (oPlayer) image_xscale = facingx * size;
	}
}
else
{
	oPlayer.facingx = 1;
	image_yscale = oPlayer.facingx*oPlayer.size;
	
	with (oCrosshair) image_yscale = oPlayer.facingx*oPlayer.size;
	
	if (!oWeapon.holstered) 
	{
		with (oPlayer) image_xscale = facingx*size;
	}
}
image_xscale = oPlayer.size;
with (oCrosshair) image_xscale = oPlayer.size;

if (image_angle > 60) && (image_angle < 120) || (image_angle > 240) && (image_angle < 300)
{
	oPlayer.facingy = 1;
}
else
{
	oPlayer.facingy = -1;
}

firingdelay = firingdelay - 1;
recoil = max(0,recoil -1);

x = x + lengthdir_x(weapondistance*oPlayer.size/1-recoil,image_angle);
y = y + lengthdir_y(weapondistance*oPlayer.size/1-recoil,image_angle);

if (ironsights)
{
	x = x - lengthdir_x(weaponcrouchdistance*oPlayer.size/1,image_angle);
	y = y - lengthdir_y(weaponcrouchdistance*oPlayer.size/1,image_angle);
}

if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall)) || (holstered)
{
	stopshooting = true;
}
else
{
	stopshooting = false;
}

if (holstered) image_alpha = 0;

if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall))
{
	if (!holstered) image_alpha = 0.5;
}
else
{
	if (!holstered) image_alpha = 1;
}

if (oPlayer.controller == false)
{
	if (oPlayer.hascontrol)
	{
		//image_angle = point_direction(x,y,mouse_x,mouse_y);
		if (mouse_check_button(mb_left)) && (firingdelay < 0) && (!stopshooting)
		{
			image_speed = 1;
			image_index = 0;
			recoil = 4;
			firingdelay = 15;
			//ScreenShake(2,10);
			audio_sound_pitch(snd_PistolFire,(choose(0.98,1.0,1.02)));
			audio_play_sound(snd_PistolFire,5,false);
			with (instance_create_layer(x,y,"Shells",oShell))
			{
				direction = other.image_angle;
				image_angle = direction;
				image_xscale = oPlayer.size;
				image_yscale = oPlayer.facingx*oPlayer.size;
			}
			with (instance_create_layer(x,y,"Bullets",oBullet))
			{
				speed = 25;
				if (!oWeapon.ironsights)
				{
					direction = other.image_angle + random_range(-2,3);
				}
				else
				{
					direction = other.image_angle + random_range(-1,2);
				}
				image_angle = direction;
				image_xscale = oPlayer.size;
				image_yscale = oPlayer.facingx*oPlayer.size;
			}
		}
	}
}
else
{
	/*var controllerh = gamepad_axis_value(0,gp_axisrh);
	var controllerv = gamepad_axis_value(0,gp_axisrv);
	if (oPlayer.hascontrol)
	{
		if (abs(controllerh) > oPlayer.deadzone) || (abs(controllerv) > oPlayer.deadzone)
		{
			controllerangle = point_direction(0,0,controllerh,controllerv)
		}
		image_angle = controllerangle;*/
	if (oPlayer.hascontrol)
	{
		if (gamepad_button_check(0,gp_shoulderrb)) && (firingdelay < 0) && (!stopshooting)
		{
			image_speed = 1;
			image_index = 0;
			recoil = 4;
			firingdelay = 15;
			//ScreenShake(2,10);
			audio_sound_pitch(snd_PistolFire,(choose(0.98,1.0,1.02)));
			audio_play_sound(snd_PistolFire,5,false);
			with (instance_create_layer(x,y,"Shells",oShell))
			{
				direction = other.image_angle;
				image_angle = direction;
				image_xscale = oPlayer.size;
				image_yscale = oPlayer.facingx*oPlayer.size;
			}
			with (instance_create_layer(x,y,"Bullets",oBullet))
			{
				speed = 25;
				if (!oWeapon.ironsights)
				{
					direction = other.image_angle + random_range(-2,3);
				}
				else
				{
					direction = other.image_angle + random_range(-1,2);
				}
				image_angle = direction;
				image_xscale = oPlayer.size;
				image_yscale = oPlayer.facingx*oPlayer.size;
			}
		}
	}
}
