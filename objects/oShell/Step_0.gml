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
	vsp -= vsp+5;
	done = 1;
}

if image_alpha < 0 instance_destroy();

if (done)
{
	shelllife-=10;
	shellalphalength = 120;
}
else
{
	shelllife--;
}

image_alpha = shelllife/shellalphalength;