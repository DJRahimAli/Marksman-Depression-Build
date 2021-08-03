x += lengthdir_x(spd,direction);
y += lengthdir_y(spd,direction);

image_xscale = currentprojectilexscale;
if (image_angle > 90) && (image_angle < 270) image_yscale = -currentprojectileyscale; else image_yscale = currentprojectileyscale;

image_angle = direction;

if (place_meeting(x,y,pShootable))
{
	with (instance_place(x,y,pShootable))
	{
		hp -= oWeapon.currentdamage;
		flash = 3;
		hitfrom = other.direction;
	}
	instance_destroy();
}

if (place_meeting(x,y,oBulletWall)) || (life == 0) || (image_alpha < 0) instance_destroy();

if (place_meeting(x,y,oWall))
{
	while (place_meeting(x,y,oWall))
	{
		x -= lengthdir_x(1,direction);
		y -= lengthdir_y(1,direction);
	}
	spd = 0;
	if (currenthitspark != -1) instance_change(currenthitspark,true); else instance_destroy();
	layer_add_instance("ForegroundTiles",id);
	depth += 1;
}

life -= instance_number(oBullet)/12.5;
image_alpha = life/alphalength;
