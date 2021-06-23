/* Pickup Types
1 = Weapon Pickup
*/

switch (pickuptype)
{
	case 1:
	if (place_meeting(x,y,oPlayer))
	{
		with(oWeapon)
		{
			SetWeapon(oPickup.weapon);
			/*currentprimary*/ammo[oPickup.weapon] += 18//primaryammo;
			//currentsecondaryammo[oPickup.pickuptype] += secondaryammo;
		}
		instance_destroy();
	}
	break;
	default: instance_destroy();
}
