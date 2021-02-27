/// @description Initialize Discord.

#macro DISCORD_APP_ID "815249638462062592"

ready = false;
if (!np_initdiscord(DISCORD_APP_ID, true, np_steam_app_id_empty))
{
	show_error("NekoPresence init fail.", true);
}