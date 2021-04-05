x = owner.x;
y = owner.y+8*owner.size/1;

image_xscale = abs(owner.image_xscale);
image_yscale = abs(owner.image_yscale);

if (instance_exists(oPlayer))
{
	if (oPlayer.x < x) image_yscale = -image_yscale;
	if (point_distance(oPlayer.x,oPlayer.y,x,y) < 600 )
	{
		image_angle = point_direction(x,y,oPlayer.x,oPlayer.y);
	}
	else
	{
		if (owner.hsp !=0)
		{
			image_angle = point_direction(x,y,x*sign(owner.hsp),y);
			image_yscale = owner.image_xscale*owner.size;
		}
		else
		{
			image_yscale = owner.image_xscale*owner.size;
		}
	}
}
else
{
	if (owner.hsp !=0)
	{
		image_angle = point_direction(x,y,x*sign(owner.hsp),y);
		image_yscale = owner.image_xscale*owner.size;
	}
	else
	{
		image_yscale = owner.image_xscale*owner.size;
	}
}

recoil = max(0,recoil -1);

x = x + lengthdir_x(weapondistance*owner.size/1-recoil,image_angle);
y = y + lengthdir_y(weapondistance*owner.size/1-recoil,image_angle);

if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall))
{
	stopshooting = true;
}
else
{
	stopshooting = false;
}

if (instance_exists(oPlayer))
{
	if (point_distance(oPlayer.x,oPlayer.y,x,y) < 600 )
	{
		countdown--;
		if (countdown <= 0 )
		{
			if (!collision_line(x,y,oPlayer.x,oPlayer.y,oWall,false,false))
			{
				countdown = countdownrate;
				if (!stopshooting)
				{
					image_speed = 1;
					image_index = 1;
					recoil = 4;
					//ScreenShake(2,10);
					audio_sound_pitch(snd_PistolFire,(choose(0.98,1.0,1.02)));
					audio_play_sound(snd_PistolFire,5,false);
					with (instance_create_layer(x,y,"Bullets",oEnemyBullet))
					{
						spd = 25;
						direction = other.image_angle + random_range(-2,3);
						image_angle = direction;
						image_xscale = other.owner.size;
						image_yscale = other.owner.facingx*other.owner.size;
					}
					with (instance_create_layer(x,y,"Shells",oEnemyShell))
					{
						hsp = random_range(-3,-4) * other.owner.facingx;
						direction = other.image_angle;
						image_angle = direction;
						image_xscale = other.owner.size;
						image_yscale = other.owner.facingx*other.owner.size;
					}
				}
			}
		}
	}
}

if (image_angle > 90) && (image_angle < 270)
{
	owner.facingx = -1;
}
else
{
	owner.facingx = 1;
}
