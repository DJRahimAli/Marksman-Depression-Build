/// @arg weaponid

function SetWeapon(argument0)
{
	weapon = argument0;
	var wp_map = weapons[weapon];
	#region Weapon
	//sprite = ds_map_find_value(wp_map,"sprite");
	xoffset = wp_map[? "xoffset"];
	yoffset = wp_map[? "yoffset"];
	xscale = wp_map[? "xscale"];
	yscale = wp_map[? "yscale"];
	sprite = wp_map[? "sprite"];
	spriteprimary = wp_map[? "spriteprimary"];
	spritesecondary = wp_map[? "spritesecondary"];
	spritestartup = wp_map[? "spritestartup"];
	spritereload = wp_map[? "spritereload"];
	spriteempty = wp_map[? "spriteempty"];
	spritespeed = wp_map[? "spritespeed"];
	spriteprimaryspeed = wp_map[? "spriteprimaryspeed"];
	spritesecondaryspeed = wp_map[? "spritesecondaryspeed"];
	spritestartupspeed = wp_map[? "spritestartupspeed"];
	spritereloadspeed = wp_map[? "spritereloadspeed"];
	spriteemptyspeed = wp_map[? "spriteemptyspeed"];
	spritelooping = wp_map[? "spritelooping"];
	spriteprimarylooping = wp_map[? "spriteprimarylooping"];
	spritesecondarylooping = wp_map[? "spritesecondarylooping"];
	spritestartuplooping = wp_map[? "spritestartuplooping"];
	spritereloadlooping = wp_map[? "spritereloadlooping"];
	spriteemptylooping = wp_map[? "spriteemptylooping"];
	xfollowspeed = wp_map[? "xfollowspeed"];
	yfollowspeed = wp_map[? "yfollowspeed"];
	recoilmin = wp_map[? "recoilmin"];
	recoilmax = wp_map[? "recoilmax"];
	kickbackxmin = wp_map[? "kickbackxmin"];
	kickbackxmax = wp_map[? "kickbackxmax"];
	kickbackymin = wp_map[? "kickbackymin"];
	kickbackymax = wp_map[? "kickbackymax"];
	damage = wp_map[? "damage"];
	switchdelay = wp_map[? "switchdelay"];
	startup = wp_map[? "startup"];
	cooldownmin = wp_map[? "cooldownmin"];
	cooldownmax = wp_map[? "cooldownmax"];
	firemodetype = wp_map[? "firemodetype"];
	aimsidetype = wp_map[? "aimsidetype"];
	distance = wp_map[? "distance"];
	spreadmin = wp_map[? "spreadmin"];
	spreadmax = wp_map[? "spreadmax"];
	ironsightspeed = wp_map[? "ironsightspeed"];
	ironsightdistance = wp_map[? "ironsightdistance"];
	ironsightrecoilmin = wp_map[? "ironsightrecoilmin"];
	ironsightrecoilmax = wp_map[? "ironsightrecoilmax"];
	ironsightspreadmin = wp_map[? "ironsightspreadmin"];
	ironsightspreadmax = wp_map[? "ironsightspreadmax"];
	#endregion
	#region Projectile
	projectile = wp_map[? "projectile"];
	projectilexoffset = wp_map[? "projectilexoffset"];
	projectileyoffset = wp_map[? "projectileyoffset"];
	projectilexscale = wp_map[? "projectilexscale"];
	projectileyscale = wp_map[? "projectileyscale"];
	projectilesprite = wp_map[? "projectilesprite"];
	projectileamount = wp_map[? "projectileamount"];
	projectilelifemin = wp_map[? "projectilelifemin"];
	projectilelifemax = wp_map[? "projectilelifemax"];
	projectilealphalength = wp_map[? "projectilealphalength"];
	projectilespeedmin = wp_map[? "projectilespeedmin"];
	projectilespeedmax = wp_map[? "projectilespeedmax"];
	#endregion
	#region Shell
	shell = wp_map[? "shell"];
	shellxoffset = wp_map[? "shellxoffset"];
	shellyoffset = wp_map[? "shellyoffset"];
	shellxscale = wp_map[? "shellxscale"];
	shellyscale = wp_map[? "shellyscale"];
	shellsprite = wp_map[? "shellsprite"];
	shellamount = wp_map[? "shellamount"];
	shelllifemin = wp_map[? "shelllifemin"];
	shelllifemax = wp_map[? "shelllifemax"];
	shellalphalength = wp_map[? "shellalphalength"];
	shellhspmin = wp_map[? "shellhspmin"];
	shellhspmax = wp_map[? "shellhspmax"];
	shellvspmin = wp_map[? "shellvspmin"];
	shellvspmax = wp_map[? "shellvspmax"];
	shellgrv = wp_map[? "shellgrv"];
	shellbouncehspmin = wp_map[? "shellbouncehspmin"];
	shellbouncehspmax = wp_map[? "shellbouncehspmax"];
	shellbouncevspmin = wp_map[? "shellbouncevspmin"];
	shellbouncevspmax = wp_map[? "shellbouncevspmax"];
	#endregion
	#region Muzzleflash
	muzzleflash = wp_map[? "muzzleflash"];
	muzzleflashxoffset = wp_map[? "muzzleflashxoffset"];
	muzzleflashyoffset = wp_map[? "muzzleflashyoffset"];
	muzzleflashxscale = wp_map[? "muzzleflashxscale"];
	muzzleflashyscale = wp_map[? "muzzleflashyscale"];
	muzzleflashsprite = wp_map[? "muzzleflashsprite"];
	muzzleflashspritespeed = wp_map[? "muzzleflashspritespeed"];
	#endregion
	#region Crosshair
	crosshairxoffset = wp_map[? "crosshairxoffset"];
	crosshairyoffset = wp_map[? "crosshairyoffset"];
	crosshairxscale = wp_map[? "crosshairxscale"];
	crosshairyscale = wp_map[? "crosshairyscale"];
	crosshairsprite = wp_map[? "crosshairsprite"];
	crosshairdistance = wp_map[? "crosshairdistance"];
	crosshairshakemagnitudemin = wp_map[? "crosshairshakemagnitudemin"];
	crosshairshakemagnitudemax = wp_map[? "crosshairshakemagnitudemax"];
	crosshairshakelengthmin = wp_map[? "crosshairshakelengthmin"];
	crosshairshakelengthmax = wp_map[? "crosshairshakelengthmax"];
	crosshairironsightspeed = wp_map[? "crosshairironsightspeed"];
	crosshairironsightdistance = wp_map[? "crosshairironsightdistance"];
	crosshairironsightshakemagnitudemin = wp_map[? "crosshairironsightshakemagnitudemin"];
	crosshairironsightshakemagnitudemax = wp_map[? "crosshairironsightshakemagnitudemax"];
	crosshairironsightshakelengthmin = wp_map[? "crosshairironsightshakelengthmin"];
	crosshairironsightshakelengthmax = wp_map[? "crosshairironsightshakelengthmax"];
	#endregion
	#region Sound
	soundprimary = wp_map[? "soundprimary"];
	soundsecondary = wp_map[? "soundsecondary"];
	soundstartup = wp_map[? "soundstartup"];
	soundreload = wp_map[? "soundreload"];
	soundempty = wp_map[? "soundempty"];
	soundprimarypitchmin = wp_map[? "soundprimarypitchmin"];
	soundprimarypitchmax = wp_map[? "soundprimarypitchmax"];
	soundsecondarypitchmin = wp_map[? "soundsecondarypitchmin"];
	soundsecondarypitchmax = wp_map[? "soundsecondarypitchmax"];
	soundstartuppitchmin = wp_map[? "soundstartuppitchmin"];
	soundstartuppitchmax = wp_map[? "soundstartuppitchmax"];
	soundreloadpitchmin = wp_map[? "soundreloadpitchmin"];
	soundreloadpitchmax = wp_map[? "soundreloadpitchmax"];
	soundemptypitchmin = wp_map[? "soundemptypitchmin"];
	soundemptypitchmax = wp_map[? "soundemptypitchmax"];
	#endregion
	currentcd = 0;
	currentdelay = -1;
	//currentxoffset = xoffset;
	currentyoffset = yoffset;
	currentsprite = sprite;
	image_xscale = xscale;
	image_yscale = yscale;
	sprite_index = currentsprite;
	image_speed = spritespeed;
	image_index = 0;
}
