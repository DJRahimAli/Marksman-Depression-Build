vsp += grv;

//Horizontal Collision
if (place_meeting(x+hsp,y,oWall) || place_meeting(x+hsp,y,oCollision))
{
	var onepixel = sign(hsp);
	while !(place_meeting(x+onepixel,y,oWall) || place_meeting(x+onepixel,y,oCollision)) x += onepixel;
	hsp = 0;
}
x += hsp;

//Bounce Shell
if (place_meeting(x,y+1,oWall) || place_meeting(x,y+1,oCollision))
{
	if (done)
	{
		hsp = 0;
		image_speed = 0;
		image_index = 7;
	}
	var onepixel = sign(vsp);
	if (!done) vsp -= onepixel*5;
	done = 1;
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
	shelllife -= 4;
	//shelllife--;
	//shellalphalength = 120;
}
else
{*/
	shelllife -= (instance_number(oEnemyShell)/0.5);
//}

image_alpha = shelllife/shellalphalength;