if (place_meeting(x,y,oPlayer))
{
	switch (pickuptype)
	{
		case pickuptypes.pistol:
			with(oWeapon)
			{
				stopattack = true;
				image_speed = 0;
				image_index = 0;
				if (primarymuzzleflash) || (secondarymuzzleflash) with (oMuzzleflash)
				{
					image_alpha = 0;
					image_speed = 0;
					image_index = 0;
					currentxoffset = 0;
					currentyoffset = 0;
					currentsprite = -1;
				}
				SetWeapon(weapontypes.pistol);
				currentswitchdelay = switchdelay;
				currentprimaryammo[weapontypes.pistol] += primaryammo;
				currentprimaryreservedammo[weapontypes.pistol] += primaryreservedammo;
				currentsecondaryammo[weapontypes.pistol] = -1;
			}
			instance_destroy();
		break;
		default: instance_destroy();
	}
}
