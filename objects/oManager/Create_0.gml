global.debug = 0;
global.cheat = 0;
global.fly = 0;

//Particle System (Will Be Removed Soon LOL RIP)
particleSystem = part_system_create();

particleType_Player_Fade = part_type_create();

part_type_size(particleType_Player_Fade,1,1,0,0);

part_type_life(particleType_Player_Fade,5,5);
part_type_alpha3(particleType_Player_Fade,0.3,0.2,0.1)

//window_set_cursor (cr_none)
//cursor_sprite = sCursor;

//Initialize Discord.
#macro DISCORD_APP_ID "815249638462062592"

ready = false;
if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}
