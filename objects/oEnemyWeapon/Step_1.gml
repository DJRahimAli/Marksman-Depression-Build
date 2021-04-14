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
			image_yscale = owner.image_xscale;
		}
		else
		{
			image_yscale = owner.image_xscale;
		}
	}
}
else
{
	if (owner.hsp !=0)
	{
		image_angle = point_direction(x,y,x*sign(owner.hsp),y);
		image_yscale = owner.image_xscale;
	}
	else
	{
		image_yscale = owner.image_xscale;
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
						spd = 15;
						direction = other.image_angle + random_range(-2,3);
						image_angle = direction;
						image_xscale = other.owner.image_yscale;
						image_yscale = other.owner.image_yscale;
					}
					with (instance_create_layer(x,y,"Shells",oEnemyShell))
					{
						hsp = lengthdir_x(random_range(3,4), other.image_angle-180);
						if (other.image_angle > 45) && (other.image_angle < 135)
						{
							vsp = random_range(4,5);
						}
						else
						{
							vsp = random_range(-4,-5);
						}
						direction = other.image_angle;
						image_xscale = other.owner.image_yscale;
						image_yscale = other.owner.image_yscale;
					}
				}
			}
		}
	}
}
