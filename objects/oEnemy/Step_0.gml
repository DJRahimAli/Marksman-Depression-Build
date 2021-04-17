hp = string_format(hp, 0, 0);
if (hp < 0) hp = 0;

vsp = vsp + grv;

//Don't walk off edges
if (onground) && (afraidofheights) && !(place_meeting(x+hsp,y+1,oWall) || place_meeting(x+hsp,y+1,oCollision))
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
if (place_meeting(x+hsp,y,oWall) || place_meeting(x+hsp,y,oCollision))
{
	while !(place_meeting(x+sign(hsp),y,oWall) || place_meeting(x+sign(hsp),y,oCollision))
	{
		x = x + sign(hsp);
	}
	hsp = -hsp;
}
x = x + hsp;

//Vertical Collision
if (place_meeting(x,y+vsp,oWall) || place_meeting(x,y+vsp,oCollision))
{
	while !(place_meeting(x,y+sign(vsp),oWall) || place_meeting(x,y+sign(vsp),oCollision))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Animation
if !(place_meeting(x,y+1,oWall) || place_meeting(x,y+1,oCollision))
{
	onground = false;
	sprite_index = sAirborne;
	image_speed = 0;
	if (sign(vsp) > 0) image_index = 1; else image_index = 0;
}
else
{
	onground = true;
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

if (hsp !=0)
{
	image_xscale = sign(hsp)*size;
}
else 
{
	image_xscale = sign(image_xscale)*size;
}

if (instance_exists(oPlayer))
{
	if (hasweapon) && (point_distance(oPlayer.x,oPlayer.y,x,y) < 600 ) image_xscale = sign(oPlayer.x - x)*size;
}
image_yscale = size;
