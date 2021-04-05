if (hasweapon)
{
	mygun = instance_create_layer(x,y,"Weapon",oEnemyWeapon);
	with (mygun)
	{
		owner = other.id;
	}
}
else mygun = noone;