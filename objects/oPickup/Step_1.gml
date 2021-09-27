if (place_meeting(x,y,oPlayer))
{
	switch (pickuptype)
	{
		case pickuptypes.pistol:
			with(oWeapon)
			{
				stopattack = 3;
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
				currentsecondaryammo[weapontypes.pistol] += secondaryammo;
				
				currentprimaryammo[weapontypes.pistol] = clamp(currentprimaryammo[weapontypes.pistol],0,primaryammo);
				currentprimaryreservedammo[weapontypes.pistol] = clamp(currentprimaryreservedammo[weapontypes.pistol],0,primaryreservedammo);
				currentsecondaryammo[weapontypes.pistol] = clamp(currentsecondaryammo[weapontypes.pistol],0,secondaryammo);
			}
			instance_destroy();
		break;
		case pickuptypes.shotgun:
			with(oWeapon)
			{
				stopattack = 3;
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
				SetWeapon(weapontypes.shotgun);
				currentswitchdelay = switchdelay;
				
				currentprimaryammo[weapontypes.shotgun] += primaryammo;
				currentprimaryreservedammo[weapontypes.shotgun] += primaryreservedammo;
				currentsecondaryammo[weapontypes.shotgun] += secondaryammo;
				
				currentprimaryammo[weapontypes.shotgun] = clamp(currentprimaryammo[weapontypes.shotgun],0,primaryammo);
				currentprimaryreservedammo[weapontypes.shotgun] = clamp(currentprimaryreservedammo[weapontypes.shotgun],0,primaryreservedammo);
				currentsecondaryammo[weapontypes.shotgun] = clamp(currentsecondaryammo[weapontypes.shotgun],0,secondaryammo);
			}
			instance_destroy();
		break;
		default: instance_destroy();
	}
}
