if (done == 0)
{
	vsp = vsp + grv;

	//Horizontal Collision
	if (place_meeting(x+hsp,y,oWall) || place_meeting(x+hsp,y,oCollision))
	{
		while !(place_meeting(x+sign(hsp),y,oWall) || place_meeting(x+sign(hsp),y,oCollision))
		{
			x = x + sign(hsp);
		}
		hsp = 0;
	}
	x = x + hsp;

	//Vertical Collision
	if (place_meeting(x,y+vsp,oWall) || place_meeting(x,y+vsp,oCollision))
	{
		if (vsp > 0)
		{
			done = 1;
			image_index = 1;
		}
		while !(place_meeting(x,y+sign(vsp),oWall) || place_meeting(x,y+vsp,oCollision))
		{
			y = y + sign(vsp);
		}
		vsp = 0;
	}
	y = y + vsp;
}

if (bodylife == 0) || (image_alpha < 0) instance_destroy();

bodylife -= (instance_number(oEnemyDead)/0.5);
image_alpha = bodylife/bodyalphalength;
