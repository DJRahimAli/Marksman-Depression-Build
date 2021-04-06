vsp = vsp + grv;

//Don't walk off edges
if (grounded) && (afraidofheights) && (!place_meeting(x+hsp,y+1,oWall))
{
	hsp = -hsp;
}

/*
if (place_meeting(x,y+1,oWall)) && keyboard_check_pressed(vk_space)
{
	vsp = -7;
}
*/

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = -hsp;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall))
{
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Player Collision
if (place_meeting(x,y,oPlayer))
{
	image_speed = 1;
	sprite_index = sEnemyR;
	attack = true;

	with (oPlayer)
	{
		hurtcountdownrate = 28;
		hurtcountdown--;
		if (hurtcountdown <= 0 )
		{
			hurtcountdown = hurtcountdownrate;
			hp--;
			flash = 3;
		}
	}
}
else
{
	attack = false;
}

//Animation
if (!attack)
{
	if (!place_meeting(x,y+1,oWall))
	{
		grounded = false;
		sprite_index = sAirborne;
		image_speed = 0;
		if (sign(vsp) > 0) image_index = 1; else image_index = 0;
	}
	else
	{
		grounded = true;
		image_speed = 1;
		if (hsp == 0)
		{
			sprite_index = sStanding;
		}
		else
		{
			sprite_index = sRunning;
		}
	}
}

if (hsp !=0)
{
	image_xscale = sign(hsp)*size;
}
else
{
	if (!hasweapon) image_xscale = size;
}
if (instance_exists(oPlayer))
{
	if (hasweapon) && (point_distance(oPlayer.x,oPlayer.y,x,y) < 600 ) image_xscale = oEnemyWeapon.image_yscale*size;
}
image_yscale = size;
