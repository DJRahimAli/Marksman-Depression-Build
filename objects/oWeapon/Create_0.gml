instance_create_layer(x,y,"Instances",oCrosshair);
instance_create_layer(x,y,"Particles",oMuzzleflash);

enum animstates
{
	idle,
	primary,
	secondary,
	pump,
	startup,
	reload,
	empty
}

enum weapontypes
{
	unarmed,
	pistol,
	smg,
	shotgun
}

enum aimsidetypes
{
	movedirection,
	weapondirection
}

enum firemodetypes
{
	single,
	automatic,
	burstsingle,
	burstautomatic,
	pumpsingle,
	pumpautomatic
}

#region Unarmed (0)
var weapontype = weapontypes.unarmed;
weapons[weapontype] = ds_map_create();
#region Weapon
ds_map_add(weapons[weapontype],"xoffset",0);
ds_map_add(weapons[weapontype],"yoffset",0);
ds_map_add(weapons[weapontype],"xscale",0);
ds_map_add(weapons[weapontype],"yscale",0);
#region Sprites
#region Left Side Sprites
ds_map_add(weapons[weapontype],"spriteleft",-1);
ds_map_add(weapons[weapontype],"spriteprimaryleft",-1);
ds_map_add(weapons[weapontype],"spritesecondaryleft",-1);
ds_map_add(weapons[weapontype],"spritepumpleft",-1);
ds_map_add(weapons[weapontype],"spritestartupleft",-1);
ds_map_add(weapons[weapontype],"spritereloadleft",-1);
ds_map_add(weapons[weapontype],"spriteemptyleft",-1);
#endregion
#region Right Side Sprites
ds_map_add(weapons[weapontype],"spriteright",-1);
ds_map_add(weapons[weapontype],"spriteprimaryright",-1);
ds_map_add(weapons[weapontype],"spritesecondaryright",-1);
ds_map_add(weapons[weapontype],"spritepumpright",-1);
ds_map_add(weapons[weapontype],"spritestartupright",-1);
ds_map_add(weapons[weapontype],"spritereloadright",-1);
ds_map_add(weapons[weapontype],"spriteemptyright",-1);
#endregion
#region Left Side Arm Sprites
ds_map_add(weapons[weapontype],"armspriteleft",-1);
ds_map_add(weapons[weapontype],"armspriteprimaryleft",-1);
ds_map_add(weapons[weapontype],"armspritesecondaryleft",-1);
ds_map_add(weapons[weapontype],"armspritepumpleft",-1);
ds_map_add(weapons[weapontype],"armspritestartupleft",-1);
ds_map_add(weapons[weapontype],"armspritereloadleft",-1);
ds_map_add(weapons[weapontype],"armspriteemptyleft",-1);
#endregion
#region Right Side Arm Sprites
ds_map_add(weapons[weapontype],"armspriteright",-1);
ds_map_add(weapons[weapontype],"armspriteprimaryright",-1);
ds_map_add(weapons[weapontype],"armspritesecondaryright",-1);
ds_map_add(weapons[weapontype],"armspritepumpright",-1);
ds_map_add(weapons[weapontype],"armspritestartupright",-1);
ds_map_add(weapons[weapontype],"armspritereloadright",-1);
ds_map_add(weapons[weapontype],"armspriteemptyright",-1);
#endregion
ds_map_add(weapons[weapontype],"spritespeed",0);
ds_map_add(weapons[weapontype],"spriteprimaryspeed",0);
ds_map_add(weapons[weapontype],"spritesecondaryspeed",0);
ds_map_add(weapons[weapontype],"spritepumpspeed",0);
ds_map_add(weapons[weapontype],"spritestartupspeed",0);
ds_map_add(weapons[weapontype],"spritereloadspeed",0);
ds_map_add(weapons[weapontype],"spriteemptyspeed",0);
ds_map_add(weapons[weapontype],"spriteprimarylooping",false);
ds_map_add(weapons[weapontype],"spritesecondarylooping",false);
ds_map_add(weapons[weapontype],"spritepumplooping",false);
ds_map_add(weapons[weapontype],"spritestartuplooping",false);
ds_map_add(weapons[weapontype],"spritereloadlooping",false);
ds_map_add(weapons[weapontype],"spriteemptylooping",false);
#endregion
ds_map_add(weapons[weapontype],"xfollowspeed",0);
ds_map_add(weapons[weapontype],"yfollowspeed",0);
ds_map_add(weapons[weapontype],"rspeed",0);
ds_map_add(weapons[weapontype],"hspminmaxangle",0);
ds_map_add(weapons[weapontype],"wallminmaxangle",0);
ds_map_add(weapons[weapontype],"recoilmin",0);
ds_map_add(weapons[weapontype],"recoilmax",0);
ds_map_add(weapons[weapontype],"kickbackxmin",0);
ds_map_add(weapons[weapontype],"kickbackxmax",0);
ds_map_add(weapons[weapontype],"kickbackymin",0);
ds_map_add(weapons[weapontype],"kickbackymax",0);
ds_map_add(weapons[weapontype],"damage",0);
ds_map_add(weapons[weapontype],"switchdelay",20);
ds_map_add(weapons[weapontype],"startup",0);
ds_map_add(weapons[weapontype],"cooldownmin",0);
ds_map_add(weapons[weapontype],"cooldownmax",0);
ds_map_add(weapons[weapontype],"firemodetype",firemodetypes.single);
ds_map_add(weapons[weapontype],"aimsidetype",aimsidetypes.movedirection);
ds_map_add(weapons[weapontype],"distance",0);
ds_map_add(weapons[weapontype],"spreadmin",0);
ds_map_add(weapons[weapontype],"spreadmax",0);
ds_map_add(weapons[weapontype],"ironsightspeed",0);
ds_map_add(weapons[weapontype],"ironsightdistance",0);
ds_map_add(weapons[weapontype],"ironsightrecoilmin",0);
ds_map_add(weapons[weapontype],"ironsightrecoilmax",0);
ds_map_add(weapons[weapontype],"ironsightspreadmin",0);
ds_map_add(weapons[weapontype],"ironsightspreadmax",0);
#endregion
#region Projectile
ds_map_add(weapons[weapontype],"projectile",-1);//oHitscan);
ds_map_add(weapons[weapontype],"projectilexoffset",0);
ds_map_add(weapons[weapontype],"projectileyoffset",0);
ds_map_add(weapons[weapontype],"projectilexscale",0);
ds_map_add(weapons[weapontype],"projectileyscale",0);
ds_map_add(weapons[weapontype],"projectilesprite",-1);
ds_map_add(weapons[weapontype],"projectileamount",0);
ds_map_add(weapons[weapontype],"projectilelifemin",0);
ds_map_add(weapons[weapontype],"projectilelifemax",0);
ds_map_add(weapons[weapontype],"projectilealphalength",0);
ds_map_add(weapons[weapontype],"projectilespeedmin",0);
ds_map_add(weapons[weapontype],"projectilespeedmax",0);
#endregion
#region Shell
ds_map_add(weapons[weapontype],"shell",-1);
ds_map_add(weapons[weapontype],"shellxoffset",0);
ds_map_add(weapons[weapontype],"shellyoffset",0);
ds_map_add(weapons[weapontype],"shellxscale",0);
ds_map_add(weapons[weapontype],"shellyscale",0);
ds_map_add(weapons[weapontype],"shellsprite",-1);
ds_map_add(weapons[weapontype],"shellamount",0);
ds_map_add(weapons[weapontype],"shelllifemin",0);
ds_map_add(weapons[weapontype],"shelllifemax",0);
ds_map_add(weapons[weapontype],"shellalphalength",0);
ds_map_add(weapons[weapontype],"shellhspmin",0);
ds_map_add(weapons[weapontype],"shellhspmax",0);
ds_map_add(weapons[weapontype],"shellvspmin",0);
ds_map_add(weapons[weapontype],"shellvspmax",0);
ds_map_add(weapons[weapontype],"shellgrv",0);
ds_map_add(weapons[weapontype],"shellbouncehspmin",0);
ds_map_add(weapons[weapontype],"shellbouncehspmax",0);
ds_map_add(weapons[weapontype],"shellbouncevspmin",0);
ds_map_add(weapons[weapontype],"shellbouncevspmax",0);
#endregion
#region Muzzleflash
ds_map_add(weapons[weapontype],"muzzleflash",false);
ds_map_add(weapons[weapontype],"muzzleflashxoffset",0);
ds_map_add(weapons[weapontype],"muzzleflashyoffset",0);
ds_map_add(weapons[weapontype],"muzzleflashxscale",0);
ds_map_add(weapons[weapontype],"muzzleflashyscale",0);
ds_map_add(weapons[weapontype],"muzzleflashsprite",-1);
ds_map_add(weapons[weapontype],"muzzleflashspritespeed",0);
ds_map_add(weapons[weapontype],"muzzleflashdistance",0);
#endregion
#region Crosshair
ds_map_add(weapons[weapontype],"crosshairxoffset",0);
ds_map_add(weapons[weapontype],"crosshairyoffset",0);
ds_map_add(weapons[weapontype],"crosshairxscale",0);
ds_map_add(weapons[weapontype],"crosshairyscale",0);
ds_map_add(weapons[weapontype],"crosshairsprite",-1);
ds_map_add(weapons[weapontype],"crosshairrspeed",0);
ds_map_add(weapons[weapontype],"crosshairdistance",0);
ds_map_add(weapons[weapontype],"crosshairshakemagnitudemin",0);
ds_map_add(weapons[weapontype],"crosshairshakemagnitudemax",0);
ds_map_add(weapons[weapontype],"crosshairshakelengthmin",0);
ds_map_add(weapons[weapontype],"crosshairshakelengthmax",0);
ds_map_add(weapons[weapontype],"crosshairironsightspeed",0);
ds_map_add(weapons[weapontype],"crosshairironsightdistance",0);
ds_map_add(weapons[weapontype],"crosshairironsightshakemagnitudemin",0);
ds_map_add(weapons[weapontype],"crosshairironsightshakemagnitudemax",0);
ds_map_add(weapons[weapontype],"crosshairironsightshakelengthmin",0);
ds_map_add(weapons[weapontype],"crosshairironsightshakelengthmax",0);
#endregion
#region Sound
ds_map_add(weapons[weapontype],"soundprimary",-1);
ds_map_add(weapons[weapontype],"soundsecondary",-1);
ds_map_add(weapons[weapontype],"soundstartup",-1);
ds_map_add(weapons[weapontype],"soundreload",-1);
ds_map_add(weapons[weapontype],"soundempty",-1);
ds_map_add(weapons[weapontype],"soundprimarypitchmin",1);
ds_map_add(weapons[weapontype],"soundprimarypitchmax",1);
ds_map_add(weapons[weapontype],"soundsecondarypitchmin",1);
ds_map_add(weapons[weapontype],"soundsecondarypitchmax",1);
ds_map_add(weapons[weapontype],"soundstartuppitchmin",1);
ds_map_add(weapons[weapontype],"soundstartuppitchmax",1);
ds_map_add(weapons[weapontype],"soundreloadpitchmin",1);
ds_map_add(weapons[weapontype],"soundreloadpitchmax",1);
ds_map_add(weapons[weapontype],"soundemptypitchmin",1);
ds_map_add(weapons[weapontype],"soundemptypitchmax",1);
#endregion
#endregion

