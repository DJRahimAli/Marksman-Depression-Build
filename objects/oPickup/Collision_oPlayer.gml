/// @desc Equip Gun

switch (pickuptype)
{
	case 1:
	global.hasweapon = true;
	instance_create_layer(oPlayer.x,oPlayer.y,"Weapon",oWeapon);
	instance_create_layer(oPlayer.x,oPlayer.y,"Weapon",oMuzzleFlash);
	break;
}
instance_destroy();
