/// @desc Equip Gun

switch (pickuptype)
{
	case 1:
	global.hasweapon = true;
	instance_create_layer(oPlayer.x,oPlayer.y,"Weapon",oWeapon);
	break;
}
instance_destroy();