#region Pistol (1)
var weapontype = weapontypes.pistol;
weapons[weapontype] = ds_map_create();
#region Weapon
ds_map_add(weapons[weapontype],"xoffset",-3);
ds_map_add(weapons[weapontype],"yoffset",12);
ds_map_add(weapons[weapontype],"xscale",1.5);
ds_map_add(weapons[weapontype],"yscale",1.5);
#region Sprites
#region Left Side Sprites
ds_map_add(weapons[weapontype],"spriteleft",sWeaponPistolLeft);
ds_map_add(weapons[weapontype],"spriteprimaryleft",sWeaponPistolPrimaryLeft);
ds_map_add(weapons[weapontype],"spritesecondaryleft",-1);
ds_map_add(weapons[weapontype],"spritepumpleft",-1);
ds_map_add(weapons[weapontype],"spritestartupleft",sWeaponPistolStartupLeft);
ds_map_add(weapons[weapontype],"spritereloadleft",-1);
ds_map_add(weapons[weapontype],"spriteemptyleft",sWeaponPistolEmptyLeft);
#endregion
#region Right Side Sprites
ds_map_add(weapons[weapontype],"spriteright",sWeaponPistolRight);
ds_map_add(weapons[weapontype],"spriteprimaryright",sWeaponPistolPrimaryRight);
ds_map_add(weapons[weapontype],"spritesecondaryright",-1);
ds_map_add(weapons[weapontype],"spritepumpright",-1);
ds_map_add(weapons[weapontype],"spritestartupright",sWeaponPistolStartupRight);
ds_map_add(weapons[weapontype],"spritereloadright",-1);
ds_map_add(weapons[weapontype],"spriteemptyright",sWeaponPistolEmptyRight);
#endregion
#region Left Side Arm Sprites
ds_map_add(weapons[weapontype],"armspriteleft",sArmPistolLeft);
ds_map_add(weapons[weapontype],"armspriteprimaryleft",sArmPistolPrimaryLeft);
ds_map_add(weapons[weapontype],"armspritesecondaryleft",-1);
ds_map_add(weapons[weapontype],"armspritepumpleft",-1);
ds_map_add(weapons[weapontype],"armspritestartupleft",sArmPistolLeft);
ds_map_add(weapons[weapontype],"armspritereloadleft",-1);
ds_map_add(weapons[weapontype],"armspriteemptyleft",sArmPistolLeft);
#endregion
#region Right Side Arm Sprites
ds_map_add(weapons[weapontype],"armspriteright",sArmPistolRight);
ds_map_add(weapons[weapontype],"armspriteprimaryright",sArmPistolPrimaryRight);
ds_map_add(weapons[weapontype],"armspritesecondaryright",-1);
ds_map_add(weapons[weapontype],"armspritepumpright",-1);
ds_map_add(weapons[weapontype],"armspritestartupright",sArmPistolRight);
ds_map_add(weapons[weapontype],"armspritereloadright",-1);
ds_map_add(weapons[weapontype],"armspriteemptyright",sArmPistolRight);
#endregion
ds_map_add(weapons[weapontype],"spritespeed",1);
ds_map_add(weapons[weapontype],"spriteprimaryspeed",1);
ds_map_add(weapons[weapontype],"spritesecondaryspeed",1);
ds_map_add(weapons[weapontype],"spritepumpspeed",1);
ds_map_add(weapons[weapontype],"spritestartupspeed",1);
ds_map_add(weapons[weapontype],"spritereloadspeed",1);
ds_map_add(weapons[weapontype],"spriteemptyspeed",1);
ds_map_add(weapons[weapontype],"spriteprimarylooping",false);
ds_map_add(weapons[weapontype],"spritesecondarylooping",false);
ds_map_add(weapons[weapontype],"spritepumplooping",false);
ds_map_add(weapons[weapontype],"spritestartuplooping",true);
ds_map_add(weapons[weapontype],"spritereloadlooping",false);
ds_map_add(weapons[weapontype],"spriteemptylooping",true);
#endregion
ds_map_add(weapons[weapontype],"xfollowspeed",0.9);
ds_map_add(weapons[weapontype],"yfollowspeed",0.9);
ds_map_add(weapons[weapontype],"rspeed",0.25);
ds_map_add(weapons[weapontype],"hspminmaxangle",75);
ds_map_add(weapons[weapontype],"wallminmaxangle",60);
ds_map_add(weapons[weapontype],"recoilmin",0);
ds_map_add(weapons[weapontype],"recoilmax",0);
ds_map_add(weapons[weapontype],"kickbackxmin",-0.2);
ds_map_add(weapons[weapontype],"kickbackxmax",-0.5);
ds_map_add(weapons[weapontype],"kickbackymin",-0.2);
ds_map_add(weapons[weapontype],"kickbackymax",-0.5);
ds_map_add(weapons[weapontype],"damage",8);
ds_map_add(weapons[weapontype],"switchdelay",20);
ds_map_add(weapons[weapontype],"startup",0);
ds_map_add(weapons[weapontype],"cooldownmin",6);
ds_map_add(weapons[weapontype],"cooldownmax",8);
ds_map_add(weapons[weapontype],"firemodetype",firemodetypes.single);
ds_map_add(weapons[weapontype],"aimsidetype",aimsidetypes.weapondirection);
ds_map_add(weapons[weapontype],"distance",0);
ds_map_add(weapons[weapontype],"spreadmin",-2);
ds_map_add(weapons[weapontype],"spreadmax",3);
ds_map_add(weapons[weapontype],"ironsightspeed",0.5);
ds_map_add(weapons[weapontype],"ironsightdistance",-1);
ds_map_add(weapons[weapontype],"ironsightrecoilmin",0);
ds_map_add(weapons[weapontype],"ironsightrecoilmax",0);
ds_map_add(weapons[weapontype],"ironsightspreadmin",-1);
ds_map_add(weapons[weapontype],"ironsightspreadmax",2);
#endregion
#region Projectile
ds_map_add(weapons[weapontype],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[weapontype],"projectilexoffset",25);
ds_map_add(weapons[weapontype],"projectileyoffset",-5.5);
ds_map_add(weapons[weapontype],"projectilexscale",1);
ds_map_add(weapons[weapontype],"projectileyscale",1);
ds_map_add(weapons[weapontype],"projectilesprite",sBullet);
ds_map_add(weapons[weapontype],"projectileamount",1);
ds_map_add(weapons[weapontype],"projectilelifemin",200);
ds_map_add(weapons[weapontype],"projectilelifemax",200);
ds_map_add(weapons[weapontype],"projectilealphalength",40);
ds_map_add(weapons[weapontype],"projectilespeedmin",20);
ds_map_add(weapons[weapontype],"projectilespeedmax",25);
#endregion
#region Shell
ds_map_add(weapons[weapontype],"shell",oShell);
ds_map_add(weapons[weapontype],"shellxoffset",22);
ds_map_add(weapons[weapontype],"shellyoffset",-8);
ds_map_add(weapons[weapontype],"shellxscale",1);
ds_map_add(weapons[weapontype],"shellyscale",1);
ds_map_add(weapons[weapontype],"shellsprite",sShell);
ds_map_add(weapons[weapontype],"shellamount",1);
ds_map_add(weapons[weapontype],"shelllifemin",200);
ds_map_add(weapons[weapontype],"shelllifemax",200);
ds_map_add(weapons[weapontype],"shellalphalength",40);
ds_map_add(weapons[weapontype],"shellhspmin",-3);
ds_map_add(weapons[weapontype],"shellhspmax",-4);
ds_map_add(weapons[weapontype],"shellvspmin",-4);
ds_map_add(weapons[weapontype],"shellvspmax",-5);
ds_map_add(weapons[weapontype],"shellgrv",0.3);
ds_map_add(weapons[weapontype],"shellbouncehspmin",-1);
ds_map_add(weapons[weapontype],"shellbouncehspmax",-4);
ds_map_add(weapons[weapontype],"shellbouncevspmin",-3);
ds_map_add(weapons[weapontype],"shellbouncevspmax",-5);
#endregion
#region Muzzleflash
ds_map_add(weapons[weapontype],"muzzleflash",true);
ds_map_add(weapons[weapontype],"muzzleflashxoffset",42);
ds_map_add(weapons[weapontype],"muzzleflashyoffset",-6);
ds_map_add(weapons[weapontype],"muzzleflashxscale",1);
ds_map_add(weapons[weapontype],"muzzleflashyscale",1);
ds_map_add(weapons[weapontype],"muzzleflashsprite",sMuzzleflashPistol);
ds_map_add(weapons[weapontype],"muzzleflashspritespeed",1);
#endregion
#region Crosshair
ds_map_add(weapons[weapontype],"crosshairxoffset",0);
ds_map_add(weapons[weapontype],"crosshairyoffset",10);
ds_map_add(weapons[weapontype],"crosshairxscale",1);
ds_map_add(weapons[weapontype],"crosshairyscale",1);
ds_map_add(weapons[weapontype],"crosshairsprite",sCrosshair);
ds_map_add(weapons[weapontype],"crosshairrspeed",0.45);
ds_map_add(weapons[weapontype],"crosshairdistance",120);
ds_map_add(weapons[weapontype],"crosshairshakemagnitudemin",2);
ds_map_add(weapons[weapontype],"crosshairshakemagnitudemax",2);
ds_map_add(weapons[weapontype],"crosshairshakelengthmin",10);
ds_map_add(weapons[weapontype],"crosshairshakelengthmax",10);
ds_map_add(weapons[weapontype],"crosshairironsightspeed",0.5);
ds_map_add(weapons[weapontype],"crosshairironsightdistance",125);
ds_map_add(weapons[weapontype],"crosshairironsightshakemagnitudemin",1);
ds_map_add(weapons[weapontype],"crosshairironsightshakemagnitudemax",1);
ds_map_add(weapons[weapontype],"crosshairironsightshakelengthmin",5);
ds_map_add(weapons[weapontype],"crosshairironsightshakelengthmax",5);
#endregion
#region Sound
ds_map_add(weapons[weapontype],"soundprimary",snd_WeaponPistolPrimary);
ds_map_add(weapons[weapontype],"soundsecondary",-1);
ds_map_add(weapons[weapontype],"soundpump",-1);
ds_map_add(weapons[weapontype],"soundstartup",snd_PlayerDeath);
ds_map_add(weapons[weapontype],"soundreload",-1);
ds_map_add(weapons[weapontype],"soundempty",snd_WeaponPistolEmpty);
ds_map_add(weapons[weapontype],"soundprimarypitchmin",0.98);
ds_map_add(weapons[weapontype],"soundprimarypitchmax",1.02);
ds_map_add(weapons[weapontype],"soundsecondarypitchmin",1);
ds_map_add(weapons[weapontype],"soundsecondarypitchmax",1);
ds_map_add(weapons[weapontype],"soundpumppitchmin",1);
ds_map_add(weapons[weapontype],"soundpumppitchmax",1);
ds_map_add(weapons[weapontype],"soundstartuppitchmin",1);
ds_map_add(weapons[weapontype],"soundstartuppitchmax",1);
ds_map_add(weapons[weapontype],"soundreloadpitchmin",1);
ds_map_add(weapons[weapontype],"soundreloadpitchmax",1);
ds_map_add(weapons[weapontype],"soundemptypitchmin",1);
ds_map_add(weapons[weapontype],"soundemptypitchmax",1);
#endregion
#endregion

