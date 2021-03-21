if (done == 0)
{
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
	if (place_meeting(x,y+vsp,oWall))
	{
		if (vsp > 0)
		{
			done = 1;
			instance_destroy();
		}
	}
	y = y + vsp;
}

if shelllife = 0 instance_destroy();

shelllife--;
image_alpha = shelllife/40;
