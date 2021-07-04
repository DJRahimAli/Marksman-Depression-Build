instance_create_layer(x,y,"Crosshair",oCrosshair);
instance_create_layer(x,y,"Weapon",oMuzzleflash);

#region Unarmed (0)
var weaponid = 0;
weapons[weaponid] = ds_map_create();
#region Weapon
ds_map_add(weapons[weaponid],"xoffset",0);
ds_map_add(weapons[weaponid],"yoffset",0);
ds_map_add(weapons[weaponid],"xscale",0);
ds_map_add(weapons[weaponid],"yscale",0);
ds_map_add(weapons[weaponid],"sprite",-1);
ds_map_add(weapons[weaponid],"spriteprimary",-1);
ds_map_add(weapons[weaponid],"spritesecondary",-1);
ds_map_add(weapons[weaponid],"spritestartup",-1);
ds_map_add(weapons[weaponid],"spritereload",-1);
ds_map_add(weapons[weaponid],"spriteempty",-1);
ds_map_add(weapons[weaponid],"spritespeed",0);
ds_map_add(weapons[weaponid],"spriteprimaryspeed",0);
ds_map_add(weapons[weaponid],"spritesecondaryspeed",0);
ds_map_add(weapons[weaponid],"spritestartupspeed",0);
ds_map_add(weapons[weaponid],"spritereloadspeed",0);
ds_map_add(weapons[weaponid],"spriteemptyspeed",0);
ds_map_add(weapons[weaponid],"spritelooping",false);
ds_map_add(weapons[weaponid],"spriteprimarylooping",false);
ds_map_add(weapons[weaponid],"spritesecondarylooping",false);
ds_map_add(weapons[weaponid],"spritestartuplooping",false);
ds_map_add(weapons[weaponid],"spritereloadlooping",false);
ds_map_add(weapons[weaponid],"spriteemptylooping",false);
ds_map_add(weapons[weaponid],"xfollowspeed",1);
ds_map_add(weapons[weaponid],"yfollowspeed",1);
ds_map_add(weapons[weaponid],"recoilmin",0);
ds_map_add(weapons[weaponid],"recoilmax",0);
ds_map_add(weapons[weaponid],"kickbackxmin",0);
ds_map_add(weapons[weaponid],"kickbackxmax",0);
ds_map_add(weapons[weaponid],"kickbackymin",0);
ds_map_add(weapons[weaponid],"kickbackymax",0);
ds_map_add(weapons[weaponid],"damage",0);
ds_map_add(weapons[weaponid],"startup",0);
ds_map_add(weapons[weaponid],"cooldownmin",0);
ds_map_add(weapons[weaponid],"cooldownmax",0);
ds_map_add(weapons[weaponid],"firemodetype","single");
ds_map_add(weapons[weaponid],"aimsidetype","hsp");
ds_map_add(weapons[weaponid],"distance",0);
ds_map_add(weapons[weaponid],"spreadmin",0);
ds_map_add(weapons[weaponid],"spreadmax",0);
ds_map_add(weapons[weaponid],"ironsight",false);
ds_map_add(weapons[weaponid],"ironsightspeed",0);
ds_map_add(weapons[weaponid],"ironsightdistance",0);
ds_map_add(weapons[weaponid],"ironsightrecoilmin",0);
ds_map_add(weapons[weaponid],"ironsightrecoilmax",0);
ds_map_add(weapons[weaponid],"ironsightspreadmin",0);
ds_map_add(weapons[weaponid],"ironsightspreadmax",0);
#endregion
#region Projectile
ds_map_add(weapons[weaponid],"projectile",-1);//oHitscan);
ds_map_add(weapons[weaponid],"projectilexoffset",0);
ds_map_add(weapons[weaponid],"projectileyoffset",0);
ds_map_add(weapons[weaponid],"projectilexscale",0);
ds_map_add(weapons[weaponid],"projectileyscale",0);
ds_map_add(weapons[weaponid],"projectilesprite",-1);
ds_map_add(weapons[weaponid],"projectileamount",0);
ds_map_add(weapons[weaponid],"projectilelifemin",0);
ds_map_add(weapons[weaponid],"projectilelifemax",0);
ds_map_add(weapons[weaponid],"projectilealphalength",0);
ds_map_add(weapons[weaponid],"projectilespeedmin",0);
ds_map_add(weapons[weaponid],"projectilespeedmax",0);
#endregion
#region Shell
ds_map_add(weapons[weaponid],"shell",-1);
ds_map_add(weapons[weaponid],"shellxoffset",0);
ds_map_add(weapons[weaponid],"shellyoffset",0);
ds_map_add(weapons[weaponid],"shellxscale",0);
ds_map_add(weapons[weaponid],"shellyscale",0);
ds_map_add(weapons[weaponid],"shellsprite",-1);
ds_map_add(weapons[weaponid],"shellamount",0);
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
ds_map_add(weapons[weaponid],"muzzleflash",false);
ds_map_add(weapons[weaponid],"muzzleflashxoffset",0);
ds_map_add(weapons[weaponid],"muzzleflashyoffset",0);
ds_map_add(weapons[weaponid],"muzzleflashxscale",0);
ds_map_add(weapons[weaponid],"muzzleflashyscale",0);
ds_map_add(weapons[weaponid],"muzzleflashsprite",-1);
ds_map_add(weapons[weaponid],"muzzleflashspritespeed",0);
ds_map_add(weapons[weaponid],"muzzleflashdistance",0);
#endregion
#region Crosshair
ds_map_add(weapons[weaponid],"crosshairxoffset",0);
ds_map_add(weapons[weaponid],"crosshairyoffset",0);
ds_map_add(weapons[weaponid],"crosshairxscale",0);
ds_map_add(weapons[weaponid],"crosshairyscale",0);
ds_map_add(weapons[weaponid],"crosshairsprite",-1);
ds_map_add(weapons[weaponid],"crosshairdistance",0);
ds_map_add(weapons[weaponid],"crosshairshakemagnitudemin",0);
ds_map_add(weapons[weaponid],"crosshairshakemagnitudemax",0);
ds_map_add(weapons[weaponid],"crosshairshakelengthmin",0);
ds_map_add(weapons[weaponid],"crosshairshakelengthmax",0);
ds_map_add(weapons[weaponid],"crosshairironsightspeed",0);
ds_map_add(weapons[weaponid],"crosshairironsightdistance",0);
ds_map_add(weapons[weaponid],"crosshairironsightshakemagnitudemin",0);
ds_map_add(weapons[weaponid],"crosshairironsightshakemagnitudemax",0);
ds_map_add(weapons[weaponid],"crosshairironsightshakelengthmin",0);
ds_map_add(weapons[weaponid],"crosshairironsightshakelengthmax",0);
#endregion
#region Sound
ds_map_add(weapons[weaponid],"soundprimary",-1);
ds_map_add(weapons[weaponid],"soundsecondary",-1);
ds_map_add(weapons[weaponid],"soundstartup",-1);
ds_map_add(weapons[weaponid],"soundreload",-1);
ds_map_add(weapons[weaponid],"soundempty",-1);
ds_map_add(weapons[weaponid],"soundprimarypitchmin",1);
ds_map_add(weapons[weaponid],"soundprimarypitchmax",1);
ds_map_add(weapons[weaponid],"soundsecondarypitchmin",1);
ds_map_add(weapons[weaponid],"soundsecondarypitchmax",1);
ds_map_add(weapons[weaponid],"soundstartuppitchmin",1);
ds_map_add(weapons[weaponid],"soundstartuppitchmax",1);
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
ds_map_add(weapons[weaponid],"xoffset",-3);
ds_map_add(weapons[weaponid],"yoffset",12);
ds_map_add(weapons[weaponid],"xscale",1.5);
ds_map_add(weapons[weaponid],"yscale",1.5);
ds_map_add(weapons[weaponid],"sprite",sWeaponPistol);
ds_map_add(weapons[weaponid],"spriteprimary",sWeaponPistol);
ds_map_add(weapons[weaponid],"spritesecondary",-1);
ds_map_add(weapons[weaponid],"spritestartup",sWeaponPistolStartup);
ds_map_add(weapons[weaponid],"spritereload",-1);
ds_map_add(weapons[weaponid],"spriteempty",sWeaponPistolEmpty);
ds_map_add(weapons[weaponid],"spritespeed",1);
ds_map_add(weapons[weaponid],"spriteprimaryspeed",1);
ds_map_add(weapons[weaponid],"spritesecondaryspeed",1);
ds_map_add(weapons[weaponid],"spritestartupspeed",1);
ds_map_add(weapons[weaponid],"spritereloadspeed",1);
ds_map_add(weapons[weaponid],"spriteemptyspeed",1);
ds_map_add(weapons[weaponid],"spritelooping",false);
ds_map_add(weapons[weaponid],"spriteprimarylooping",false);
ds_map_add(weapons[weaponid],"spritesecondarylooping",false);
ds_map_add(weapons[weaponid],"spritestartuplooping",true);
ds_map_add(weapons[weaponid],"spritereloadlooping",false);
ds_map_add(weapons[weaponid],"spriteemptylooping",true);
ds_map_add(weapons[weaponid],"xfollowspeed",0.9);
ds_map_add(weapons[weaponid],"yfollowspeed",0.9);
ds_map_add(weapons[weaponid],"recoilmin",1);
ds_map_add(weapons[weaponid],"recoilmax",2);
ds_map_add(weapons[weaponid],"kickbackxmin",-1.0);
ds_map_add(weapons[weaponid],"kickbackxmax",-1.5);
ds_map_add(weapons[weaponid],"kickbackymin",-0.2);
ds_map_add(weapons[weaponid],"kickbackymax",-0.5);
ds_map_add(weapons[weaponid],"damage",8);
ds_map_add(weapons[weaponid],"startup",0);
ds_map_add(weapons[weaponid],"cooldownmin",6);
ds_map_add(weapons[weaponid],"cooldownmax",8);
ds_map_add(weapons[weaponid],"firemodetype","single");
ds_map_add(weapons[weaponid],"aimsidetype","direction");
ds_map_add(weapons[weaponid],"distance",0);
ds_map_add(weapons[weaponid],"spreadmin",-2);
ds_map_add(weapons[weaponid],"spreadmax",3);
ds_map_add(weapons[weaponid],"ironsight",true);
ds_map_add(weapons[weaponid],"ironsightspeed",0.5);
ds_map_add(weapons[weaponid],"ironsightdistance",-1);
ds_map_add(weapons[weaponid],"ironsightrecoilmin",1);
ds_map_add(weapons[weaponid],"ironsightrecoilmax",1);
ds_map_add(weapons[weaponid],"ironsightspreadmin",-1);
ds_map_add(weapons[weaponid],"ironsightspreadmax",2);
#endregion
#region Projectile
ds_map_add(weapons[weaponid],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[weaponid],"projectilexoffset",25);
ds_map_add(weapons[weaponid],"projectileyoffset",-5);
ds_map_add(weapons[weaponid],"projectilexscale",1);
ds_map_add(weapons[weaponid],"projectileyscale",1);
ds_map_add(weapons[weaponid],"projectilesprite",sBullet);
ds_map_add(weapons[weaponid],"projectileamount",1);
ds_map_add(weapons[weaponid],"projectilelifemin",200);
ds_map_add(weapons[weaponid],"projectilelifemax",200);
ds_map_add(weapons[weaponid],"projectilealphalength",40);
ds_map_add(weapons[weaponid],"projectilespeedmin",20);
ds_map_add(weapons[weaponid],"projectilespeedmax",25);
#endregion
#region Shell
ds_map_add(weapons[weaponid],"shell",oShell);
ds_map_add(weapons[weaponid],"shellxoffset",26);
ds_map_add(weapons[weaponid],"shellyoffset",-5);
ds_map_add(weapons[weaponid],"shellxscale",1);
ds_map_add(weapons[weaponid],"shellyscale",1);
ds_map_add(weapons[weaponid],"shellsprite",sShell);
ds_map_add(weapons[weaponid],"shellamount",1);
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
ds_map_add(weapons[weaponid],"muzzleflash",true);
ds_map_add(weapons[weaponid],"muzzleflashxoffset",45);
ds_map_add(weapons[weaponid],"muzzleflashyoffset",-5);
ds_map_add(weapons[weaponid],"muzzleflashxscale",1);
ds_map_add(weapons[weaponid],"muzzleflashyscale",1);
ds_map_add(weapons[weaponid],"muzzleflashsprite",sMuzzleflash);
ds_map_add(weapons[weaponid],"muzzleflashspritespeed",1);
#endregion
#region Crosshair
ds_map_add(weapons[weaponid],"crosshairxoffset",0);
ds_map_add(weapons[weaponid],"crosshairyoffset",10);
ds_map_add(weapons[weaponid],"crosshairxscale",1);
ds_map_add(weapons[weaponid],"crosshairyscale",1);
ds_map_add(weapons[weaponid],"crosshairsprite",sCrosshair);
ds_map_add(weapons[weaponid],"crosshairdistance",120);
ds_map_add(weapons[weaponid],"crosshairshakemagnitudemin",2);
ds_map_add(weapons[weaponid],"crosshairshakemagnitudemax",2);
ds_map_add(weapons[weaponid],"crosshairshakelengthmin",10);
ds_map_add(weapons[weaponid],"crosshairshakelengthmax",10);
ds_map_add(weapons[weaponid],"crosshairironsightspeed",0.5);
ds_map_add(weapons[weaponid],"crosshairironsightdistance",125);
ds_map_add(weapons[weaponid],"crosshairironsightshakemagnitudemin",1);
ds_map_add(weapons[weaponid],"crosshairironsightshakemagnitudemax",1);
ds_map_add(weapons[weaponid],"crosshairironsightshakelengthmin",5);
ds_map_add(weapons[weaponid],"crosshairironsightshakelengthmax",5);
#endregion
#region Sound
ds_map_add(weapons[weaponid],"soundprimary",snd_WeaponPistolPrimary);
ds_map_add(weapons[weaponid],"soundsecondary",-1);
ds_map_add(weapons[weaponid],"soundstartup",snd_PlayerDeath);
ds_map_add(weapons[weaponid],"soundreload",-1);
ds_map_add(weapons[weaponid],"soundempty",snd_WeaponPistolEmpty);
ds_map_add(weapons[weaponid],"soundprimarypitchmin",0.98);
ds_map_add(weapons[weaponid],"soundprimarypitchmax",1.02);
ds_map_add(weapons[weaponid],"soundsecondarypitchmin",1);
ds_map_add(weapons[weaponid],"soundsecondarypitchmax",1);
ds_map_add(weapons[weaponid],"soundstartuppitchmin",1);
ds_map_add(weapons[weaponid],"soundstartuppitchmax",1);
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
ds_map_add(weapons[weaponid],"xoffset",-3);
ds_map_add(weapons[weaponid],"yoffset",12);
ds_map_add(weapons[weaponid],"xscale",1.5);
ds_map_add(weapons[weaponid],"yscale",1.5);
ds_map_add(weapons[weaponid],"sprite",sWeaponPistol);
ds_map_add(weapons[weaponid],"spriteprimary",sWeaponPistol);
ds_map_add(weapons[weaponid],"spritesecondary",-1);
ds_map_add(weapons[weaponid],"spritestartup",sWeaponPistolStartup);
ds_map_add(weapons[weaponid],"spritereload",-1);
ds_map_add(weapons[weaponid],"spriteempty",sWeaponPistolEmpty);
ds_map_add(weapons[weaponid],"spritespeed",1);
ds_map_add(weapons[weaponid],"spriteprimaryspeed",1);
ds_map_add(weapons[weaponid],"spritesecondaryspeed",1);
ds_map_add(weapons[weaponid],"spritestartupspeed",1);
ds_map_add(weapons[weaponid],"spritereloadspeed",1);
ds_map_add(weapons[weaponid],"spriteemptyspeed",1);
ds_map_add(weapons[weaponid],"spritelooping",false);
ds_map_add(weapons[weaponid],"spriteprimarylooping",false);
ds_map_add(weapons[weaponid],"spritesecondarylooping",false);
ds_map_add(weapons[weaponid],"spritestartuplooping",true);
ds_map_add(weapons[weaponid],"spritereloadlooping",false);
ds_map_add(weapons[weaponid],"spriteemptylooping",true);
ds_map_add(weapons[weaponid],"xfollowspeed",0.9);
ds_map_add(weapons[weaponid],"yfollowspeed",0.9);
ds_map_add(weapons[weaponid],"recoilmin",1);
ds_map_add(weapons[weaponid],"recoilmax",2);
ds_map_add(weapons[weaponid],"kickbackxmin",-1.0);
ds_map_add(weapons[weaponid],"kickbackxmax",-1.5);
ds_map_add(weapons[weaponid],"kickbackymin",-0.2);
ds_map_add(weapons[weaponid],"kickbackymax",-0.5);
ds_map_add(weapons[weaponid],"damage",8);
ds_map_add(weapons[weaponid],"startup",0);
ds_map_add(weapons[weaponid],"cooldownmin",6);
ds_map_add(weapons[weaponid],"cooldownmax",8);
ds_map_add(weapons[weaponid],"firemodetype","automatic");
ds_map_add(weapons[weaponid],"aimsidetype","direction");
ds_map_add(weapons[weaponid],"distance",0);
ds_map_add(weapons[weaponid],"spreadmin",-2);
ds_map_add(weapons[weaponid],"spreadmax",3);
ds_map_add(weapons[weaponid],"ironsight",true);
ds_map_add(weapons[weaponid],"ironsightspeed",0.5);
ds_map_add(weapons[weaponid],"ironsightdistance",-1);
ds_map_add(weapons[weaponid],"ironsightrecoilmin",1);
ds_map_add(weapons[weaponid],"ironsightrecoilmax",1);
ds_map_add(weapons[weaponid],"ironsightspreadmin",-1);
ds_map_add(weapons[weaponid],"ironsightspreadmax",2);
#endregion
#region Projectile
ds_map_add(weapons[weaponid],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[weaponid],"projectilexoffset",25);
ds_map_add(weapons[weaponid],"projectileyoffset",-5);
ds_map_add(weapons[weaponid],"projectilexscale",1);
ds_map_add(weapons[weaponid],"projectileyscale",1);
ds_map_add(weapons[weaponid],"projectilesprite",sBullet);
ds_map_add(weapons[weaponid],"projectileamount",1);
ds_map_add(weapons[weaponid],"projectilelifemin",200);
ds_map_add(weapons[weaponid],"projectilelifemax",200);
ds_map_add(weapons[weaponid],"projectilealphalength",40);
ds_map_add(weapons[weaponid],"projectilespeedmin",20);
ds_map_add(weapons[weaponid],"projectilespeedmax",25);
#endregion
#region Shell
ds_map_add(weapons[weaponid],"shell",oShell);
ds_map_add(weapons[weaponid],"shellxoffset",26);
ds_map_add(weapons[weaponid],"shellyoffset",-5);
ds_map_add(weapons[weaponid],"shellxscale",1);
ds_map_add(weapons[weaponid],"shellyscale",1);
ds_map_add(weapons[weaponid],"shellsprite",sShell);
ds_map_add(weapons[weaponid],"shellamount",1);
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
ds_map_add(weapons[weaponid],"muzzleflash",true);
ds_map_add(weapons[weaponid],"muzzleflashxoffset",45);
ds_map_add(weapons[weaponid],"muzzleflashyoffset",-5);
ds_map_add(weapons[weaponid],"muzzleflashxscale",1);
ds_map_add(weapons[weaponid],"muzzleflashyscale",1);
ds_map_add(weapons[weaponid],"muzzleflashsprite",sMuzzleflash);
ds_map_add(weapons[weaponid],"muzzleflashspritespeed",1);
#endregion
#region Crosshair
ds_map_add(weapons[weaponid],"crosshairxoffset",0);
ds_map_add(weapons[weaponid],"crosshairyoffset",10);
ds_map_add(weapons[weaponid],"crosshairxscale",1);
ds_map_add(weapons[weaponid],"crosshairyscale",1);
ds_map_add(weapons[weaponid],"crosshairsprite",sCrosshair);
ds_map_add(weapons[weaponid],"crosshairdistance",120);
ds_map_add(weapons[weaponid],"crosshairshakemagnitudemin",2);
ds_map_add(weapons[weaponid],"crosshairshakemagnitudemax",2);
ds_map_add(weapons[weaponid],"crosshairshakelengthmin",10);
ds_map_add(weapons[weaponid],"crosshairshakelengthmax",10);
ds_map_add(weapons[weaponid],"crosshairironsightspeed",0.5);
ds_map_add(weapons[weaponid],"crosshairironsightdistance",125);
ds_map_add(weapons[weaponid],"crosshairironsightshakemagnitudemin",1);
ds_map_add(weapons[weaponid],"crosshairironsightshakemagnitudemax",1);
ds_map_add(weapons[weaponid],"crosshairironsightshakelengthmin",5);
ds_map_add(weapons[weaponid],"crosshairironsightshakelengthmax",5);
#endregion
#region Sound
ds_map_add(weapons[weaponid],"soundprimary",snd_WeaponPistolPrimary);
ds_map_add(weapons[weaponid],"soundsecondary",-1);
ds_map_add(weapons[weaponid],"soundstartup",snd_PlayerDeath);
ds_map_add(weapons[weaponid],"soundreload",-1);
ds_map_add(weapons[weaponid],"soundempty",snd_WeaponPistolEmpty);
ds_map_add(weapons[weaponid],"soundprimarypitchmin",0.98);
ds_map_add(weapons[weaponid],"soundprimarypitchmax",1.02);
ds_map_add(weapons[weaponid],"soundsecondarypitchmin",1);
ds_map_add(weapons[weaponid],"soundsecondarypitchmax",1);
ds_map_add(weapons[weaponid],"soundstartuppitchmin",1);
ds_map_add(weapons[weaponid],"soundstartuppitchmax",1);
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
switchdelay = 20;
animationlooping = false;

// currentprimaryammo = -1; is infinite ammo
currentprimaryammo[array_length(weapons)-1] = 0; // Default Primary ammo
//currentprimaryammo[0] = -1; // Set unarmed currentprimaryammo
currentsecondaryammo[array_length(weapons)-1] = 0; // Default Secondary ammo

SetWeapon(0);

currentweapon = weapon;
currentxoffset = 0;
currentyoffset = 0;
currentrecoil = 0;
currentkickbackx = 0;
currentkickbacky = 0;
currentspread = 0;
currentdistance = 0;
currentswitchdelay = 0;
