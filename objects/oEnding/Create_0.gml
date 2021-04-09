gunsprite = layer_sprite_get_id("TitleAssets","gGun");
layerid = layer_get_id("TitleAssets");
if (global.hasweapon == true)// && (global.kills > 0)
{
	endtext[0] = "hello this game is wip and shizz";
	endtext[1] = "You have Killed " + string(global.kills) + " Enemies.\nFreaking Epic.";
	if (global.kills == 1) endtext[1] = "You have Killed " + string(global.kills) + " Enemy.\nFreaking Epic.";
	if (global.kills == 0) endtext[1] = "You have Killed no Enemies.\nFreaking UnEpic."
	endtext[2] = "\"Quotations in quotations!!!\"\n\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"";
	endtext[3] = "line 4";
	endtext[4] = "line 5";
	endtext[5] = "line 6";
	endtext[6] = "The enf.";
}
else
{
	layer_sprite_destroy(gunsprite);
	endtext[0] = "hello this game is wip and shizz";
	endtext[1] = "You didn't have a Weapon uhmmm cringe????";
	endtext[2] = "\"Quotations in quotations!!!\"\n\"AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA\"";
	endtext[3] = "line 4";
	endtext[4] = "line 5";
	endtext[5] = "line 6";
	endtext[6] = "The enf.";
}

spd = 0.5;
letters = 0;
currentline = 0;
length = string_length(endtext[currentline]);
text = "";
