image_speed = 0;
image_index = 0;

instance_create_layer(x,y,"Crosshair",oCrosshair);
instance_create_layer(x,y,"Weapon",oMuzzleflash);

#region Unarmed (0)
var weaponid = 0;
weapons[weaponid] = ds_map_create();
#region Weapon
ds_map_add(weapons[weaponid],"sprite",-1);
ds_map_add(weapons[weaponid],"recoil",0);
ds_map_add(weapons[weaponid],"kickbackx",0);
ds_map_add(weapons[weaponid],"kickbacky",0);
ds_map_add(weapons[weaponid],"damage",0);
ds_map_add(weapons[weaponid],"startup",0);
ds_map_add(weapons[weaponid],"cooldown",0);
ds_map_add(weapons[weaponid],"firemodetype","single");
ds_map_add(weapons[weaponid],"aimsidetype","hsp");
ds_map_add(weapons[weaponid],"distance",0);
ds_map_add(weapons[weaponid],"spreadmin",0);
ds_map_add(weapons[weaponid],"spreadmax",0);
ds_map_add(weapons[weaponid],"ironsight",false);
ds_map_add(weapons[weaponid],"ironsightspeed",0);
ds_map_add(weapons[weaponid],"ironsightdistance",0);
ds_map_add(weapons[weaponid],"ironsightrecoil",0);
ds_map_add(weapons[weaponid],"ironsightspreadmin",0);
ds_map_add(weapons[weaponid],"ironsightspreadmax",0);
#endregion
#region Projectile
ds_map_add(weapons[weaponid],"projectile",-1);//oHitscan);
ds_map_add(weapons[weaponid],"projectilesprite",-1);
ds_map_add(weapons[weaponid],"projectileamount",0);
ds_map_add(weapons[weaponid],"projectilelength",0);
ds_map_add(weapons[weaponid],"projectilelifemin",0);
ds_map_add(weapons[weaponid],"projectilelifemax",0);
ds_map_add(weapons[weaponid],"projectilealphalength",0)
ds_map_add(weapons[weaponid],"projectilespeedmin",0);
ds_map_add(weapons[weaponid],"projectilespeedmax",0);
#endregion
#region Shell
ds_map_add(weapons[weaponid],"shell",-1);
ds_map_add(weapons[weaponid],"shellsprite",-1);
ds_map_add(weapons[weaponid],"shellamount",0);
ds_map_add(weapons[weaponid],"shelllength",0);
ds_map_add(weapons[weaponid],"shelllifemin",0);
ds_map_add(weapons[weaponid],"shelllifemax",0);
ds_map_add(weapons[weaponid],"shellalphalength",0);
ds_map_add(weapons[weaponid],"shellhspmin",0);
ds_map_add(weapons[weaponid],"shellhspmax",0);
ds_map_add(weapons[weaponid],"shellvspmin",0);
ds_map_add(weapons[weaponid],"shellvspmax",0);
ds_map_add(weapons[weaponid],"shellgrv",0);
ds_map_add(weapons[weaponid],"shellbouncehspmin",0);
ds_map_add(weapons[weaponid],"shellbouncehspmax",0);
ds_map_add(weapons[weaponid],"shellbouncevspmin",0);
ds_map_add(weapons[weaponid],"shellbouncevspmax",0);
#endregion
#region Muzzleflash
ds_map_add(weapons[weaponid],"muzzleflashsprite",-1);
ds_map_add(weapons[weaponid],"muzzleflashlength",0);
#endregion
#region Crosshair
ds_map_add(weapons[weaponid],"crosshairsprite",-1);
ds_map_add(weapons[weaponid],"crosshairdistance",0);
ds_map_add(weapons[weaponid],"crosshairshakemagnitude",0);
ds_map_add(weapons[weaponid],"crosshairshakelength",0);
ds_map_add(weapons[weaponid],"crosshairironsightspeed",0);
ds_map_add(weapons[weaponid],"crosshairironsightdistance",0);
ds_map_add(weapons[weaponid],"crosshairironsightshakemagnitude",0);
ds_map_add(weapons[weaponid],"crosshairironsightshakelength",0);
#endregion
#region Sound
ds_map_add(weapons[weaponid],"soundprimary",-1);
ds_map_add(weapons[weaponid],"soundsecondary",-1);
ds_map_add(weapons[weaponid],"soundreload",-1);
ds_map_add(weapons[weaponid],"soundempty",-1);
ds_map_add(weapons[weaponid],"soundprimarypitchmin",1);
ds_map_add(weapons[weaponid],"soundprimarypitchmax",1);
ds_map_add(weapons[weaponid],"soundsecondarypitchmin",1);
ds_map_add(weapons[weaponid],"soundsecondarypitchmax",1);
ds_map_add(weapons[weaponid],"soundreloadpitchmin",1);
ds_map_add(weapons[weaponid],"soundreloadpitchmax",1);
ds_map_add(weapons[weaponid],"soundemptypitchmin",1);
ds_map_add(weapons[weaponid],"soundemptypitchmax",1);
#endregion
#endregion

