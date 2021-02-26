x = oPlayer.x;
y = oPlayer.y+10;

image_angle = point_direction(x,y,mouse_x,mouse_y);

firingdelay = firingdelay - 1;
recoil = max(0,recoil -1);

if (mouse_check_button_pressed(mb_left)) && (firingdelay < 0) && (!place_meeting(x,y,oWall))
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

if (place_meeting(x,y,oWall))
{
	image_alpha = 0.5;
}
else
{
	image_alpha = 1;
}

x = x - lengthdir_x(recoil,image_angle);
y = y - lengthdir_y(recoil,image_angle);

if (image_angle > 90) && (image_angle < 270)
{
	image_yscale = -1;
	with (oBullet)
	{
	image_yscale = -1;
	}
	with (oPlayer)
	{
	image_xscale = -1;
	}
}
else
{
	image_yscale = 1;
	with (oBullet)
	{
	image_yscale = 1;
	}
	with (oPlayer)
	{
	image_xscale = 1;
	}
}