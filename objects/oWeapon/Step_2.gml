switch (animstate)
{
	case animstates.idle:
	if (aimside == -1)
	{
		currentsprite = spriteleft;
		oArm.currentsprite = armspriteleft;
	}
	if (aimside == 1)
	{
		currentsprite = spriteright;
		oArm.currentsprite = armspriteright;
	}
	sprite_index = currentsprite;
	image_speed = spritespeed;
	break;
	case animstates.primary:
	if (aimside == -1)
	{
		currentsprite = spriteprimaryleft;
		oArm.currentsprite = armspriteprimaryleft;
	}
	if (aimside == 1)
	{
		currentsprite = spriteprimaryright;
		oArm.currentsprite = armspriteprimaryright;
	}
	sprite_index = currentsprite;
	image_speed = spriteprimaryspeed;
	break;
	case animstates.secondary:
	if (aimside == -1)
	{
		currentsprite = spritesecondaryleft;
		oArm.currentsprite = armspritesecondaryleft;
	}
	if (aimside == 1)
	{
		currentsprite = spritesecondaryright;
		oArm.currentsprite = armspritesecondaryright;
	}
	sprite_index = currentsprite;
	image_speed = spritesecondaryspeed;
	break;
	case animstates.pump:
	if (aimside == -1)
	{
		currentsprite = spritepumpleft;
		oArm.currentsprite = armspritepumpleft;
	}
	if (aimside == 1)
	{
		currentsprite = spritepumpright;
		oArm.currentsprite = armspritepumpright;
	}
	sprite_index = currentsprite;
	image_speed = spritepumpspeed;
	break;
	case animstates.startup: 
	if (aimside == -1)
	{
		currentsprite = spritestartupleft;
		oArm.currentsprite = armspritestartupleft;
	}
	if (aimside == 1)
	{
		currentsprite = spritestartupright;
		oArm.currentsprite = armspritestartupright;
	}
	sprite_index = currentsprite;
	image_speed = spritestartupspeed;
	break;
	case animstates.reload: break;
	case animstates.empty:
	if (aimside == -1)
	{
		currentsprite = spriteemptyleft;
		oArm.currentsprite = armspriteemptyleft;
	}
	if (aimside == 1)
	{
		currentsprite = spriteemptyright;
		oArm.currentsprite = armspriteemptyright;
	}
	sprite_index = currentsprite;
	image_speed = spriteemptyspeed;
	break;
}
