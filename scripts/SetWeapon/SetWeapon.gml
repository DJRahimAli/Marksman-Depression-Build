/// @arg weaponid

function SetWeapon(argument0)
{
	weapon = argument0;
	var wp_map = weapons[weapon];
	#region Weapon
	//sprite = ds_map_find_value(wp_map,"sprite");
	sprite = wp_map[? "sprite"];
	recoil = wp_map[? "recoil"];
	kickbackx = wp_map[? "kickbackx"];
	kickbacky = wp_map[? "kickbacky"];
	damage = wp_map[? "damage"];
	startup = wp_map[? "startup"];
	cooldown = wp_map[? "cooldown"];
	firemodetype = wp_map[? "firemodetype"];
	aimsidetype = wp_map[? "aimsidetype"];
	distance = wp_map[? "distance"];
	spreadmin = wp_map[? "spreadmin"];
	spreadmax = wp_map[? "spreadmax"];
	ironsight = wp_map[? "ironsight"];
	ironsightspeed = wp_map[? "ironsightspeed"];
	ironsightdistance = wp_map[? "ironsightdistance"];
	ironsightrecoil = wp_map[? "ironsightrecoil"];
	ironsightspreadmin = wp_map[? "ironsightspreadmin"];
	ironsightspreadmax = wp_map[? "ironsightspreadmax"];
	#endregion
	#region Projectile
	projectile = wp_map[? "projectile"];
	projectilesprite = wp_map[? "projectilesprite"];
	projectileamount = wp_map[? "projectileamount"];
	projectilelength = wp_map[? "projectilelength"];
	projectilelifemin = wp_map[? "projectilelifemin"];
	projectilelifemax = wp_map[? "projectilelifemax"];
	projectilealphalength = wp_map[? "projectilealphalength"];
	projectilespeedmin = wp_map[? "projectilespeedmin"];
	projectilespeedmax = wp_map[? "projectilespeedmax"];
	#endregion
	#region Shell
	shell = wp_map[? "shell"];
	shellsprite = wp_map[? "shellsprite"];
	shellamount = wp_map[? "shellamount"];
	shelllength = wp_map[? "shelllength"];
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
	muzzleflashsprite = wp_map[? "muzzleflashsprite"];
	muzzleflashlength = wp_map[? "muzzleflashlength"];
	#endregion
	#region Crosshair
	crosshairsprite = wp_map[? "crosshairsprite"];
	crosshairdistance = wp_map[? "crosshairdistance"];
	crosshairshakemagnitude = wp_map[? "crosshairshakemagnitude"];
	crosshairshakelength = wp_map[? "crosshairshakelength"];
	crosshairironsightspeed = wp_map[? "crosshairironsightspeed"];
	crosshairironsightdistance = wp_map[? "crosshairironsightdistance"];
	crosshairironsightshakemagnitude = wp_map[? "crosshairironsightshakemagnitude"];
	crosshairironsightshakelength = wp_map[? "crosshairironsightshakelength"];
	#endregion
	#region Sound
	soundprimary = wp_map[? "soundprimary"];
	soundsecondary = wp_map[? "soundsecondary"];
	soundreload = wp_map[? "soundreload"];
	soundempty = wp_map[? "soundempty"];
	soundprimarypitchmin = wp_map[? "soundprimarypitchmin"];
	soundprimarypitchmax = wp_map[? "soundprimarypitchmax"];
	soundsecondarypitchmin = wp_map[? "soundsecondarypitchmin"];
	soundsecondarypitchmax = wp_map[? "soundsecondarypitchmax"];
	soundreloadpitchmin = wp_map[? "soundreloadpitchmin"];
	soundreloadpitchmax = wp_map[? "soundreloadpitchmax"];
	soundemptypitchmin = wp_map[? "soundemptypitchmin"];
	soundemptypitchmax = wp_map[? "soundemptypitchmax"];
	#endregion
}
