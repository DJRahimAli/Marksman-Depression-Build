/*
hsp = 0;
vsp = 0;
grv = 0.3;
*/

switch (pickuptype)
{
	case 1:
	sprite_index = sGun;
	image_speed = 0;
	image_index = 2;
	break;
	default: instance_destroy();
}
