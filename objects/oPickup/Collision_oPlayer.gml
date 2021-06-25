with(oWeapon)
{
	SetWeapon(oPickup.pickuptype);
	currentprimaryammo[oPickup.pickuptype] += 20;
}
instance_destroy();
