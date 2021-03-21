x = oPlayer.x;
y = oPlayer.y+10;

firingdelay = firingdelay - 1;
recoil = max(0,recoil -1);

if (oPlayer.controller == false)
{
	if (oPlayer.hascontrol)
	{
		image_angle = point_direction(x,y,mouse_x,mouse_y);
		if (mouse_check_button(mb_left)) && (firingdelay < 0) && (!stopshooting)
		{
			recoil = 4;
			firingdelay = 20;
			ScreenShake(2,10);
			audio_sound_pitch(snd_PistolFire,(choose(0.98,1.0,1.02)));
			audio_play_sound(snd_PistolFire,5,false);
			with (instance_create_layer(x,y,"Shells",oShell))
			{
				direction = other.image_angle;
				image_angle = direction;
				if (image_angle > 90) && (image_angle < 270)
				{
					image_yscale = -1;
				}
				else
				{
					image_yscale = 1;
				}
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
				if (image_angle > 90) && (image_angle < 270)
				{
					image_yscale = -1;
				}
				else
				{
					image_yscale = 1;
				}
			}
		}
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
		if (gamepad_button_check(0,gp_shoulderrb)) && (firingdelay < 0) && (!stopshooting)
		{
			recoil = 4;
			firingdelay = 20;
			ScreenShake(2,10);
			audio_sound_pitch(snd_PistolFire,(choose(0.98,1.0,1.02)));
			audio_play_sound(snd_PistolFire,5,false);
			with (instance_create_layer(x,y,"Shells",oShell))
			{
				direction = other.image_angle;
				image_angle = direction;
				if (image_angle > 90) && (image_angle < 270)
				{
					image_yscale = -1;
				}
				else
				{
					image_yscale = 1;
				}
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
				if (image_angle > 90) && (image_angle < 270)
				{
					image_yscale = -1;
				}
				else
				{
					image_yscale = 1;
				}
			}
		}
	}
}

if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall)) || (holstered)
{
	stopshooting = true;
}
else
{
	stopshooting = false;
}

if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall))
{
	if (!holstered) image_alpha = 0.5;
}
else
{
	if (!holstered) image_alpha = 1;
}

if (holstered) image_alpha = 0;

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

if (ironsights)
{
	x = x - lengthdir_x(5,image_angle);
	y = y - lengthdir_y(5,image_angle);
}

if (image_angle > 90) && (image_angle < 270)
{
	facingx = -1;
	image_yscale = -1;
	
	with (oCrosshair) image_yscale = -1;
	
	if (!oWeapon.holstered) 
	{
		with (oPlayer) image_xscale = -1 * size;
	
		with (oParticle) part_type_scale(particleType_Player_Fade,-1*oPlayer.size,oPlayer.size);
	}
}
else
{
	facingx = 1;
	image_yscale = 1;
	
	with (oCrosshair) image_yscale = 1;
	
	if (!oWeapon.holstered) 
	{
		with (oPlayer) image_xscale = 1 * size;
	
		with (oParticle) part_type_scale(particleType_Player_Fade,1*oPlayer.size,oPlayer.size);
	}
}

if (image_angle > 60) && (image_angle < 120) || (image_angle > 240) && (image_angle < 300)
{
	facingy = 1;
}
else
{
	facingy = -1;
}
