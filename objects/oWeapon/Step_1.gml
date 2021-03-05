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
			firingdelay = 5;
			with (instance_create_layer(x,y,"Bullets",oBullet))
			{
				speed = 25;
				direction = other.image_angle + random_range(-3,3);
				image_angle = direction;
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
			firingdelay = 5;
			with (instance_create_layer(x,y,"Bullets",oBullet))
			{
				speed = 25;
				direction = other.image_angle + random_range(-3,3);
				image_angle = direction;
			}
		}
	}
}

if (place_meeting(x,y,oWall))
{
	stopshooting = 1;
	image_alpha = 0.5;
}
else
{
	stopshooting = 0;
	image_alpha = 1;
}

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
	with (oBullet) image_yscale = -1;
	with (oPlayer)
	{
	image_xscale = -1;
	}
	with (oManager) part_type_scale(particleType_Player_Fade,-1,1);
}
else
{
	image_yscale = 1;
	with (oBullet) image_yscale = 1;
	with (oPlayer)
	{
	image_xscale = 1;
	}
	with (oManager) part_type_scale(particleType_Player_Fade,1,1);
}
