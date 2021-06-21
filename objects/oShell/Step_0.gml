vsp += grv;

//Calculate current status
onground = (place_meeting(x,y+1,oWall) || place_meeting(x,y+1,oCollision));
onwall = (place_meeting(x+1,y,oWall) || place_meeting(x+1,y,oCollision)) - (place_meeting(x-1,y,oWall) || place_meeting(x-1,y,oCollision));

//Bounce Shell Horizontal
if (onwall != 0)
{
	if (!donebouncehsp) hsp = random_range(oWeaponNew.shellbouncehspmin,oWeaponNew.shellbouncehspmax)*onwall;
	donebouncehsp = 1;
}

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall) || place_meeting(x+hsp,y,oCollision))
{
	var onepixel = sign(hsp);
	while !(place_meeting(x+onepixel,y,oWall) || place_meeting(x+onepixel,y,oCollision)) x += onepixel;
	hsp = 0;
}
x += hsp;

//Bounce Shell Vertical
if (onground)
{
	if (!donebouncevsp) vsp = random_range(oWeaponNew.shellbouncevspmin,oWeaponNew.shellbouncevspmax);
	if (donebouncevsp)
	{
		hsp = 0;
		image_speed = 0;
		image_index = 7;
	}
	donebouncevsp = 1;
}

//Vertical Collision
/*if (place_meeting(x,y+1,oWall)) || (place_meeting(x,y,oBulletWall))
{
	if (vsp > 0)
	{
		done = 1;
		instance_destroy();
	}
}*/

if (place_meeting(x,y+vsp,oWall) || place_meeting(x,y+vsp,oCollision))
{
	/*if (vsp > 0)
	{
		done = 1;
	}*/
	var onepixel = sign(vsp);
	while !(place_meeting(x,y+onepixel,oWall) || place_meeting(x,y+onepixel,oCollision)) y += onepixel;
	vsp = 0;
}
y += vsp;

if (shelllife == 0) || (image_alpha < 0) instance_destroy();

/*if (done)
{
	shelllife -= 2;
	//shelllife--;
	//shellalphalength = 120;
}
else
{*/
	shelllife -= (instance_number(oShell) + instance_number(oEnemyShell))/4.5;
//}

image_alpha = shelllife/shellalphalength;