#region Submachine Gun (2)
var weapontype = weapontypes.smg;
weapons[weapontype] = ds_map_create();
#region Weapon
ds_map_add(weapons[weapontype],"xoffset",-3);
ds_map_add(weapons[weapontype],"yoffset",12);
ds_map_add(weapons[weapontype],"xscale",1.5);
ds_map_add(weapons[weapontype],"yscale",1.5);
#region Sprites
#region Left Side Sprites
ds_map_add(weapons[weapontype],"spriteleft",sWeaponPistolLeft);
ds_map_add(weapons[weapontype],"spriteprimaryleft",sWeaponPistolPrimaryLeft);
ds_map_add(weapons[weapontype],"spritesecondaryleft",-1);
ds_map_add(weapons[weapontype],"spritepumpleft",-1);
ds_map_add(weapons[weapontype],"spritestartupleft",sWeaponPistolStartupLeft);
ds_map_add(weapons[weapontype],"spritereloadleft",-1);
ds_map_add(weapons[weapontype],"spriteemptyleft",sWeaponPistolEmptyLeft);
#endregion
#region Right Side Sprites
ds_map_add(weapons[weapontype],"spriteright",sWeaponPistolRight);
ds_map_add(weapons[weapontype],"spriteprimaryright",sWeaponPistolPrimaryRight);
ds_map_add(weapons[weapontype],"spritesecondaryright",-1);
ds_map_add(weapons[weapontype],"spritepumpright",-1);
ds_map_add(weapons[weapontype],"spritestartupright",sWeaponPistolStartupRight);
ds_map_add(weapons[weapontype],"spritereloadright",-1);
ds_map_add(weapons[weapontype],"spriteemptyright",sWeaponPistolEmptyRight);
#endregion
#region Left Side Arm Sprites
ds_map_add(weapons[weapontype],"armspriteleft",sArmPistolLeft);
ds_map_add(weapons[weapontype],"armspriteprimaryleft",sArmPistolPrimaryLeft);
ds_map_add(weapons[weapontype],"armspritesecondaryleft",-1);
ds_map_add(weapons[weapontype],"armspritepumpleft",-1);
ds_map_add(weapons[weapontype],"armspritestartupleft",sArmPistolLeft);
ds_map_add(weapons[weapontype],"armspritereloadleft",-1);
ds_map_add(weapons[weapontype],"armspriteemptyleft",sArmPistolLeft);
#endregion
#region Right Side Arm Sprites
ds_map_add(weapons[weapontype],"armspriteright",sArmPistolRight);
ds_map_add(weapons[weapontype],"armspriteprimaryright",sArmPistolPrimaryRight);
ds_map_add(weapons[weapontype],"armspritesecondaryright",-1);
ds_map_add(weapons[weapontype],"armspritepumpright",-1);
ds_map_add(weapons[weapontype],"armspritestartupright",sArmPistolRight);
ds_map_add(weapons[weapontype],"armspritereloadright",-1);
ds_map_add(weapons[weapontype],"armspriteemptyright",sArmPistolRight);
#endregion
ds_map_add(weapons[weapontype],"spritespeed",1);
ds_map_add(weapons[weapontype],"spriteprimaryspeed",1);
ds_map_add(weapons[weapontype],"spritesecondaryspeed",1);
ds_map_add(weapons[weapontype],"spritepumpspeed",1);
ds_map_add(weapons[weapontype],"spritestartupspeed",1);
ds_map_add(weapons[weapontype],"spritereloadspeed",1);
ds_map_add(weapons[weapontype],"spriteemptyspeed",1);
ds_map_add(weapons[weapontype],"spriteprimarylooping",false);
ds_map_add(weapons[weapontype],"spritesecondarylooping",false);
ds_map_add(weapons[weapontype],"spritepumplooping",false);
ds_map_add(weapons[weapontype],"spritestartuplooping",true);
ds_map_add(weapons[weapontype],"spritereloadlooping",false);
ds_map_add(weapons[weapontype],"spriteemptylooping",true);
#endregion
ds_map_add(weapons[weapontype],"xfollowspeed",0.9);
ds_map_add(weapons[weapontype],"yfollowspeed",0.9);
ds_map_add(weapons[weapontype],"rspeed",0.25);
ds_map_add(weapons[weapontype],"hspminmaxangle",75);
ds_map_add(weapons[weapontype],"wallminmaxangle",60);
ds_map_add(weapons[weapontype],"recoilmin",0);
ds_map_add(weapons[weapontype],"recoilmax",0);
ds_map_add(weapons[weapontype],"kickbackxmin",-0.2);
ds_map_add(weapons[weapontype],"kickbackxmax",-0.5);
ds_map_add(weapons[weapontype],"kickbackymin",-0.2);
ds_map_add(weapons[weapontype],"kickbackymax",-0.5);
ds_map_add(weapons[weapontype],"damage",8);
ds_map_add(weapons[weapontype],"switchdelay",20);
ds_map_add(weapons[weapontype],"startup",0);
ds_map_add(weapons[weapontype],"cooldownmin",6);
ds_map_add(weapons[weapontype],"cooldownmax",8);
ds_map_add(weapons[weapontype],"firemodetype",firemodetypes.automatic);
ds_map_add(weapons[weapontype],"aimsidetype",aimsidetypes.weapondirection);
ds_map_add(weapons[weapontype],"distance",0);
ds_map_add(weapons[weapontype],"spreadmin",-2);
ds_map_add(weapons[weapontype],"spreadmax",3);
ds_map_add(weapons[weapontype],"ironsightspeed",0.5);
ds_map_add(weapons[weapontype],"ironsightdistance",-1);
ds_map_add(weapons[weapontype],"ironsightrecoilmin",0);
ds_map_add(weapons[weapontype],"ironsightrecoilmax",0);
ds_map_add(weapons[weapontype],"ironsightspreadmin",-1);
ds_map_add(weapons[weapontype],"ironsightspreadmax",2);
#endregion
#region Projectile
ds_map_add(weapons[weapontype],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[weapontype],"projectilexoffset",25);
ds_map_add(weapons[weapontype],"projectileyoffset",-5.5);
ds_map_add(weapons[weapontype],"projectilexscale",1);
ds_map_add(weapons[weapontype],"projectileyscale",1);
ds_map_add(weapons[weapontype],"projectilesprite",sBullet);
ds_map_add(weapons[weapontype],"projectileamount",1);
ds_map_add(weapons[weapontype],"projectilelifemin",200);
ds_map_add(weapons[weapontype],"projectilelifemax",200);
ds_map_add(weapons[weapontype],"projectilealphalength",40);
ds_map_add(weapons[weapontype],"projectilespeedmin",20);
ds_map_add(weapons[weapontype],"projectilespeedmax",25);
#endregion
#region Shell
ds_map_add(weapons[weapontype],"shell",oShell);
ds_map_add(weapons[weapontype],"shellxoffset",22);
ds_map_add(weapons[weapontype],"shellyoffset",-8);
ds_map_add(weapons[weapontype],"shellxscale",1);
ds_map_add(weapons[weapontype],"shellyscale",1);
ds_map_add(weapons[weapontype],"shellsprite",sShell);
ds_map_add(weapons[weapontype],"shellamount",1);
ds_map_add(weapons[weapontype],"shelllifemin",200);
ds_map_add(weapons[weapontype],"shelllifemax",200);
ds_map_add(weapons[weapontype],"shellalphalength",40);
ds_map_add(weapons[weapontype],"shellhspmin",-3);
ds_map_add(weapons[weapontype],"shellhspmax",-4);
ds_map_add(weapons[weapontype],"shellvspmin",-4);
ds_map_add(weapons[weapontype],"shellvspmax",-5);
ds_map_add(weapons[weapontype],"shellgrv",0.3);
ds_map_add(weapons[weapontype],"shellbouncehspmin",-1);
ds_map_add(weapons[weapontype],"shellbouncehspmax",-4);
ds_map_add(weapons[weapontype],"shellbouncevspmin",-3);
ds_map_add(weapons[weapontype],"shellbouncevspmax",-5);
#endregion
#region Muzzleflash
ds_map_add(weapons[weapontype],"muzzleflash",true);
ds_map_add(weapons[weapontype],"muzzleflashxoffset",42);
ds_map_add(weapons[weapontype],"muzzleflashyoffset",-6);
ds_map_add(weapons[weapontype],"muzzleflashxscale",1);
ds_map_add(weapons[weapontype],"muzzleflashyscale",1);
ds_map_add(weapons[weapontype],"muzzleflashsprite",sMuzzleflashPistol);
ds_map_add(weapons[weapontype],"muzzleflashspritespeed",1);
#endregion
#region Crosshair
ds_map_add(weapons[weapontype],"crosshairxoffset",0);
ds_map_add(weapons[weapontype],"crosshairyoffset",10);
ds_map_add(weapons[weapontype],"crosshairxscale",1);
ds_map_add(weapons[weapontype],"crosshairyscale",1);
ds_map_add(weapons[weapontype],"crosshairsprite",sCrosshair);
ds_map_add(weapons[weapontype],"crosshairrspeed",0.45);
ds_map_add(weapons[weapontype],"crosshairdistance",120);
ds_map_add(weapons[weapontype],"crosshairshakemagnitudemin",2);
ds_map_add(weapons[weapontype],"crosshairshakemagnitudemax",2);
ds_map_add(weapons[weapontype],"crosshairshakelengthmin",10);
ds_map_add(weapons[weapontype],"crosshairshakelengthmax",10);
ds_map_add(weapons[weapontype],"crosshairironsightspeed",0.5);
ds_map_add(weapons[weapontype],"crosshairironsightdistance",125);
ds_map_add(weapons[weapontype],"crosshairironsightshakemagnitudemin",1);
ds_map_add(weapons[weapontype],"crosshairironsightshakemagnitudemax",1);
ds_map_add(weapons[weapontype],"crosshairironsightshakelengthmin",5);
ds_map_add(weapons[weapontype],"crosshairironsightshakelengthmax",5);
#endregion
#region Sound
ds_map_add(weapons[weapontype],"soundprimary",snd_WeaponPistolPrimary);
ds_map_add(weapons[weapontype],"soundsecondary",-1);
ds_map_add(weapons[weapontype],"soundpump",-1);
ds_map_add(weapons[weapontype],"soundstartup",snd_PlayerDeath);
ds_map_add(weapons[weapontype],"soundreload",-1);
ds_map_add(weapons[weapontype],"soundempty",snd_WeaponPistolEmpty);
ds_map_add(weapons[weapontype],"soundprimarypitchmin",0.98);
ds_map_add(weapons[weapontype],"soundprimarypitchmax",1.02);
ds_map_add(weapons[weapontype],"soundsecondarypitchmin",1);
ds_map_add(weapons[weapontype],"soundsecondarypitchmax",1);
ds_map_add(weapons[weapontype],"soundpumppitchmin",1);
ds_map_add(weapons[weapontype],"soundpumppitchmax",1);
ds_map_add(weapons[weapontype],"soundstartuppitchmin",1);
ds_map_add(weapons[weapontype],"soundstartuppitchmax",1);
ds_map_add(weapons[weapontype],"soundreloadpitchmin",1);
ds_map_add(weapons[weapontype],"soundreloadpitchmax",1);
ds_map_add(weapons[weapontype],"soundemptypitchmin",1);
ds_map_add(weapons[weapontype],"soundemptypitchmax",1);
#endregion
#endregion

