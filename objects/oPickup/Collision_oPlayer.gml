with(oWeapon)
{
	SetWeapon(oPickup.pickuptype);
	ammo[oPickup.pickuptype] += 20;
}
instance_destroy();
