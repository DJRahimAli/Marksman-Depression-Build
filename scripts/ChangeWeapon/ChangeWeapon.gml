/// @arg weaponid

function ChangeWeapon(argument0)
{
	weapon = argument0;
	var wp_map = weapons[weapon];
	//sprite = ds_map_find_value(wp_map,"sprite");
	sprite = wp_map[? "sprite"];
	recoil = wp_map[? "recoil"];
	kickback = wp_map[? "kickback"];
	damage = wp_map[? "damage"];
	projectile = wp_map[? "projectile"];
	startup = wp_map[? "startup"];
	length = wp_map[? "length"];
	cooldown = wp_map[? "cooldown"];
	bulletspeed = wp_map[? "bulletspeed"];
	automatic = wp_map[? "automatic"];
}
