/// @arg weaponid

function SetWeapon(argument0)
{
	weapon = argument0;
	var wp_map = weapons[weapon];
	//sprite = ds_map_find_value(wp_map,"sprite");
	sprite = wp_map[? "sprite"];
	recoil = wp_map[? "recoil"];
	kickback = wp_map[? "kickback"];
	damage = wp_map[? "damage"];
	spreadmin = wp_map[? "spreadmin"];
	spreadmax = wp_map[? "spreadmax"];
	projectile = wp_map[? "projectile"];
	projectilespeed = wp_map[? "projectilespeed"];
	projectilelength = wp_map[? "projectilelength"];
	shell = wp_map[? "shell"];
	shelllength = wp_map[? "shelllength"];
	startup = wp_map[? "startup"];
	cooldown = wp_map[? "cooldown"];
	automatic = wp_map[? "automatic"];
	aimsidetype = wp_map[? "aimsidetype"];
	distance = wp_map[? "distance"];
	ironsight = wp_map[? "ironsight"];
	ironsightspeed = wp_map[? "ironsightspeed"];
	ironsightdistance = wp_map[? "ironsightdistance"];
	ironsightrecoil = wp_map[? "ironsightrecoil"];
	ironsightspreadmin = wp_map[? "ironsightspreadmin"];
	ironsightspreadmax = wp_map[? "ironsightspreadmax"];
	crosshair = wp_map[? "crosshair"];
	crosshairsprite = wp_map[? "crosshairsprite"];
	crosshairdistance = wp_map[? "crosshairdistance"];
	crosshairironsightspeed = wp_map[? "crosshairironsightspeed"];
	crosshairironsightdistance = wp_map[? "crosshairironsightdistance"];
	crosshairshakemagnitude = wp_map[? "crosshairshakemagnitude"];
	crosshairshakelength = wp_map[? "crosshairshakelength"];
}
