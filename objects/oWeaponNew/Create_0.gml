image_speed = 0;
image_index = 0;

instance_create_layer(x,y,"Crosshair",oCrosshair);
instance_create_layer(x,y,"Weapon",oMuzzleFlash);

#region //unarmed (0)
weapons[0] = ds_map_create();
ds_map_add(weapons[0],"sprite",-1);
ds_map_add(weapons[0],"recoil",0);
ds_map_add(weapons[0],"kickback",0);
ds_map_add(weapons[0],"damage",0);
ds_map_add(weapons[0],"spreadmin",0);
ds_map_add(weapons[0],"spreadmax",0);
ds_map_add(weapons[0],"projectile",-1);//oHitscan);
ds_map_add(weapons[0],"projectilespeed",0);
ds_map_add(weapons[0],"projectilelength",0);
ds_map_add(weapons[0],"shell",-1);
ds_map_add(weapons[0],"shelllength",0);
ds_map_add(weapons[0],"startup",0);
ds_map_add(weapons[0],"cooldown",0);
ds_map_add(weapons[0],"automatic",false);
ds_map_add(weapons[0],"aimsidetype","hsp");
ds_map_add(weapons[0],"distance",0);
ds_map_add(weapons[0],"ironsight",true);
ds_map_add(weapons[0],"ironsightspeed",0);
ds_map_add(weapons[0],"ironsightdistance",0);
ds_map_add(weapons[0],"ironsightrecoil",0);
ds_map_add(weapons[0],"ironsightspreadmin",0);
ds_map_add(weapons[0],"ironsightspreadmax",0);
ds_map_add(weapons[0],"crosshair",false);
ds_map_add(weapons[0],"crosshairsprite",-1);
ds_map_add(weapons[0],"crosshairdistance",0);
ds_map_add(weapons[0],"crosshairshakemagnitude",0);
ds_map_add(weapons[0],"crosshairshakelength",0);
ds_map_add(weapons[0],"crosshairironsightspeed",0);
ds_map_add(weapons[0],"crosshairironsightdistance",0);
ds_map_add(weapons[0],"crosshairironsightshakemagnitude",0);
ds_map_add(weapons[0],"crosshairironsightshakelength",0);
ds_map_add(weapons[0],"soundprimary",-1);
ds_map_add(weapons[0],"soundsecondary",-1);
ds_map_add(weapons[0],"soundreload",-1);
ds_map_add(weapons[0],"soundempty",-1);
ds_map_add(weapons[0],"soundprimarypitchmin",0.98);
ds_map_add(weapons[0],"soundprimarypitchmax",1.02);
ds_map_add(weapons[0],"soundsecondarypitchmin",1);
ds_map_add(weapons[0],"soundsecondarypitchmax",1);
ds_map_add(weapons[0],"soundreloadpitchmin",1);
ds_map_add(weapons[0],"soundreloadpitchmax",1);
ds_map_add(weapons[0],"soundemptypitchmin",1);
ds_map_add(weapons[0],"soundemptypitchmax",1);
#endregion

#region //pistol (1)
weapons[1] = ds_map_create();
ds_map_add(weapons[1],"sprite",sWeaponPistol);
ds_map_add(weapons[1],"recoil",4);
ds_map_add(weapons[1],"kickback",1.5);
ds_map_add(weapons[1],"damage",8);
ds_map_add(weapons[1],"spreadmin",-2);
ds_map_add(weapons[1],"spreadmax",3);
ds_map_add(weapons[1],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[1],"projectilespeed",25);
ds_map_add(weapons[1],"projectilelength",24);
ds_map_add(weapons[1],"shell",oShell);
ds_map_add(weapons[1],"shelllength",0);
ds_map_add(weapons[1],"startup",0);
ds_map_add(weapons[1],"cooldown",15);
ds_map_add(weapons[1],"automatic",false);
ds_map_add(weapons[1],"aimsidetype","direction");
ds_map_add(weapons[1],"distance",40);
ds_map_add(weapons[1],"ironsight",true);
ds_map_add(weapons[1],"ironsightspeed",0.5);
ds_map_add(weapons[1],"ironsightdistance",35);
ds_map_add(weapons[1],"ironsightrecoil",3);
ds_map_add(weapons[1],"ironsightspreadmin",-1);
ds_map_add(weapons[1],"ironsightspreadmax",2);
ds_map_add(weapons[1],"crosshair",true);
ds_map_add(weapons[1],"crosshairsprite",sCrosshair);
ds_map_add(weapons[1],"crosshairdistance",120);
ds_map_add(weapons[1],"crosshairshakemagnitude",2);
ds_map_add(weapons[1],"crosshairshakelength",10);
ds_map_add(weapons[1],"crosshairironsightspeed",0.5);
ds_map_add(weapons[1],"crosshairironsightdistance",125);
ds_map_add(weapons[1],"crosshairironsightshakemagnitude",1);
ds_map_add(weapons[1],"crosshairironsightshakelength",5);
ds_map_add(weapons[1],"soundprimary",snd_WeaponPistolPrimary);
ds_map_add(weapons[1],"soundsecondary",-1);
ds_map_add(weapons[1],"soundreload",-1);
ds_map_add(weapons[1],"soundempty",snd_WeaponPistolEmpty);
ds_map_add(weapons[1],"soundprimarypitchmin",0.98);
ds_map_add(weapons[1],"soundprimarypitchmax",1.02);
ds_map_add(weapons[1],"soundsecondarypitchmin",1);
ds_map_add(weapons[1],"soundsecondarypitchmax",1);
ds_map_add(weapons[1],"soundreloadpitchmin",1);
ds_map_add(weapons[1],"soundreloadpitchmax",1);
ds_map_add(weapons[1],"soundemptypitchmin",1);
ds_map_add(weapons[1],"soundemptypitchmax",1);
#endregion

