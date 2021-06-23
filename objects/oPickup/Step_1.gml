if (place_meeting(x,y,oPlayer))
{
	with(oWeapon)
	{
		SetWeapon(oPickup.pickuptype);
		ammo[oPickup.pickuptype] += 20;
	}
	instance_destroy();
}