#region Pistol (1)
var weaponid = 1;
weapons[weaponid] = ds_map_create();
#region Weapon
ds_map_add(weapons[weaponid],"sprite",sWeaponPistol);
ds_map_add(weapons[weaponid],"recoil",4);
ds_map_add(weapons[weaponid],"kickbackx",1.5);
ds_map_add(weapons[weaponid],"kickbacky",-0.5);
ds_map_add(weapons[weaponid],"damage",8);
ds_map_add(weapons[weaponid],"startup",0);
ds_map_add(weapons[weaponid],"cooldown",20);
ds_map_add(weapons[weaponid],"firemodetype","single");
ds_map_add(weapons[weaponid],"aimsidetype","direction");
ds_map_add(weapons[weaponid],"distance",40);
ds_map_add(weapons[weaponid],"spreadmin",-2);
ds_map_add(weapons[weaponid],"spreadmax",3);
ds_map_add(weapons[weaponid],"ironsight",true);
ds_map_add(weapons[weaponid],"ironsightspeed",0.5);
ds_map_add(weapons[weaponid],"ironsightdistance",35);
ds_map_add(weapons[weaponid],"ironsightrecoil",3);
ds_map_add(weapons[weaponid],"ironsightspreadmin",-1);
ds_map_add(weapons[weaponid],"ironsightspreadmax",2);
#endregion
#region Projectile
ds_map_add(weapons[weaponid],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[weaponid],"projectilesprite",sBullet);
ds_map_add(weapons[weaponid],"projectileamount",1);
ds_map_add(weapons[weaponid],"projectilelength",24);
ds_map_add(weapons[weaponid],"projectilelifemin",200);
ds_map_add(weapons[weaponid],"projectilelifemax",200);
ds_map_add(weapons[weaponid],"projectilealphalength",40)
ds_map_add(weapons[weaponid],"projectilespeedmin",20);
ds_map_add(weapons[weaponid],"projectilespeedmax",25);
#endregion
#region Shell
ds_map_add(weapons[weaponid],"shell",oShell);
ds_map_add(weapons[weaponid],"shellsprite",sShell);
ds_map_add(weapons[weaponid],"shellamount",1);
ds_map_add(weapons[weaponid],"shelllength",0);
ds_map_add(weapons[weaponid],"shelllifemin",200);
ds_map_add(weapons[weaponid],"shelllifemax",200);
ds_map_add(weapons[weaponid],"shellalphalength",40);
ds_map_add(weapons[weaponid],"shellhspmin",-3);
ds_map_add(weapons[weaponid],"shellhspmax",-4);
ds_map_add(weapons[weaponid],"shellvspmin",-4);
ds_map_add(weapons[weaponid],"shellvspmax",-5);
ds_map_add(weapons[weaponid],"shellgrv",0.3);
ds_map_add(weapons[weaponid],"shellbouncehspmin",-1);
ds_map_add(weapons[weaponid],"shellbouncehspmax",-4);
ds_map_add(weapons[weaponid],"shellbouncevspmin",-3);
ds_map_add(weapons[weaponid],"shellbouncevspmax",-5);
#endregion
#region Muzzleflash
ds_map_add(weapons[weaponid],"muzzleflashsprite",sMuzzleflash);
ds_map_add(weapons[weaponid],"muzzleflashlength",24);
#endregion
#region Crosshair
ds_map_add(weapons[weaponid],"crosshairsprite",sCrosshair);
ds_map_add(weapons[weaponid],"crosshairdistance",120);
ds_map_add(weapons[weaponid],"crosshairshakemagnitude",2);
ds_map_add(weapons[weaponid],"crosshairshakelength",10);
ds_map_add(weapons[weaponid],"crosshairironsightspeed",0.5);
ds_map_add(weapons[weaponid],"crosshairironsightdistance",125);
ds_map_add(weapons[weaponid],"crosshairironsightshakemagnitude",1);
ds_map_add(weapons[weaponid],"crosshairironsightshakelength",5);
#endregion
#region Sound
ds_map_add(weapons[weaponid],"soundprimary",snd_WeaponPistolPrimary);
ds_map_add(weapons[weaponid],"soundsecondary",-1);
ds_map_add(weapons[weaponid],"soundreload",-1);
ds_map_add(weapons[weaponid],"soundempty",snd_WeaponPistolEmpty);
ds_map_add(weapons[weaponid],"soundprimarypitchmin",0.98);
ds_map_add(weapons[weaponid],"soundprimarypitchmax",1.02);
ds_map_add(weapons[weaponid],"soundsecondarypitchmin",1);
ds_map_add(weapons[weaponid],"soundsecondarypitchmax",1);
ds_map_add(weapons[weaponid],"soundreloadpitchmin",1);
ds_map_add(weapons[weaponid],"soundreloadpitchmax",1);
ds_map_add(weapons[weaponid],"soundemptypitchmin",1);
ds_map_add(weapons[weaponid],"soundemptypitchmax",1);
#endregion
#endregion

