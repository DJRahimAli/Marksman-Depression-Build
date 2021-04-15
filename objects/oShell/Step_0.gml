vsp = vsp + grv;

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall))
{
	while (!place_meeting(x+sign(hsp),y,oWall))
	{
		x = x + sign(hsp);
	}
	hsp = 0;
}
x = x + hsp;

//Vertical Collision
/*if (place_meeting(x,y+1,oWall)) || (place_meeting(x,y,oBulletWall))
{
	if (vsp > 0)
	{
		done = 1;
		instance_destroy();
	}
}*/

if (place_meeting(x,y+vsp,oWall))
{
	/*if (vsp > 0)
	{
		done = 1;
	}*/
	while (!place_meeting(x,y+sign(vsp),oWall))
	{
		y = y + sign(vsp);
	}
	vsp = 0;
}
y = y + vsp;

//Bounce Shell
if (place_meeting(x,y+1,oWall))
{
	if (done)
	{
		hsp = 0;
		image_speed = 0;
		image_index = 7;
	}
	if (!done) vsp -= vsp+5;
	done = 1;
}

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