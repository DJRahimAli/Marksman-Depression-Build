if (particletype == particletypes.weapon) || (particletype == particletypes.arm)
{
	if (!instance_exists(oWeapon) || !instance_exists(oArm)) || (oWeapon.currentxoffset != oWeapon.lastxoffset) instance_destroy();
}

if (particlelife == 0) || (image_alpha <= 0) instance_destroy();

particlelife--;
image_alpha = particlelife/particlealphalength;