#region Submachine Gun (2)
var weaponid = 2;
weapons[weaponid] = ds_map_create();
#region Weapon
ds_map_add(weapons[weaponid],"sprite",sWeaponPistol);
ds_map_add(weapons[weaponid],"recoil",4);
ds_map_add(weapons[weaponid],"kickbackx",1.5);
ds_map_add(weapons[weaponid],"kickbacky",-0.5);
ds_map_add(weapons[weaponid],"damage",8);
ds_map_add(weapons[weaponid],"startup",0);
ds_map_add(weapons[weaponid],"cooldown",20);
ds_map_add(weapons[weaponid],"firemodetype","automatic");
ds_map_add(weapons[weaponid],"aimsidetype","direction");
ds_map_add(weapons[weaponid],"distance",40);
ds_map_add(weapons[weaponid],"spreadmin",-2);
ds_map_add(weapons[weaponid],"spreadmax",3);
ds_map_add(weapons[weaponid],"ironsight",true);
ds_map_add(weapons[weaponid],"ironsightspeed",0.5);
ds_map_add(weapons[weaponid],"ironsightdistance",35);
ds_map_add(weapons[weaponid],"ironsightrecoil",3);
ds_map_add(weapons[weaponid],"ironsightspreadmin",-1);
ds_map_add(weapons[weaponid],"ironsightspreadmax",2);
#endregion
#region Projectile
ds_map_add(weapons[weaponid],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[weaponid],"projectilesprite",sBullet);
ds_map_add(weapons[weaponid],"projectileamount",1);
ds_map_add(weapons[weaponid],"projectilelength",24);
ds_map_add(weapons[weaponid],"projectilelifemin",200);
ds_map_add(weapons[weaponid],"projectilelifemax",200);
ds_map_add(weapons[weaponid],"projectilealphalength",40)
ds_map_add(weapons[weaponid],"projectilespeedmin",20);
ds_map_add(weapons[weaponid],"projectilespeedmax",25);
#endregion
#region Shell
ds_map_add(weapons[weaponid],"shell",oShell);
ds_map_add(weapons[weaponid],"shellsprite",sShell);
ds_map_add(weapons[weaponid],"shellamount",1);
ds_map_add(weapons[weaponid],"shelllength",0);
ds_map_add(weapons[weaponid],"shelllifemin",200);
ds_map_add(weapons[weaponid],"shelllifemax",200);
ds_map_add(weapons[weaponid],"shellalphalength",40);
ds_map_add(weapons[weaponid],"shellhspmin",-3);
ds_map_add(weapons[weaponid],"shellhspmax",-4);
ds_map_add(weapons[weaponid],"shellvspmin",-4);
ds_map_add(weapons[weaponid],"shellvspmax",-5);
ds_map_add(weapons[weaponid],"shellgrv",0.3);
ds_map_add(weapons[weaponid],"shellbouncehspmin",-1);
ds_map_add(weapons[weaponid],"shellbouncehspmax",-4);
ds_map_add(weapons[weaponid],"shellbouncevspmin",-3);
ds_map_add(weapons[weaponid],"shellbouncevspmax",-5);
#endregion
#region Muzzleflash
ds_map_add(weapons[weaponid],"muzzleflashsprite",sMuzzleflash);
ds_map_add(weapons[weaponid],"muzzleflashlength",24);
#endregion
#region Crosshair
ds_map_add(weapons[weaponid],"crosshairsprite",sCrosshair);
ds_map_add(weapons[weaponid],"crosshairdistance",120);
ds_map_add(weapons[weaponid],"crosshairshakemagnitude",2);
ds_map_add(weapons[weaponid],"crosshairshakelength",10);
ds_map_add(weapons[weaponid],"crosshairironsightspeed",0.5);
ds_map_add(weapons[weaponid],"crosshairironsightdistance",125);
ds_map_add(weapons[weaponid],"crosshairironsightshakemagnitude",1);
ds_map_add(weapons[weaponid],"crosshairironsightshakelength",5);
#endregion
#region Sound
ds_map_add(weapons[weaponid],"soundprimary",snd_WeaponPistolPrimary);
ds_map_add(weapons[weaponid],"soundsecondary",-1);
ds_map_add(weapons[weaponid],"soundreload",-1);
ds_map_add(weapons[weaponid],"soundempty",snd_WeaponPistolEmpty);
ds_map_add(weapons[weaponid],"soundprimarypitchmin",0.98);
ds_map_add(weapons[weaponid],"soundprimarypitchmax",1.02);
ds_map_add(weapons[weaponid],"soundsecondarypitchmin",1);
ds_map_add(weapons[weaponid],"soundsecondarypitchmax",1);
ds_map_add(weapons[weaponid],"soundreloadpitchmin",1);
ds_map_add(weapons[weaponid],"soundreloadpitchmax",1);
ds_map_add(weapons[weaponid],"soundemptypitchmin",1);
ds_map_add(weapons[weaponid],"soundemptypitchmax",1);
#endregion
#endregion

pointdir = 0;
mouseangle = 0;
controllerangle = 0;
stopattack = false;
ironsights = false;
delta = 0;
minmaxangle = 60;
rspeed = 0.25; // Max = 1 or else things will glitch the fuck out
currentrspeed = 0;
weapon = 0;
// ammo = -1; is infinite ammo
ammo[array_length(weapons)-1] = 0; // Default ammo
ammo[0] = -1; // Set unarmed ammo

SetWeapon(2);

currentcd = 0;
currentdelay = -1;
currentrecoil = 0;
currentkickbackx = 0;
currentkickbacky = 0;
currentspread = 0;
currentdistance = 0;
currentprimaryammo = 0;
currentsecondaryammo = 0;
