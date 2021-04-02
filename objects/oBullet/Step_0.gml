if (place_meeting(x,y,pShootable))
{
	with (instance_place(x,y,pShootable))
	{
		hp--;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}

if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall)) || bulletlife == 0 || image_alpha < 0 instance_destroy();

bulletlife--;
image_alpha = bulletlife/bulletalphalength;