#region //submachine gun (2)
weapons[2] = ds_map_create();
ds_map_add(weapons[2],"sprite",sWeaponPistol);
ds_map_add(weapons[2],"recoil",4);
ds_map_add(weapons[2],"kickback",1.5);
ds_map_add(weapons[2],"damage",8);
ds_map_add(weapons[2],"spreadmin",-2);
ds_map_add(weapons[2],"spreadmax",3);
ds_map_add(weapons[2],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[2],"projectilespeed",25);
ds_map_add(weapons[2],"projectilelength",24);
ds_map_add(weapons[2],"shell",oShell);
ds_map_add(weapons[2],"shelllength",0);
ds_map_add(weapons[2],"startup",0);
ds_map_add(weapons[2],"cooldown",15);
ds_map_add(weapons[2],"automatic",true);
ds_map_add(weapons[2],"aimsidetype","direction");
ds_map_add(weapons[2],"distance",40);
ds_map_add(weapons[2],"ironsight",true);
ds_map_add(weapons[2],"ironsightspeed",0.5);
ds_map_add(weapons[2],"ironsightdistance",35);
ds_map_add(weapons[2],"ironsightrecoil",3);
ds_map_add(weapons[2],"ironsightspreadmin",-1);
ds_map_add(weapons[2],"ironsightspreadmax",2);
ds_map_add(weapons[2],"crosshair",true);
ds_map_add(weapons[2],"crosshairsprite",sCrosshair);
ds_map_add(weapons[2],"crosshairdistance",120);
ds_map_add(weapons[2],"crosshairshakemagnitude",2);
ds_map_add(weapons[2],"crosshairshakelength",10);
ds_map_add(weapons[2],"crosshairironsightspeed",0.5);
ds_map_add(weapons[2],"crosshairironsightdistance",125);
ds_map_add(weapons[2],"crosshairironsightshakemagnitude",1);
ds_map_add(weapons[2],"crosshairironsightshakelength",5);
ds_map_add(weapons[2],"soundprimary",snd_WeaponPistolPrimary);
ds_map_add(weapons[2],"soundsecondary",-1);
ds_map_add(weapons[2],"soundreload",-1);
ds_map_add(weapons[2],"soundempty",snd_WeaponPistolEmpty);
ds_map_add(weapons[2],"soundprimarypitchmin",0.98);
ds_map_add(weapons[2],"soundprimarypitchmax",1.02);
ds_map_add(weapons[2],"soundsecondarypitchmin",1);
ds_map_add(weapons[2],"soundsecondarypitchmax",1);
ds_map_add(weapons[2],"soundreloadpitchmin",1);
ds_map_add(weapons[2],"soundreloadpitchmax",1);
ds_map_add(weapons[2],"soundemptypitchmin",1);
ds_map_add(weapons[2],"soundemptypitchmax",1);
#endregion

weapon = 0;
// ammo = -1; is infinite ammo
ammo[array_length(weapons)-1] = 0; // Default ammo
ammo[0] = -1; // Set unarmed ammo
pointdir = 0;
mouseangle = 0;
controllerangle = 0;
stopattack = false;
ironsights = false;
delta = 0;
minmaxangle = 60;
rspeed = 0.25; // Max = 1 or else things will glitch the fuck out
currentrspeed = 0;

SetWeapon(2);

currentcd = 0;
currentdelay = -1;
currentrecoil = 0;
currentspread = 0;
currentdistance = 0;
currentprimaryammo = 0;
currentsecondaryammo = 0;
