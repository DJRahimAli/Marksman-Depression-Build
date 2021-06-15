var wp_map = weapons[weapon];

x = oPlayer.x;
y = oPlayer.y+8;
direction = point_direction(x,y,mouse_x,mouse_y);

if (image_angle > 90) && (image_angle < 270) image_yscale = -1; else image_yscale = 1;

image_angle = direction;

x += lengthdir_x(wp_map[? "distance"],direction);
y += lengthdir_y(wp_map[? "distance"],direction);

var primaryattack;
if (automatic) primaryattack = global.key_primaryattack_held; else primaryattack = global.key_primaryattack_pressed;

if (primaryattack)
{
	if (currentcd == 0)
	{
		currentcd = wp_map[? "cooldown"];
		currentdelay = wp_map[? "startup"];
	}
}

if (currentdelay == 0) && (wp_map[? "projectile"] != -1)
{
	if (ammo[weapon] != 0)
	{
		image_speed = 1;
		image_index = 1;
		with (oMuzzleFlash)
		{
			image_alpha = 1;
			image_speed = 1;
			image_index = 0;
		}
		with (instance_create_layer(x+lengthdir_x(wp_map[? "projectilelength"],direction),y+lengthdir_y(wp_map[? "projectilelength"],direction),"Projectiles",wp_map[? "projectile"]))
		{
			direction = other.direction + random_range(wp_map[? "spreadmin"],wp_map[? "spreadmax"]);
			image_angle = direction;
			spd = ds_map_find_value(other.weapons[other.weapon],"bulletspeed");
		}
		with (instance_create_layer(x+lengthdir_x(wp_map[? "shellejectlength"],direction),y+lengthdir_y(wp_map[? "shellejectlength"],direction),"Shells",wp_map[? "shell"]))
		{
			hsp -= lengthdir_x(random_range(3,4), other.direction);
			if (other.direction >= 45) && (other.direction <= 135) vsp = random_range(4,5); else vsp = random_range(-4,-5);
			direction = other.direction;
			image_xscale = other.image_yscale;
			image_yscale = other.image_yscale;
		}
		ammo[weapon] -= 1;
		with (oPlayer)
		{
			kickbackx = lengthdir_x(ds_map_find_value(other.weapons[other.weapon],"kickback"), other.direction);
			//kickbacky = lengthdir_y(ds_map_find_value(other.weapons[other.weapon],"kickback"), -other.direction);
		}
		currentrecoil = wp_map[? "recoil"];
	}
}
currentdelay = max(-1,currentdelay-1);
if (currentdelay == -1) currentcd = max(0,currentcd-1);
currentrecoil = max(0,floor(currentrecoil*0.8));
ammo[weapon] = 1;
//depth = oPlayer.depth-1;
