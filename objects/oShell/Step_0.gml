vsp += grv;

//Calculate current status
onground = (place_meeting_ext(x,y+1,[oWall,oCollision]));
onwall = (place_meeting_ext(x+1,y,[oWall,oCollision])) - (place_meeting_ext(x-1,y,[oWall,oCollision]));

//Bounce Shell Horizontal
if (onwall != 0)
{
	if (!donebouncehsp) hsp = random_range(oWeapon.shellbouncehspmin,oWeapon.shellbouncehspmax)*onwall;
	donebouncehsp = 1;
}

//Horizontal Collision
if (place_meeting_ext(x+hsp,y,[oWall,oCollision]))
{
	var onepixel = sign(hsp);
	while (!place_meeting_ext(x+onepixel,y,[oWall,oCollision])) x += onepixel;
	hsp = 0;
}
x += hsp;

//Bounce Shell Vertical
if (onground)
{
	if (!donebouncevsp) vsp = random_range(oWeapon.shellbouncevspmin,oWeapon.shellbouncevspmax);
	if (donebouncevsp)
	{
		hsp = 0;
		image_speed = 0;
		image_index = 7;
	}
	donebouncevsp = 1;
}

//Vertical Collision
/*if (place_meeting_ext(x,y+1,[oWall,oCollision]))
{
	if (vsp > 0)
	{
		done = 1;
		instance_destroy();
	}
}*/

if (place_meeting_ext(x,y+vsp,[oWall,oCollision]))
{
	/*if (vsp > 0)
	{
		done = 1;
	}*/
	var onepixel = sign(vsp);
	while (!place_meeting_ext(x,y+onepixel,[oWall,oCollision])) y += onepixel;
	vsp = 0;
}
y += vsp;

if (life == 0) || (image_alpha < 0) instance_destroy();

/*if (done)
{
	shelllife -= 2;
	//shelllife--;
	//shellalphalength = 120;
}
else
{*/
	life -= (instance_number(oShell) + instance_number(oEnemyShell))/4.5;
//}

image_alpha = life/alphalength;