x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);


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

if (place_meeting(x,y,oBulletWall)) || (bulletlife == 0) || (image_alpha < 0) instance_destroy();

if (place_meeting(x,y,oWall))
{
	while (place_meeting(x,y,oWall))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	spd = 0;
	instance_change(oHitSpark,true);
	layer_add_instance("ForegroundTiles",id);
	depth += 1;
}

bulletlife--;
image_alpha = bulletlife/bulletalphalength;
