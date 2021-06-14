/*
hsp = 0;
vsp = 0;
grv = 0.3;
*/
my_angle = 0;

switch (pickuptype)
{
	case 1:
	sprite_index = sWeaponPistol;
	image_speed = 0;
	image_index = 0;
	break;
	default: instance_destroy();
}

if (global.hasweapon == true) instance_destroy();
