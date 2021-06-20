/// @arg weaponid

function SetWeapon(argument0)
{
	weapon = argument0;
	var wp_map = weapons[weapon];
	#region Weapon
	//sprite = ds_map_find_value(wp_map,"sprite");
	sprite = wp_map[? "sprite"];
	recoil = wp_map[? "recoil"];
	kickback = wp_map[? "kickback"];
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
	projectileamount = wp_map[? "projectileamount"];
	projectilespeed = wp_map[? "projectilespeed"];
	projectilelength = wp_map[? "projectilelength"];
	#endregion
	#region Shell
	shell = wp_map[? "shell"];
	shellamount = wp_map[? "shellamount"];
	shelllength = wp_map[? "shelllength"];
	#endregion
	#region Crosshair
	crosshair = wp_map[? "crosshair"];
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