#region Shotgun (3)
var weapontype = weapontypes.shotgun;
weapons[weapontype] = ds_map_create();
#region Weapon
ds_map_add(weapons[weapontype],"xoffset",-3);
ds_map_add(weapons[weapontype],"yoffset",12);
ds_map_add(weapons[weapontype],"xscale",1.5);
ds_map_add(weapons[weapontype],"yscale",1.5);
#region Sprites
#region Left Side Sprites
ds_map_add(weapons[weapontype],"spriteleft",sWeaponShotgunLeft);
ds_map_add(weapons[weapontype],"spriteprimaryleft",sWeaponShotgunPrimaryLeft);
ds_map_add(weapons[weapontype],"spritesecondaryleft",-1);
ds_map_add(weapons[weapontype],"spritepumpleft",sWeaponShotgunPumpLeft);
ds_map_add(weapons[weapontype],"spritestartupleft",-1);
ds_map_add(weapons[weapontype],"spritereloadleft",-1);
ds_map_add(weapons[weapontype],"spriteemptyleft",sWeaponShotgunLeft);
#endregion
#region Right Side Sprites
ds_map_add(weapons[weapontype],"spriteright",sWeaponShotgunRight);
ds_map_add(weapons[weapontype],"spriteprimaryright",sWeaponShotgunPrimaryRight);
ds_map_add(weapons[weapontype],"spritesecondaryright",-1);
ds_map_add(weapons[weapontype],"spritepumpright",sWeaponShotgunPumpRight);
ds_map_add(weapons[weapontype],"spritestartupright",-1);
ds_map_add(weapons[weapontype],"spritereloadright",-1);
ds_map_add(weapons[weapontype],"spriteemptyright",sWeaponShotgunRight);
#endregion
#region Left Side Arm Sprites
ds_map_add(weapons[weapontype],"armspriteleft",sArmShotgunLeft);
ds_map_add(weapons[weapontype],"armspriteprimaryleft",sArmShotgunPrimaryLeft);
ds_map_add(weapons[weapontype],"armspritesecondaryleft",-1);
ds_map_add(weapons[weapontype],"armspritepumpleft",-1);
ds_map_add(weapons[weapontype],"armspritestartupleft",-1);
ds_map_add(weapons[weapontype],"armspritereloadleft",-1);
ds_map_add(weapons[weapontype],"armspriteemptyleft",sArmShotgunLeft);
#endregion
#region Right Side Arm Sprites
ds_map_add(weapons[weapontype],"armspriteright",sArmShotgunRight);
ds_map_add(weapons[weapontype],"armspriteprimaryright",sArmShotgunPrimaryRight);
ds_map_add(weapons[weapontype],"armspritesecondaryright",-1);
ds_map_add(weapons[weapontype],"armspritepumpright",-1);
ds_map_add(weapons[weapontype],"armspritestartupright",-1);
ds_map_add(weapons[weapontype],"armspritereloadright",-1);
ds_map_add(weapons[weapontype],"armspriteemptyright",sArmShotgunRight);
#endregion
ds_map_add(weapons[weapontype],"spritespeed",1);
ds_map_add(weapons[weapontype],"spriteprimaryspeed",1);
ds_map_add(weapons[weapontype],"spritesecondaryspeed",1);
ds_map_add(weapons[weapontype],"spritepumpspeed",1);
ds_map_add(weapons[weapontype],"spritestartupspeed",1);
ds_map_add(weapons[weapontype],"spritereloadspeed",1);
ds_map_add(weapons[weapontype],"spriteemptyspeed",1);
ds_map_add(weapons[weapontype],"spriteprimarylooping",false);
ds_map_add(weapons[weapontype],"spritesecondarylooping",false);
ds_map_add(weapons[weapontype],"spritepumplooping",false);
ds_map_add(weapons[weapontype],"spritestartuplooping",true);
ds_map_add(weapons[weapontype],"spritereloadlooping",false);
ds_map_add(weapons[weapontype],"spriteemptylooping",true);
#endregion
ds_map_add(weapons[weapontype],"xfollowspeed",0.9);
ds_map_add(weapons[weapontype],"yfollowspeed",0.9);
ds_map_add(weapons[weapontype],"rspeed",0.25);
ds_map_add(weapons[weapontype],"hspminmaxangle",75);
ds_map_add(weapons[weapontype],"wallminmaxangle",60);
ds_map_add(weapons[weapontype],"recoilmin",0);
ds_map_add(weapons[weapontype],"recoilmax",0);
ds_map_add(weapons[weapontype],"kickbackxmin",-0.2);
ds_map_add(weapons[weapontype],"kickbackxmax",-0.5);
ds_map_add(weapons[weapontype],"kickbackymin",-0.2);
ds_map_add(weapons[weapontype],"kickbackymax",-0.5);
ds_map_add(weapons[weapontype],"damage",8);
ds_map_add(weapons[weapontype],"switchdelay",20);
ds_map_add(weapons[weapontype],"startup",0);
ds_map_add(weapons[weapontype],"cooldownmin",6);
ds_map_add(weapons[weapontype],"cooldownmax",8);
ds_map_add(weapons[weapontype],"firemodetype",firemodetypes.pumpsingle);
ds_map_add(weapons[weapontype],"aimsidetype",aimsidetypes.weapondirection);
ds_map_add(weapons[weapontype],"distance",0);
ds_map_add(weapons[weapontype],"spreadmin",-2);
ds_map_add(weapons[weapontype],"spreadmax",3);
ds_map_add(weapons[weapontype],"ironsightspeed",0.5);
ds_map_add(weapons[weapontype],"ironsightdistance",-1);
ds_map_add(weapons[weapontype],"ironsightrecoilmin",0);
ds_map_add(weapons[weapontype],"ironsightrecoilmax",0);
ds_map_add(weapons[weapontype],"ironsightspreadmin",-1);
ds_map_add(weapons[weapontype],"ironsightspreadmax",2);
#endregion
#region Projectile
ds_map_add(weapons[weapontype],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[weapontype],"projectilexoffset",25);
ds_map_add(weapons[weapontype],"projectileyoffset",-5.5);
ds_map_add(weapons[weapontype],"projectilexscale",1);
ds_map_add(weapons[weapontype],"projectileyscale",1);
ds_map_add(weapons[weapontype],"projectilesprite",sBullet);
ds_map_add(weapons[weapontype],"projectileamount",3);
ds_map_add(weapons[weapontype],"projectilelifemin",200);
ds_map_add(weapons[weapontype],"projectilelifemax",200);
ds_map_add(weapons[weapontype],"projectilealphalength",40);
ds_map_add(weapons[weapontype],"projectilespeedmin",20);
ds_map_add(weapons[weapontype],"projectilespeedmax",25);
#endregion
#region Shell
ds_map_add(weapons[weapontype],"shell",oShell);
ds_map_add(weapons[weapontype],"shellxoffset",22);
ds_map_add(weapons[weapontype],"shellyoffset",-8);
ds_map_add(weapons[weapontype],"shellxscale",1);
ds_map_add(weapons[weapontype],"shellyscale",1);
ds_map_add(weapons[weapontype],"shellsprite",sShellShotgun);
ds_map_add(weapons[weapontype],"shellamount",1);
ds_map_add(weapons[weapontype],"shelllifemin",200);
ds_map_add(weapons[weapontype],"shelllifemax",200);
ds_map_add(weapons[weapontype],"shellalphalength",40);
ds_map_add(weapons[weapontype],"shellhspmin",-3);
ds_map_add(weapons[weapontype],"shellhspmax",-4);
ds_map_add(weapons[weapontype],"shellvspmin",-4);
ds_map_add(weapons[weapontype],"shellvspmax",-5);
ds_map_add(weapons[weapontype],"shellgrv",0.3);
ds_map_add(weapons[weapontype],"shellbouncehspmin",-1);
ds_map_add(weapons[weapontype],"shellbouncehspmax",-4);
ds_map_add(weapons[weapontype],"shellbouncevspmin",-3);
ds_map_add(weapons[weapontype],"shellbouncevspmax",-5);
#endregion
#region Muzzleflash
ds_map_add(weapons[weapontype],"muzzleflash",true);
ds_map_add(weapons[weapontype],"muzzleflashxoffset",42);
ds_map_add(weapons[weapontype],"muzzleflashyoffset",-6);
ds_map_add(weapons[weapontype],"muzzleflashxscale",1);
ds_map_add(weapons[weapontype],"muzzleflashyscale",1);
ds_map_add(weapons[weapontype],"muzzleflashsprite",sMuzzleflash);
ds_map_add(weapons[weapontype],"muzzleflashspritespeed",1);
#endregion
#region Crosshair
ds_map_add(weapons[weapontype],"crosshairxoffset",0);
ds_map_add(weapons[weapontype],"crosshairyoffset",10);
ds_map_add(weapons[weapontype],"crosshairxscale",1);
ds_map_add(weapons[weapontype],"crosshairyscale",1);
ds_map_add(weapons[weapontype],"crosshairsprite",sCrosshair);
ds_map_add(weapons[weapontype],"crosshairrspeed",0.45);
ds_map_add(weapons[weapontype],"crosshairdistance",120);
ds_map_add(weapons[weapontype],"crosshairshakemagnitudemin",2);
ds_map_add(weapons[weapontype],"crosshairshakemagnitudemax",2);
ds_map_add(weapons[weapontype],"crosshairshakelengthmin",10);
ds_map_add(weapons[weapontype],"crosshairshakelengthmax",10);
ds_map_add(weapons[weapontype],"crosshairironsightspeed",0.5);
ds_map_add(weapons[weapontype],"crosshairironsightdistance",125);
ds_map_add(weapons[weapontype],"crosshairironsightshakemagnitudemin",1);
ds_map_add(weapons[weapontype],"crosshairironsightshakemagnitudemax",1);
ds_map_add(weapons[weapontype],"crosshairironsightshakelengthmin",5);
ds_map_add(weapons[weapontype],"crosshairironsightshakelengthmax",5);
#endregion
#region Sound
ds_map_add(weapons[weapontype],"soundprimary",snd_WeaponShotgunPrimary);
ds_map_add(weapons[weapontype],"soundsecondary",-1);
ds_map_add(weapons[weapontype],"soundpump",snd_WeaponShotgunPump);
ds_map_add(weapons[weapontype],"soundstartup",snd_PlayerDeath);
ds_map_add(weapons[weapontype],"soundreload",-1);
ds_map_add(weapons[weapontype],"soundempty",snd_WeaponPistolEmpty);
ds_map_add(weapons[weapontype],"soundprimarypitchmin",0.98);
ds_map_add(weapons[weapontype],"soundprimarypitchmax",1.02);
ds_map_add(weapons[weapontype],"soundsecondarypitchmin",1);
ds_map_add(weapons[weapontype],"soundsecondarypitchmax",1);
ds_map_add(weapons[weapontype],"soundpumppitchmin",1);
ds_map_add(weapons[weapontype],"soundpumppitchmax",1);
ds_map_add(weapons[weapontype],"soundstartuppitchmin",1);
ds_map_add(weapons[weapontype],"soundstartuppitchmax",1);
ds_map_add(weapons[weapontype],"soundreloadpitchmin",1);
ds_map_add(weapons[weapontype],"soundreloadpitchmax",1);
ds_map_add(weapons[weapontype],"soundemptypitchmin",1);
ds_map_add(weapons[weapontype],"soundemptypitchmax",1);
#endregion
#endregion

animstate = animstates.idle;
pointdir = 0;
mouseangle = 0;
controllerangle = 0;
aimside = 1;
stopattack = false;
ironsights = false;
delta = 0;
weapon = 0;
switchdelay = 20;
animationplaying = false;
animationlooping = false;
lastxoffset = 0;
lastyoffset = 0;

// currentprimaryammo = -1; is infinite ammo
currentprimaryammo[array_length(weapons)-1] = 0; // Default Primary ammo
//currentprimaryammo[0] = -1; // Set unarmed currentprimaryammo
currentsecondaryammo[array_length(weapons)-1] = 0; // Default Secondary ammo

SetWeapon(0);

currentweapon = weapon;
currentxoffset = 0;
currentyoffset = 0;
currentxoffsetspeed = 0;
currentyoffsetspeed = 0;
currentrspeed = 0;
currentminmaxangle = 0;
currentrecoil = 0;
currentkickbackx = 0;
currentkickbacky = 0;
currentspread = 0;
currentdistance = 0;
currentswitchdelay = 0;
