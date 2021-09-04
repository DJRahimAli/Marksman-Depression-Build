if (particletype == particletypes.weapon) || (particletype == particletypes.arm)
{
	if (oWeapon.currentxoffset != oWeapon.lastxoffset) instance_destroy(oParticle);
}

if (particlelife == 0) || (image_alpha <= 0) instance_destroy();

particlelife--;
image_alpha = particlelife/particlealphalength;
