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
	shotgun,
	smg
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
		#region Position
			ds_map_add(weapons[weapontype],"xoffset",0);
			ds_map_add(weapons[weapontype],"yoffset",0);
			
			ds_map_add(weapons[weapontype],"crouchxoffset",0);
			ds_map_add(weapons[weapontype],"crouchyoffset",0);
		
			ds_map_add(weapons[weapontype],"xscale",1);
			ds_map_add(weapons[weapontype],"yscale",1);
		
			ds_map_add(weapons[weapontype],"xfollowspeed",0);
			ds_map_add(weapons[weapontype],"yfollowspeed",0);
		
			ds_map_add(weapons[weapontype],"primaryrecoilmin",0);
			ds_map_add(weapons[weapontype],"primaryrecoilmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryrecoilmin",0);
			ds_map_add(weapons[weapontype],"secondaryrecoilmax",0);
		
			ds_map_add(weapons[weapontype],"distance",0);
		
			ds_map_add(weapons[weapontype],"ironsightspeed",0);
		
			ds_map_add(weapons[weapontype],"ironsightdistance",0);
		
			ds_map_add(weapons[weapontype],"primaryironsightrecoilmin",0);
			ds_map_add(weapons[weapontype],"primaryironsightrecoilmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryironsightrecoilmin",0);
			ds_map_add(weapons[weapontype],"secondaryironsightrecoilmax",0);
		#endregion

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
			#region Sprite Speed
				ds_map_add(weapons[weapontype],"spritespeed",1);
				
				ds_map_add(weapons[weapontype],"spriteprimaryspeed",1);
				
				ds_map_add(weapons[weapontype],"spritesecondaryspeed",1);
				
				ds_map_add(weapons[weapontype],"spritepumpspeed",1);
				
				ds_map_add(weapons[weapontype],"spritestartupspeed",1);
				
				ds_map_add(weapons[weapontype],"spritereloadspeed",1);
				
				ds_map_add(weapons[weapontype],"spriteemptyspeed",1);
			#endregion
			#region Sprite Looping
				ds_map_add(weapons[weapontype],"spriteprimarylooping",false);
				
				ds_map_add(weapons[weapontype],"spritesecondarylooping",false);
				
				ds_map_add(weapons[weapontype],"spritepumplooping",false);
				
				ds_map_add(weapons[weapontype],"spritestartuplooping",false);
				
				ds_map_add(weapons[weapontype],"spritereloadlooping",false);
				
				ds_map_add(weapons[weapontype],"spriteemptylooping",false);
			#endregion
		#endregion

		#region Rotation/Angle
			ds_map_add(weapons[weapontype],"rspeed",0);
			
			ds_map_add(weapons[weapontype],"hspminmaxangle",360);
			ds_map_add(weapons[weapontype],"wallminmaxangle",360);
		#endregion

		#region Types
			ds_map_add(weapons[weapontype],"primaryfiremodetype",firemodetypes.single);
			ds_map_add(weapons[weapontype],"secondaryfiremodetype",firemodetypes.single);
			
			ds_map_add(weapons[weapontype],"aimsidetype",aimsidetypes.movedirection);
		#endregion

		#region Delay
			ds_map_add(weapons[weapontype],"switchdelay",20);
			
			ds_map_add(weapons[weapontype],"reloaddelay",0);
			
			ds_map_add(weapons[weapontype],"primarystartup",0);
			ds_map_add(weapons[weapontype],"primarycooldownmin",0);
			ds_map_add(weapons[weapontype],"primarycooldownmax",0);
			
			ds_map_add(weapons[weapontype],"secondarystartup",0);
			ds_map_add(weapons[weapontype],"secondarycooldownmin",0);
			ds_map_add(weapons[weapontype],"secondarycooldownmax",0);
		#endregion

		#region Ammo
			ds_map_add(weapons[weapontype],"primaryammo",0);
			ds_map_add(weapons[weapontype],"primaryreservedammo",0);
			ds_map_add(weapons[weapontype],"primaryammospent",0);
			
			ds_map_add(weapons[weapontype],"secondaryammo",0); //-1 means use primary ammo
			ds_map_add(weapons[weapontype],"secondaryammospent",0);
		#endregion

		#region Spread
			ds_map_add(weapons[weapontype],"primaryspreadmin",0);
			ds_map_add(weapons[weapontype],"primaryspreadmax",0);
			
			ds_map_add(weapons[weapontype],"primaryironsightspreadmin",0);
			ds_map_add(weapons[weapontype],"primaryironsightspreadmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryspreadmin",0);
			ds_map_add(weapons[weapontype],"secondaryspreadmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryironsightspreadmin",0);
			ds_map_add(weapons[weapontype],"secondaryironsightspreadmax",0);
		#endregion

		#region Kickback
			ds_map_add(weapons[weapontype],"primarykickbackxmin",0);
			ds_map_add(weapons[weapontype],"primarykickbackxmax",0);
				
			ds_map_add(weapons[weapontype],"primarykickbackymin",0);
			ds_map_add(weapons[weapontype],"primarykickbackymax",0);

			ds_map_add(weapons[weapontype],"secondarykickbackxmin",0);
			ds_map_add(weapons[weapontype],"secondarykickbackxmax",0);
				
			ds_map_add(weapons[weapontype],"secondarykickbackymin",0);
			ds_map_add(weapons[weapontype],"secondarykickbackymax",0);
		#endregion

		#region Damage
			ds_map_add(weapons[weapontype],"primarydamage",0);
			ds_map_add(weapons[weapontype],"secondarydamage",0);
		#endregion

		#region Sound
			#region Sounds
				ds_map_add(weapons[weapontype],"soundprimary",-1);
				
				ds_map_add(weapons[weapontype],"soundsecondary",-1);
				
				ds_map_add(weapons[weapontype],"soundpump",-1);
				
				ds_map_add(weapons[weapontype],"soundstartup",-1);
				
				ds_map_add(weapons[weapontype],"soundreload",-1);
				
				ds_map_add(weapons[weapontype],"soundempty",-1);
			#endregion
			#region Gain
				ds_map_add(weapons[weapontype],"soundprimarygainmin",1);
				ds_map_add(weapons[weapontype],"soundprimarygainmax",1);
				
				ds_map_add(weapons[weapontype],"soundsecondarygainmin",1);
				ds_map_add(weapons[weapontype],"soundsecondarygainmax",1);
				
				ds_map_add(weapons[weapontype],"soundpumpgainmin",1);
				ds_map_add(weapons[weapontype],"soundpumpgainmax",1);
				
				ds_map_add(weapons[weapontype],"soundstartupgainmin",1);
				ds_map_add(weapons[weapontype],"soundstartupgainmax",1);
				
				ds_map_add(weapons[weapontype],"soundreloadgainmin",1);
				ds_map_add(weapons[weapontype],"soundreloadgainmax",1);
				
				ds_map_add(weapons[weapontype],"soundemptygainmin",1);
				ds_map_add(weapons[weapontype],"soundemptygainmax",1);
			#endregion
			#region Pitch
				ds_map_add(weapons[weapontype],"soundprimarypitchmin",1);
				ds_map_add(weapons[weapontype],"soundprimarypitchmax",1);
				
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
	#endregion

	#region Camera
		#region Primary
			ds_map_add(weapons[weapontype],"primarycamerashakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"primarycamerashakemagnitudemax",0);
		
			ds_map_add(weapons[weapontype],"primarycamerashakelengthmin",0);
			ds_map_add(weapons[weapontype],"primarycamerashakelengthmax",0);
		
			ds_map_add(weapons[weapontype],"primarycameraironsightshakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"primarycameraironsightshakemagnitudemax",0);
		
			ds_map_add(weapons[weapontype],"primarycameraironsightshakelengthmin",0);
			ds_map_add(weapons[weapontype],"primarycameraironsightshakelengthmax",0);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondarycamerashakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"secondarycamerashakemagnitudemax",0);
			
			ds_map_add(weapons[weapontype],"secondarycamerashakelengthmin",0);
			ds_map_add(weapons[weapontype],"secondarycamerashakelengthmax",0);
			
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakemagnitudemax",0);
		
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakelengthmin",0);
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakelengthmax",0);
		#endregion
	#endregion

	#region Projectile
		#region Primary
			ds_map_add(weapons[weapontype],"primaryprojectile",-1);//oHitscan);
		
			ds_map_add(weapons[weapontype],"primaryprojectilexoffset",0);
			ds_map_add(weapons[weapontype],"primaryprojectileyoffset",0);
		
			ds_map_add(weapons[weapontype],"primaryprojectilexscale",1);
			ds_map_add(weapons[weapontype],"primaryprojectileyscale",1);
		
			ds_map_add(weapons[weapontype],"primaryprojectilesprite",-1);
		
			ds_map_add(weapons[weapontype],"primaryprojectileamount",0);
		
			ds_map_add(weapons[weapontype],"primaryprojectilelifemin",0);
			ds_map_add(weapons[weapontype],"primaryprojectilelifemax",0);
		
			ds_map_add(weapons[weapontype],"primaryprojectilealphalength",0);
		
			ds_map_add(weapons[weapontype],"primaryprojectilespeedmin",0);
			ds_map_add(weapons[weapontype],"primaryprojectilespeedmax",0);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondaryprojectile",-1);//oHitscan);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilexoffset",0);
			ds_map_add(weapons[weapontype],"secondaryprojectileyoffset",0);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilexscale",1);
			ds_map_add(weapons[weapontype],"secondaryprojectileyscale",1);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilesprite",-1);
		
			ds_map_add(weapons[weapontype],"secondaryprojectileamount",0);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilelifemin",0);
			ds_map_add(weapons[weapontype],"secondaryprojectilelifemax",0);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilealphalength",0);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilespeedmin",0);
			ds_map_add(weapons[weapontype],"secondaryprojectilespeedmax",0);
		#endregion
	#endregion

	#region Hitspark
		#region Primary
			ds_map_add(weapons[weapontype],"primaryhitspark",-1);
			
			ds_map_add(weapons[weapontype],"primaryhitsparkxscale",1);
			ds_map_add(weapons[weapontype],"primaryhitsparkyscale",1);
			
			ds_map_add(weapons[weapontype],"primaryhitsparkalpha",1);
			
			ds_map_add(weapons[weapontype],"primaryhitsparksprite",-1);
			
			ds_map_add(weapons[weapontype],"primaryhitsparkspritespeed",1);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondaryhitspark",-1);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparkxscale",1);
			ds_map_add(weapons[weapontype],"secondaryhitsparkyscale",1);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparkalpha",1);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparksprite",-1);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparkspritespeed",1);
		#endregion
	#endregion

	#region Shell
		#region Primary
			ds_map_add(weapons[weapontype],"primaryshell",-1);
			
			ds_map_add(weapons[weapontype],"primaryshellxoffset",0);
			ds_map_add(weapons[weapontype],"primaryshellyoffset",0);
			
			ds_map_add(weapons[weapontype],"primaryshellxscale",1);
			ds_map_add(weapons[weapontype],"primaryshellyscale",1);
			
			ds_map_add(weapons[weapontype],"primaryshellsprite",-1);
			
			ds_map_add(weapons[weapontype],"primaryshellamount",0);
			
			ds_map_add(weapons[weapontype],"primaryshelllifemin",0);
			ds_map_add(weapons[weapontype],"primaryshelllifemax",0);
			
			ds_map_add(weapons[weapontype],"primaryshellalphalength",0);
			
			ds_map_add(weapons[weapontype],"primaryshellhspmin",0);
			ds_map_add(weapons[weapontype],"primaryshellhspmax",0);
			
			ds_map_add(weapons[weapontype],"primaryshellvspmin",0);
			ds_map_add(weapons[weapontype],"primaryshellvspmax",0);
			
			ds_map_add(weapons[weapontype],"primaryshellgrv",0);
			
			ds_map_add(weapons[weapontype],"primaryshellbouncehspmin",0);
			ds_map_add(weapons[weapontype],"primaryshellbouncehspmax",0);
			
			ds_map_add(weapons[weapontype],"primaryshellbouncevspmin",0);
			ds_map_add(weapons[weapontype],"primaryshellbouncevspmax",0);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondaryshell",-1);
			
			ds_map_add(weapons[weapontype],"secondaryshellxoffset",0);
			ds_map_add(weapons[weapontype],"secondaryshellyoffset",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellxscale",1);
			ds_map_add(weapons[weapontype],"secondaryshellyscale",1);
			
			ds_map_add(weapons[weapontype],"secondaryshellsprite",-1);
			
			ds_map_add(weapons[weapontype],"secondaryshellamount",0);
			
			ds_map_add(weapons[weapontype],"secondaryshelllifemin",0);
			ds_map_add(weapons[weapontype],"secondaryshelllifemax",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellalphalength",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellhspmin",0);
			ds_map_add(weapons[weapontype],"secondaryshellhspmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellvspmin",0);
			ds_map_add(weapons[weapontype],"secondaryshellvspmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellgrv",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellbouncehspmin",0);
			ds_map_add(weapons[weapontype],"secondaryshellbouncehspmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellbouncevspmin",0);
			ds_map_add(weapons[weapontype],"secondaryshellbouncevspmax",0);
		#endregion
	#endregion

	#region Muzzleflash
		#region Primary
			ds_map_add(weapons[weapontype],"primarymuzzleflash",false);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashxoffset",0);
			ds_map_add(weapons[weapontype],"primarymuzzleflashyoffset",0);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashxscale",1);
			ds_map_add(weapons[weapontype],"primarymuzzleflashyscale",1);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashalpha",1);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashsprite",-1);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashspritespeed",1);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondarymuzzleflash",false);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashxoffset",0);
			ds_map_add(weapons[weapontype],"secondarymuzzleflashyoffset",0);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashxscale",1);
			ds_map_add(weapons[weapontype],"secondarymuzzleflashyscale",1);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashalpha",1);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashsprite",-1);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashspritespeed",1);
		#endregion
	#endregion

	#region Crosshair
		ds_map_add(weapons[weapontype],"crosshairxoffset",0);
		ds_map_add(weapons[weapontype],"crosshairyoffset",0);
		
		ds_map_add(weapons[weapontype],"crosshairxscale",1);
		ds_map_add(weapons[weapontype],"crosshairyscale",1);
		
		ds_map_add(weapons[weapontype],"crosshairsprite",-1);
		
		ds_map_add(weapons[weapontype],"crosshairdistance",0);
		
		ds_map_add(weapons[weapontype],"crosshairironsightspeed",0);
		
		ds_map_add(weapons[weapontype],"crosshairironsightdistance",0);
		#region Primary
			ds_map_add(weapons[weapontype],"primarycrosshairshakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"primarycrosshairshakemagnitudemax",0);
		
			ds_map_add(weapons[weapontype],"primarycrosshairshakelengthmin",0);
			ds_map_add(weapons[weapontype],"primarycrosshairshakelengthmax",0);
		
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakemagnitudemax",0);
		
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakelengthmin",0);
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakelengthmax",0);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondarycrosshairshakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"secondarycrosshairshakemagnitudemax",0);
			
			ds_map_add(weapons[weapontype],"secondarycrosshairshakelengthmin",0);
			ds_map_add(weapons[weapontype],"secondarycrosshairshakelengthmax",0);
			
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakemagnitudemax",0);
		
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakelengthmin",0);
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakelengthmax",0);
		#endregion
	#endregion
#endregion

#region Pistol (1)
	var weapontype = weapontypes.pistol;
	weapons[weapontype] = ds_map_create();
	#region Weapon
		#region Position
			ds_map_add(weapons[weapontype],"xoffset",-4);
			ds_map_add(weapons[weapontype],"yoffset",16);
			
			ds_map_add(weapons[weapontype],"crouchxoffset",-4);
			ds_map_add(weapons[weapontype],"crouchyoffset",16);
		
			ds_map_add(weapons[weapontype],"xscale",2);
			ds_map_add(weapons[weapontype],"yscale",2);
		
			ds_map_add(weapons[weapontype],"xfollowspeed",0.9);
			ds_map_add(weapons[weapontype],"yfollowspeed",0.9);
		
			ds_map_add(weapons[weapontype],"primaryrecoilmin",0);
			ds_map_add(weapons[weapontype],"primaryrecoilmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryrecoilmin",0);
			ds_map_add(weapons[weapontype],"secondaryrecoilmax",0);
		
			ds_map_add(weapons[weapontype],"distance",0);
		
			ds_map_add(weapons[weapontype],"ironsightspeed",0.5);
		
			ds_map_add(weapons[weapontype],"ironsightdistance",-1);
		
			ds_map_add(weapons[weapontype],"primaryironsightrecoilmin",0);
			ds_map_add(weapons[weapontype],"primaryironsightrecoilmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryironsightrecoilmin",0);
			ds_map_add(weapons[weapontype],"secondaryironsightrecoilmax",0);
		#endregion

		#region Sprites
			#region Left Side Sprites
				ds_map_add(weapons[weapontype],"spriteleft",sWeaponPistolLeft);
				
				ds_map_add(weapons[weapontype],"spriteprimaryleft",sWeaponPistolPrimaryLeft);
				
				ds_map_add(weapons[weapontype],"spritesecondaryleft",sWeaponPistolPrimaryLeft);
				
				ds_map_add(weapons[weapontype],"spritepumpleft",-1);
				
				ds_map_add(weapons[weapontype],"spritestartupleft",-1);
				
				ds_map_add(weapons[weapontype],"spritereloadleft",-1);
				
				ds_map_add(weapons[weapontype],"spriteemptyleft",sWeaponPistolEmptyLeft);
			#endregion
			#region Right Side Sprites
				ds_map_add(weapons[weapontype],"spriteright",sWeaponPistolRight);
				
				ds_map_add(weapons[weapontype],"spriteprimaryright",sWeaponPistolPrimaryRight);
				
				ds_map_add(weapons[weapontype],"spritesecondaryright",sWeaponPistolPrimaryRight);
				
				ds_map_add(weapons[weapontype],"spritepumpright",-1);
				
				ds_map_add(weapons[weapontype],"spritestartupright",-1);
				
				ds_map_add(weapons[weapontype],"spritereloadright",-1);
				
				ds_map_add(weapons[weapontype],"spriteemptyright",sWeaponPistolEmptyRight);
			#endregion
			#region Left Side Arm Sprites
				ds_map_add(weapons[weapontype],"armspriteleft",sArmPistolLeft);
				
				ds_map_add(weapons[weapontype],"armspriteprimaryleft",sArmPistolPrimaryLeft);
				
				ds_map_add(weapons[weapontype],"armspritesecondaryleft",sArmPistolPrimaryLeft);
				
				ds_map_add(weapons[weapontype],"armspritepumpleft",-1);
				
				ds_map_add(weapons[weapontype],"armspritestartupleft",-1);
				
				ds_map_add(weapons[weapontype],"armspritereloadleft",-1);
				
				ds_map_add(weapons[weapontype],"armspriteemptyleft",sArmPistolRight);
			#endregion
			#region Right Side Arm Sprites
				ds_map_add(weapons[weapontype],"armspriteright",sArmPistolRight);
				
				ds_map_add(weapons[weapontype],"armspriteprimaryright",sArmPistolPrimaryRight);
				
				ds_map_add(weapons[weapontype],"armspritesecondaryright",sArmPistolPrimaryRight);
				
				ds_map_add(weapons[weapontype],"armspritepumpright",-1);
				
				ds_map_add(weapons[weapontype],"armspritestartupright",-1);
				
				ds_map_add(weapons[weapontype],"armspritereloadright",-1);
				
				ds_map_add(weapons[weapontype],"armspriteemptyright",sArmPistolRight);
			#endregion
			#region Sprite Speed
				ds_map_add(weapons[weapontype],"spritespeed",1);
				
				ds_map_add(weapons[weapontype],"spriteprimaryspeed",1);
				
				ds_map_add(weapons[weapontype],"spritesecondaryspeed",1);
				
				ds_map_add(weapons[weapontype],"spritepumpspeed",1);
				
				ds_map_add(weapons[weapontype],"spritestartupspeed",1);
				
				ds_map_add(weapons[weapontype],"spritereloadspeed",1);
				
				ds_map_add(weapons[weapontype],"spriteemptyspeed",1);
			#endregion
			#region Sprite Looping
				ds_map_add(weapons[weapontype],"spriteprimarylooping",false);
				
				ds_map_add(weapons[weapontype],"spritesecondarylooping",false);
				
				ds_map_add(weapons[weapontype],"spritepumplooping",false);
				
				ds_map_add(weapons[weapontype],"spritestartuplooping",false);
				
				ds_map_add(weapons[weapontype],"spritereloadlooping",false);
				
				ds_map_add(weapons[weapontype],"spriteemptylooping",true);
			#endregion
		#endregion

		#region Rotation/Angle
			ds_map_add(weapons[weapontype],"rspeed",0.25);
			
			ds_map_add(weapons[weapontype],"hspminmaxangle",75);
			ds_map_add(weapons[weapontype],"wallminmaxangle",60);
		#endregion

		#region Types
			ds_map_add(weapons[weapontype],"primaryfiremodetype",firemodetypes.automatic);
			ds_map_add(weapons[weapontype],"secondaryfiremodetype",firemodetypes.automatic);
			
			ds_map_add(weapons[weapontype],"aimsidetype",aimsidetypes.weapondirection);
		#endregion

		#region Delay
			ds_map_add(weapons[weapontype],"switchdelay",20);
			
			ds_map_add(weapons[weapontype],"reloaddelay",50);
			
			ds_map_add(weapons[weapontype],"primarystartup",0);
			ds_map_add(weapons[weapontype],"primarycooldownmin",10);
			ds_map_add(weapons[weapontype],"primarycooldownmax",12);
			
			ds_map_add(weapons[weapontype],"secondarystartup",0);
			ds_map_add(weapons[weapontype],"secondarycooldownmin",6);
			ds_map_add(weapons[weapontype],"secondarycooldownmax",8);
		#endregion

		#region Ammo
			ds_map_add(weapons[weapontype],"primaryammo",18);
			ds_map_add(weapons[weapontype],"primaryreservedammo",82);
			ds_map_add(weapons[weapontype],"primaryammospent",1);
			
			ds_map_add(weapons[weapontype],"secondaryammo",-1); //-1 means use primary ammo
			ds_map_add(weapons[weapontype],"secondaryammospent",1);
		#endregion

		#region Spread
			ds_map_add(weapons[weapontype],"primaryspreadmin",-2);
			ds_map_add(weapons[weapontype],"primaryspreadmax",3);
			
			ds_map_add(weapons[weapontype],"primaryironsightspreadmin",-1);
			ds_map_add(weapons[weapontype],"primaryironsightspreadmax",2);
			
			ds_map_add(weapons[weapontype],"secondaryspreadmin",-3);
			ds_map_add(weapons[weapontype],"secondaryspreadmax",4);
			
			ds_map_add(weapons[weapontype],"secondaryironsightspreadmin",-2);
			ds_map_add(weapons[weapontype],"secondaryironsightspreadmax",3);
		#endregion

		#region Kickback
			ds_map_add(weapons[weapontype],"primarykickbackxmin",-0.2);
			ds_map_add(weapons[weapontype],"primarykickbackxmax",-0.5);
				
			ds_map_add(weapons[weapontype],"primarykickbackymin",0);
			ds_map_add(weapons[weapontype],"primarykickbackymax",0);

			ds_map_add(weapons[weapontype],"secondarykickbackxmin",-0.5);
			ds_map_add(weapons[weapontype],"secondarykickbackxmax",-0.8);
				
			ds_map_add(weapons[weapontype],"secondarykickbackymin",0);
			ds_map_add(weapons[weapontype],"secondarykickbackymax",0);
		#endregion

		#region Damage
			ds_map_add(weapons[weapontype],"primarydamage",8);
			ds_map_add(weapons[weapontype],"secondarydamage",8);
		#endregion

		#region Sound
			#region Sounds
				ds_map_add(weapons[weapontype],"soundprimary",snd_WeaponPistolPrimary);
				
				ds_map_add(weapons[weapontype],"soundsecondary",snd_WeaponPistolPrimary);
				
				ds_map_add(weapons[weapontype],"soundstartup",-1);
				
				ds_map_add(weapons[weapontype],"soundreload",-1);
				
				ds_map_add(weapons[weapontype],"soundempty",snd_WeaponPistolEmpty);
			#endregion
			#region Gain
				ds_map_add(weapons[weapontype],"soundprimarygainmin",1);
				ds_map_add(weapons[weapontype],"soundprimarygainmax",1);
				
				ds_map_add(weapons[weapontype],"soundsecondarygainmin",1);
				ds_map_add(weapons[weapontype],"soundsecondarygainmax",1);
				
				ds_map_add(weapons[weapontype],"soundstartupgainmin",1);
				ds_map_add(weapons[weapontype],"soundstartupgainmax",1);
				
				ds_map_add(weapons[weapontype],"soundreloadgainmin",1);
				ds_map_add(weapons[weapontype],"soundreloadgainmax",1);
				
				ds_map_add(weapons[weapontype],"soundemptygainmin",1);
				ds_map_add(weapons[weapontype],"soundemptygainmax",1);
			#endregion
			#region Pitch
				ds_map_add(weapons[weapontype],"soundprimarypitchmin",0.98);
				ds_map_add(weapons[weapontype],"soundprimarypitchmax",1.02);
				
				ds_map_add(weapons[weapontype],"soundsecondarypitchmin",0.98);
				ds_map_add(weapons[weapontype],"soundsecondarypitchmax",1.02);
				
				ds_map_add(weapons[weapontype],"soundstartuppitchmin",1);
				ds_map_add(weapons[weapontype],"soundstartuppitchmax",1);
				
				ds_map_add(weapons[weapontype],"soundreloadpitchmin",1);
				ds_map_add(weapons[weapontype],"soundreloadpitchmax",1);
				
				ds_map_add(weapons[weapontype],"soundemptypitchmin",1);
				ds_map_add(weapons[weapontype],"soundemptypitchmax",1);
			#endregion
		#endregion
	#endregion

	#region Camera
		#region Primary
			ds_map_add(weapons[weapontype],"primarycamerashakemagnitudemin",0.5);
			ds_map_add(weapons[weapontype],"primarycamerashakemagnitudemax",0.8);
		
			ds_map_add(weapons[weapontype],"primarycamerashakelengthmin",1);
			ds_map_add(weapons[weapontype],"primarycamerashakelengthmax",1.5);
		
			ds_map_add(weapons[weapontype],"primarycameraironsightshakemagnitudemin",0.2);
			ds_map_add(weapons[weapontype],"primarycameraironsightshakemagnitudemax",0.5);
		
			ds_map_add(weapons[weapontype],"primarycameraironsightshakelengthmin",1);
			ds_map_add(weapons[weapontype],"primarycameraironsightshakelengthmax",1);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondarycamerashakemagnitudemin",0.5);
			ds_map_add(weapons[weapontype],"secondarycamerashakemagnitudemax",1);
			
			ds_map_add(weapons[weapontype],"secondarycamerashakelengthmin",1);
			ds_map_add(weapons[weapontype],"secondarycamerashakelengthmax",1.5);
			
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakemagnitudemin",0.2);
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakemagnitudemax",0.5);
		
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakelengthmin",1);
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakelengthmax",1);
		#endregion
	#endregion

	#region Projectile
		#region Primary
			ds_map_add(weapons[weapontype],"primaryprojectile",oBullet);//oHitscan);
		
			ds_map_add(weapons[weapontype],"primaryprojectilexoffset",28);
			ds_map_add(weapons[weapontype],"primaryprojectileyoffset",-8);
		
			ds_map_add(weapons[weapontype],"primaryprojectilexscale",2);
			ds_map_add(weapons[weapontype],"primaryprojectileyscale",2);
		
			ds_map_add(weapons[weapontype],"primaryprojectilesprite",sBulletPistol);
		
			ds_map_add(weapons[weapontype],"primaryprojectileamount",1);
		
			ds_map_add(weapons[weapontype],"primaryprojectilelifemin",200);
			ds_map_add(weapons[weapontype],"primaryprojectilelifemax",200);
		
			ds_map_add(weapons[weapontype],"primaryprojectilealphalength",40);
		
			ds_map_add(weapons[weapontype],"primaryprojectilespeedmin",20);
			ds_map_add(weapons[weapontype],"primaryprojectilespeedmax",25);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondaryprojectile",oBullet);//oHitscan);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilexoffset",28);
			ds_map_add(weapons[weapontype],"secondaryprojectileyoffset",-8);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilexscale",2);
			ds_map_add(weapons[weapontype],"secondaryprojectileyscale",2);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilesprite",sBulletPistol);
		
			ds_map_add(weapons[weapontype],"secondaryprojectileamount",1);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilelifemin",200);
			ds_map_add(weapons[weapontype],"secondaryprojectilelifemax",200);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilealphalength",40);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilespeedmin",20);
			ds_map_add(weapons[weapontype],"secondaryprojectilespeedmax",25);
		#endregion
	#endregion

	#region Hitspark
		#region Primary
			ds_map_add(weapons[weapontype],"primaryhitspark",oHitspark);
			
			ds_map_add(weapons[weapontype],"primaryhitsparkxscale",1);
			ds_map_add(weapons[weapontype],"primaryhitsparkyscale",1);
			
			ds_map_add(weapons[weapontype],"primaryhitsparkalpha",0.5);
			
			ds_map_add(weapons[weapontype],"primaryhitsparksprite",sHitspark);
			
			ds_map_add(weapons[weapontype],"primaryhitsparkspritespeed",1);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondaryhitspark",oHitspark);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparkxscale",1);
			ds_map_add(weapons[weapontype],"secondaryhitsparkyscale",1);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparkalpha",0.5);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparksprite",sHitspark);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparkspritespeed",1);
		#endregion
	#endregion

	#region Shell
		#region Primary
			ds_map_add(weapons[weapontype],"primaryshell",oShell);
			
			ds_map_add(weapons[weapontype],"primaryshellxoffset",28);
			ds_map_add(weapons[weapontype],"primaryshellyoffset",-8);
			
			ds_map_add(weapons[weapontype],"primaryshellxscale",1);
			ds_map_add(weapons[weapontype],"primaryshellyscale",1);
			
			ds_map_add(weapons[weapontype],"primaryshellsprite",sShell);
			
			ds_map_add(weapons[weapontype],"primaryshellamount",1);
			
			ds_map_add(weapons[weapontype],"primaryshelllifemin",200);
			ds_map_add(weapons[weapontype],"primaryshelllifemax",200);
			
			ds_map_add(weapons[weapontype],"primaryshellalphalength",40);
			
			ds_map_add(weapons[weapontype],"primaryshellhspmin",-3);
			ds_map_add(weapons[weapontype],"primaryshellhspmax",-4);
			
			ds_map_add(weapons[weapontype],"primaryshellvspmin",-4);
			ds_map_add(weapons[weapontype],"primaryshellvspmax",-5);
			
			ds_map_add(weapons[weapontype],"primaryshellgrv",0.3);
			
			ds_map_add(weapons[weapontype],"primaryshellbouncehspmin",-1);
			ds_map_add(weapons[weapontype],"primaryshellbouncehspmax",-4);
			
			ds_map_add(weapons[weapontype],"primaryshellbouncevspmin",-3);
			ds_map_add(weapons[weapontype],"primaryshellbouncevspmax",-5);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondaryshell",oShell);
			
			ds_map_add(weapons[weapontype],"secondaryshellxoffset",28);
			ds_map_add(weapons[weapontype],"secondaryshellyoffset",-8);
			
			ds_map_add(weapons[weapontype],"secondaryshellxscale",1);
			ds_map_add(weapons[weapontype],"secondaryshellyscale",1);
			
			ds_map_add(weapons[weapontype],"secondaryshellsprite",sShell);
			
			ds_map_add(weapons[weapontype],"secondaryshellamount",1);
			
			ds_map_add(weapons[weapontype],"secondaryshelllifemin",200);
			ds_map_add(weapons[weapontype],"secondaryshelllifemax",200);
			
			ds_map_add(weapons[weapontype],"secondaryshellalphalength",40);
			
			ds_map_add(weapons[weapontype],"secondaryshellhspmin",-3);
			ds_map_add(weapons[weapontype],"secondaryshellhspmax",-4);
			
			ds_map_add(weapons[weapontype],"secondaryshellvspmin",-4);
			ds_map_add(weapons[weapontype],"secondaryshellvspmax",-5);
			
			ds_map_add(weapons[weapontype],"secondaryshellgrv",0.3);
			
			ds_map_add(weapons[weapontype],"secondaryshellbouncehspmin",-1);
			ds_map_add(weapons[weapontype],"secondaryshellbouncehspmax",-4);
			
			ds_map_add(weapons[weapontype],"secondaryshellbouncevspmin",-3);
			ds_map_add(weapons[weapontype],"secondaryshellbouncevspmax",-5);
		#endregion
	#endregion

	#region Muzzleflash
		#region Primary
			ds_map_add(weapons[weapontype],"primarymuzzleflash",true);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashxoffset",55);
			ds_map_add(weapons[weapontype],"primarymuzzleflashyoffset",-8);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashxscale",2);
			ds_map_add(weapons[weapontype],"primarymuzzleflashyscale",2);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashalpha",0.8);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashsprite",sMuzzleflashPistol);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashspritespeed",1);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondarymuzzleflash",true);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashxoffset",55);
			ds_map_add(weapons[weapontype],"secondarymuzzleflashyoffset",-8);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashxscale",2);
			ds_map_add(weapons[weapontype],"secondarymuzzleflashyscale",2);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashalpha",0.8);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashsprite",sMuzzleflashPistol);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashspritespeed",1);
		#endregion
	#endregion

	#region Crosshair
		ds_map_add(weapons[weapontype],"crosshairxoffset",0);
		ds_map_add(weapons[weapontype],"crosshairyoffset",10);
		
		ds_map_add(weapons[weapontype],"crosshairxscale",2);
		ds_map_add(weapons[weapontype],"crosshairyscale",2);
		
		ds_map_add(weapons[weapontype],"crosshairsprite",sCrosshair);
		
		ds_map_add(weapons[weapontype],"crosshairdistance",120);
		
		ds_map_add(weapons[weapontype],"crosshairironsightspeed",0.5);
		
		ds_map_add(weapons[weapontype],"crosshairironsightdistance",125);
		#region Primary
			ds_map_add(weapons[weapontype],"primarycrosshairshakemagnitudemin",2);
			ds_map_add(weapons[weapontype],"primarycrosshairshakemagnitudemax",2);
		
			ds_map_add(weapons[weapontype],"primarycrosshairshakelengthmin",5);
			ds_map_add(weapons[weapontype],"primarycrosshairshakelengthmax",5);
		
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakemagnitudemin",1);
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakemagnitudemax",1);
		
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakelengthmin",5);
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakelengthmax",5);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondarycrosshairshakemagnitudemin",2);
			ds_map_add(weapons[weapontype],"secondarycrosshairshakemagnitudemax",2);
			
			ds_map_add(weapons[weapontype],"secondarycrosshairshakelengthmin",10);
			ds_map_add(weapons[weapontype],"secondarycrosshairshakelengthmax",10);
			
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakemagnitudemin",2);
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakemagnitudemax",2);
		
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakelengthmin",5);
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakelengthmax",5);
		#endregion
	#endregion
#endregion

#region Shotgun (2)
	var weapontype = weapontypes.shotgun;
	weapons[weapontype] = ds_map_create();
	#region Weapon
		#region Position
			ds_map_add(weapons[weapontype],"xoffset",-4);
			ds_map_add(weapons[weapontype],"yoffset",16);
			
			ds_map_add(weapons[weapontype],"crouchxoffset",-4);
			ds_map_add(weapons[weapontype],"crouchyoffset",16);
		
			ds_map_add(weapons[weapontype],"xscale",2);
			ds_map_add(weapons[weapontype],"yscale",2);
		
			ds_map_add(weapons[weapontype],"xfollowspeed",0.9);
			ds_map_add(weapons[weapontype],"yfollowspeed",0.9);
		
			ds_map_add(weapons[weapontype],"primaryrecoilmin",0);
			ds_map_add(weapons[weapontype],"primaryrecoilmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryrecoilmin",0);
			ds_map_add(weapons[weapontype],"secondaryrecoilmax",0);
		
			ds_map_add(weapons[weapontype],"distance",0);
		
			ds_map_add(weapons[weapontype],"ironsightspeed",0.5);
		
			ds_map_add(weapons[weapontype],"ironsightdistance",-1);
		
			ds_map_add(weapons[weapontype],"primaryironsightrecoilmin",0);
			ds_map_add(weapons[weapontype],"primaryironsightrecoilmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryironsightrecoilmin",0);
			ds_map_add(weapons[weapontype],"secondaryironsightrecoilmax",0);
		#endregion

		#region Sprites
			#region Left Side Sprites
				ds_map_add(weapons[weapontype],"spriteleft",sWeaponShotgunLeft);
				
				ds_map_add(weapons[weapontype],"spriteprimaryleft",sWeaponShotgunPrimaryLeft);
				
				ds_map_add(weapons[weapontype],"spritesecondaryleft",sWeaponShotgunLeft);
				
				ds_map_add(weapons[weapontype],"spritepumpleft",sWeaponShotgunPumpLeft);
				
				ds_map_add(weapons[weapontype],"spritestartupleft",-1);
				
				ds_map_add(weapons[weapontype],"spritereloadleft",sWeaponShotgunReloadLeft);
				
				ds_map_add(weapons[weapontype],"spriteemptyleft",sWeaponShotgunLeft);
			#endregion
			#region Right Side Sprites
				ds_map_add(weapons[weapontype],"spriteright",sWeaponShotgunRight);
				
				ds_map_add(weapons[weapontype],"spriteprimaryright",sWeaponShotgunPrimaryRight);
				
				ds_map_add(weapons[weapontype],"spritesecondaryright",sWeaponShotgunRight);
				
				ds_map_add(weapons[weapontype],"spritepumpright",sWeaponShotgunPumpRight);
				
				ds_map_add(weapons[weapontype],"spritestartupright",-1);
				
				ds_map_add(weapons[weapontype],"spritereloadright",sWeaponShotgunReloadRight);
				
				ds_map_add(weapons[weapontype],"spriteemptyright",sWeaponShotgunRight);
			#endregion
			#region Left Side Arm Sprites
				ds_map_add(weapons[weapontype],"armspriteleft",sArmShotgunLeft);
				
				ds_map_add(weapons[weapontype],"armspriteprimaryleft",sArmShotgunPrimaryLeft);
				
				ds_map_add(weapons[weapontype],"armspritesecondaryleft",sArmShotgunLeft);
				
				ds_map_add(weapons[weapontype],"armspritepumpleft",sArmShotgunPumpLeft);
				
				ds_map_add(weapons[weapontype],"armspritestartupleft",-1);
				
				ds_map_add(weapons[weapontype],"armspritereloadleft",sArmShotgunReloadLeft);
				
				ds_map_add(weapons[weapontype],"armspriteemptyleft",sArmShotgunRight);
			#endregion
			#region Right Side Arm Sprites
				ds_map_add(weapons[weapontype],"armspriteright",sArmShotgunRight);
				
				ds_map_add(weapons[weapontype],"armspriteprimaryright",sArmShotgunPrimaryRight);
				
				ds_map_add(weapons[weapontype],"armspritesecondaryright",sArmShotgunRight);
				
				ds_map_add(weapons[weapontype],"armspritepumpright",sArmShotgunPumpRight);
				
				ds_map_add(weapons[weapontype],"armspritestartupright",-1);
				
				ds_map_add(weapons[weapontype],"armspritereloadright",sArmShotgunReloadRight);
				
				ds_map_add(weapons[weapontype],"armspriteemptyright",sArmShotgunRight);
			#endregion
			#region Sprite Speed
				ds_map_add(weapons[weapontype],"spritespeed",1);
				
				ds_map_add(weapons[weapontype],"spriteprimaryspeed",1);
				
				ds_map_add(weapons[weapontype],"spritesecondaryspeed",1);
				
				ds_map_add(weapons[weapontype],"spritepumpspeed",1);
				
				ds_map_add(weapons[weapontype],"spritestartupspeed",1);
				
				ds_map_add(weapons[weapontype],"spritereloadspeed",1);
				
				ds_map_add(weapons[weapontype],"spriteemptyspeed",1);
			#endregion
			#region Sprite Looping
				ds_map_add(weapons[weapontype],"spriteprimarylooping",false);
				
				ds_map_add(weapons[weapontype],"spritesecondarylooping",false);
				
				ds_map_add(weapons[weapontype],"spritepumplooping",false);
				
				ds_map_add(weapons[weapontype],"spritestartuplooping",false);
				
				ds_map_add(weapons[weapontype],"spritereloadlooping",false);
				
				ds_map_add(weapons[weapontype],"spriteemptylooping",false);
			#endregion
		#endregion

		#region Rotation/Angle
			ds_map_add(weapons[weapontype],"rspeed",0.25);
			
			ds_map_add(weapons[weapontype],"hspminmaxangle",75);
			ds_map_add(weapons[weapontype],"wallminmaxangle",60);
		#endregion

		#region Types
			ds_map_add(weapons[weapontype],"primaryfiremodetype",firemodetypes.pumpautomatic);
			ds_map_add(weapons[weapontype],"secondaryfiremodetype",firemodetypes.single);
			
			ds_map_add(weapons[weapontype],"aimsidetype",aimsidetypes.weapondirection);
		#endregion

		#region Delay
			ds_map_add(weapons[weapontype],"switchdelay",20);
			
			ds_map_add(weapons[weapontype],"reloaddelay",50);
			
			ds_map_add(weapons[weapontype],"primarystartup",0);
			ds_map_add(weapons[weapontype],"primarycooldownmin",44);
			ds_map_add(weapons[weapontype],"primarycooldownmax",46);
			
			ds_map_add(weapons[weapontype],"secondarystartup",0);
			ds_map_add(weapons[weapontype],"secondarycooldownmin",0);
			ds_map_add(weapons[weapontype],"secondarycooldownmax",0);
		#endregion

		#region Ammo
			ds_map_add(weapons[weapontype],"primaryammo",18);
			ds_map_add(weapons[weapontype],"primaryreservedammo",82);
			ds_map_add(weapons[weapontype],"primaryammospent",1);
			
			ds_map_add(weapons[weapontype],"secondaryammo",0); //-1 means use primary ammo
			ds_map_add(weapons[weapontype],"secondaryammospent",0);
		#endregion

		#region Spread
			ds_map_add(weapons[weapontype],"primaryspreadmin",-10);
			ds_map_add(weapons[weapontype],"primaryspreadmax",10);
			
			ds_map_add(weapons[weapontype],"primaryironsightspreadmin",-5);
			ds_map_add(weapons[weapontype],"primaryironsightspreadmax",5);
			
			ds_map_add(weapons[weapontype],"secondaryspreadmin",0);
			ds_map_add(weapons[weapontype],"secondaryspreadmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryironsightspreadmin",0);
			ds_map_add(weapons[weapontype],"secondaryironsightspreadmax",0);
		#endregion

		#region Kickback
			ds_map_add(weapons[weapontype],"primarykickbackxmin",-1.5);
			ds_map_add(weapons[weapontype],"primarykickbackxmax",-1.8);
				
			ds_map_add(weapons[weapontype],"primarykickbackymin",0);
			ds_map_add(weapons[weapontype],"primarykickbackymax",0);

			ds_map_add(weapons[weapontype],"secondarykickbackxmin",0);
			ds_map_add(weapons[weapontype],"secondarykickbackxmax",0);
				
			ds_map_add(weapons[weapontype],"secondarykickbackymin",0);
			ds_map_add(weapons[weapontype],"secondarykickbackymax",0);
		#endregion

		#region Damage
			ds_map_add(weapons[weapontype],"primarydamage",8);
			ds_map_add(weapons[weapontype],"secondarydamage",0);
		#endregion

		#region Sound
			#region Sounds
				ds_map_add(weapons[weapontype],"soundprimary",snd_WeaponShotgunPrimary);
				
				ds_map_add(weapons[weapontype],"soundsecondary",-1);
				
				ds_map_add(weapons[weapontype],"soundpump",snd_WeaponShotgunPump);
				
				ds_map_add(weapons[weapontype],"soundstartup",-1);
				
				ds_map_add(weapons[weapontype],"soundreload",-1);
				
				ds_map_add(weapons[weapontype],"soundempty",snd_WeaponPistolEmpty);
			#endregion
			#region Gain
				ds_map_add(weapons[weapontype],"soundprimarygainmin",0.2);
				ds_map_add(weapons[weapontype],"soundprimarygainmax",0.2);
				
				ds_map_add(weapons[weapontype],"soundsecondarygainmin",1);
				ds_map_add(weapons[weapontype],"soundsecondarygainmax",1);
				
				ds_map_add(weapons[weapontype],"soundpumpgainmin",0.2);
				ds_map_add(weapons[weapontype],"soundpumpgainmax",0.2);
				
				ds_map_add(weapons[weapontype],"soundstartupgainmin",1);
				ds_map_add(weapons[weapontype],"soundstartupgainmax",1);
				
				ds_map_add(weapons[weapontype],"soundreloadgainmin",1);
				ds_map_add(weapons[weapontype],"soundreloadgainmax",1);
				
				ds_map_add(weapons[weapontype],"soundemptygainmin",1);
				ds_map_add(weapons[weapontype],"soundemptygainmax",1);
			#endregion
			#region Pitch
				ds_map_add(weapons[weapontype],"soundprimarypitchmin",1);
				ds_map_add(weapons[weapontype],"soundprimarypitchmax",1);
				
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
	#endregion

	#region Camera
		#region Primary
			ds_map_add(weapons[weapontype],"primarycamerashakemagnitudemin",2);
			ds_map_add(weapons[weapontype],"primarycamerashakemagnitudemax",2.4);
		
			ds_map_add(weapons[weapontype],"primarycamerashakelengthmin",2);
			ds_map_add(weapons[weapontype],"primarycamerashakelengthmax",2.2);
		
			ds_map_add(weapons[weapontype],"primarycameraironsightshakemagnitudemin",2.2);
			ds_map_add(weapons[weapontype],"primarycameraironsightshakemagnitudemax",2);
		
			ds_map_add(weapons[weapontype],"primarycameraironsightshakelengthmin",2);
			ds_map_add(weapons[weapontype],"primarycameraironsightshakelengthmax",1.8);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondarycamerashakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"secondarycamerashakemagnitudemax",0);
			
			ds_map_add(weapons[weapontype],"secondarycamerashakelengthmin",0);
			ds_map_add(weapons[weapontype],"secondarycamerashakelengthmax",0);
			
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakemagnitudemax",0);
		
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakelengthmin",0);
			ds_map_add(weapons[weapontype],"secondarycameraironsightshakelengthmax",0);
		#endregion
	#endregion

	#region Projectile
		#region Primary
			ds_map_add(weapons[weapontype],"primaryprojectile",oBullet);//oHitscan);
		
			ds_map_add(weapons[weapontype],"primaryprojectilexoffset",28);
			ds_map_add(weapons[weapontype],"primaryprojectileyoffset",-8);
		
			ds_map_add(weapons[weapontype],"primaryprojectilexscale",2);
			ds_map_add(weapons[weapontype],"primaryprojectileyscale",2);
		
			ds_map_add(weapons[weapontype],"primaryprojectilesprite",sBulletPistol);
		
			ds_map_add(weapons[weapontype],"primaryprojectileamount",3);
		
			ds_map_add(weapons[weapontype],"primaryprojectilelifemin",200);
			ds_map_add(weapons[weapontype],"primaryprojectilelifemax",200);
		
			ds_map_add(weapons[weapontype],"primaryprojectilealphalength",40);
		
			ds_map_add(weapons[weapontype],"primaryprojectilespeedmin",20);
			ds_map_add(weapons[weapontype],"primaryprojectilespeedmax",25);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondaryprojectile",-1);//oHitscan);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilexoffset",0);
			ds_map_add(weapons[weapontype],"secondaryprojectileyoffset",0);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilexscale",1);
			ds_map_add(weapons[weapontype],"secondaryprojectileyscale",1);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilesprite",-1);
		
			ds_map_add(weapons[weapontype],"secondaryprojectileamount",0);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilelifemin",0);
			ds_map_add(weapons[weapontype],"secondaryprojectilelifemax",0);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilealphalength",0);
		
			ds_map_add(weapons[weapontype],"secondaryprojectilespeedmin",0);
			ds_map_add(weapons[weapontype],"secondaryprojectilespeedmax",0);
		#endregion
	#endregion

	#region Hitspark
		#region Primary
			ds_map_add(weapons[weapontype],"primaryhitspark",oHitspark);
			
			ds_map_add(weapons[weapontype],"primaryhitsparkxscale",1);
			ds_map_add(weapons[weapontype],"primaryhitsparkyscale",1);
			
			ds_map_add(weapons[weapontype],"primaryhitsparkalpha",0.5);
			
			ds_map_add(weapons[weapontype],"primaryhitsparksprite",sHitspark);
			
			ds_map_add(weapons[weapontype],"primaryhitsparkspritespeed",1);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondaryhitspark",-1);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparkxscale",1);
			ds_map_add(weapons[weapontype],"secondaryhitsparkyscale",1);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparkalpha",1);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparksprite",-1);
			
			ds_map_add(weapons[weapontype],"secondaryhitsparkspritespeed",1);
		#endregion
	#endregion

	#region Shell
		#region Primary
			ds_map_add(weapons[weapontype],"primaryshell",oShell);
			
			ds_map_add(weapons[weapontype],"primaryshellxoffset",28);
			ds_map_add(weapons[weapontype],"primaryshellyoffset",-8);
			
			ds_map_add(weapons[weapontype],"primaryshellxscale",1);
			ds_map_add(weapons[weapontype],"primaryshellyscale",1);
			
			ds_map_add(weapons[weapontype],"primaryshellsprite",sShellShotgun);
			
			ds_map_add(weapons[weapontype],"primaryshellamount",1);
			
			ds_map_add(weapons[weapontype],"primaryshelllifemin",200);
			ds_map_add(weapons[weapontype],"primaryshelllifemax",200);
			
			ds_map_add(weapons[weapontype],"primaryshellalphalength",40);
			
			ds_map_add(weapons[weapontype],"primaryshellhspmin",-3);
			ds_map_add(weapons[weapontype],"primaryshellhspmax",-4);
			
			ds_map_add(weapons[weapontype],"primaryshellvspmin",-4);
			ds_map_add(weapons[weapontype],"primaryshellvspmax",-5);
			
			ds_map_add(weapons[weapontype],"primaryshellgrv",0.3);
			
			ds_map_add(weapons[weapontype],"primaryshellbouncehspmin",-1);
			ds_map_add(weapons[weapontype],"primaryshellbouncehspmax",-4);
			
			ds_map_add(weapons[weapontype],"primaryshellbouncevspmin",-3);
			ds_map_add(weapons[weapontype],"primaryshellbouncevspmax",-5);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondaryshell",-1);
			
			ds_map_add(weapons[weapontype],"secondaryshellxoffset",0);
			ds_map_add(weapons[weapontype],"secondaryshellyoffset",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellxscale",1);
			ds_map_add(weapons[weapontype],"secondaryshellyscale",1);
			
			ds_map_add(weapons[weapontype],"secondaryshellsprite",-1);
			
			ds_map_add(weapons[weapontype],"secondaryshellamount",0);
			
			ds_map_add(weapons[weapontype],"secondaryshelllifemin",0);
			ds_map_add(weapons[weapontype],"secondaryshelllifemax",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellalphalength",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellhspmin",0);
			ds_map_add(weapons[weapontype],"secondaryshellhspmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellvspmin",0);
			ds_map_add(weapons[weapontype],"secondaryshellvspmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellgrv",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellbouncehspmin",0);
			ds_map_add(weapons[weapontype],"secondaryshellbouncehspmax",0);
			
			ds_map_add(weapons[weapontype],"secondaryshellbouncevspmin",0);
			ds_map_add(weapons[weapontype],"secondaryshellbouncevspmax",0);
		#endregion
	#endregion

	#region Muzzleflash
		#region Primary
			ds_map_add(weapons[weapontype],"primarymuzzleflash",true);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashxoffset",55);
			ds_map_add(weapons[weapontype],"primarymuzzleflashyoffset",-8);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashxscale",2);
			ds_map_add(weapons[weapontype],"primarymuzzleflashyscale",2);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashalpha",0.8);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashsprite",sMuzzleflash);
			
			ds_map_add(weapons[weapontype],"primarymuzzleflashspritespeed",1);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondarymuzzleflash",false);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashxoffset",0);
			ds_map_add(weapons[weapontype],"secondarymuzzleflashyoffset",0);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashxscale",1);
			ds_map_add(weapons[weapontype],"secondarymuzzleflashyscale",1);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashalpha",1);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashsprite",-1);
			
			ds_map_add(weapons[weapontype],"secondarymuzzleflashspritespeed",1);
		#endregion
	#endregion

	#region Crosshair
		ds_map_add(weapons[weapontype],"crosshairxoffset",0);
		ds_map_add(weapons[weapontype],"crosshairyoffset",10);
		
		ds_map_add(weapons[weapontype],"crosshairxscale",2);
		ds_map_add(weapons[weapontype],"crosshairyscale",2);
		
		ds_map_add(weapons[weapontype],"crosshairsprite",sCrosshair);
		
		ds_map_add(weapons[weapontype],"crosshairdistance",120);
		
		ds_map_add(weapons[weapontype],"crosshairironsightspeed",0.5);
		
		ds_map_add(weapons[weapontype],"crosshairironsightdistance",125);
		#region Primary
			ds_map_add(weapons[weapontype],"primarycrosshairshakemagnitudemin",2);
			ds_map_add(weapons[weapontype],"primarycrosshairshakemagnitudemax",2);
		
			ds_map_add(weapons[weapontype],"primarycrosshairshakelengthmin",5);
			ds_map_add(weapons[weapontype],"primarycrosshairshakelengthmax",5);
		
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakemagnitudemin",1);
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakemagnitudemax",1);
		
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakelengthmin",5);
			ds_map_add(weapons[weapontype],"primarycrosshairironsightshakelengthmax",5);
		#endregion
		#region Secondary
			ds_map_add(weapons[weapontype],"secondarycrosshairshakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"secondarycrosshairshakemagnitudemax",0);
			
			ds_map_add(weapons[weapontype],"secondarycrosshairshakelengthmin",0);
			ds_map_add(weapons[weapontype],"secondarycrosshairshakelengthmax",0);
			
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakemagnitudemin",0);
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakemagnitudemax",0);
		
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakelengthmin",0);
			ds_map_add(weapons[weapontype],"secondarycrosshairironsightshakelengthmax",0);
		#endregion
	#endregion
#endregion

/*
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
ds_map_add(weapons[weapontype],"kickbackxmin",-1.5);
ds_map_add(weapons[weapontype],"kickbackxmax",-1.8);
ds_map_add(weapons[weapontype],"kickbackymin",-1);
ds_map_add(weapons[weapontype],"kickbackymax",-1.5);
ds_map_add(weapons[weapontype],"damage",8);
ds_map_add(weapons[weapontype],"switchdelay",20);
ds_map_add(weapons[weapontype],"startup",0);
ds_map_add(weapons[weapontype],"cooldownmin",44);
ds_map_add(weapons[weapontype],"cooldownmax",46);
ds_map_add(weapons[weapontype],"firemodetype",firemodetypes.pumpautomatic);
ds_map_add(weapons[weapontype],"aimsidetype",aimsidetypes.weapondirection);
ds_map_add(weapons[weapontype],"distance",0);
ds_map_add(weapons[weapontype],"spreadmin",-10);
ds_map_add(weapons[weapontype],"spreadmax",10);
ds_map_add(weapons[weapontype],"ironsightspeed",0.5);
ds_map_add(weapons[weapontype],"ironsightdistance",-1);
ds_map_add(weapons[weapontype],"ironsightrecoilmin",0);
ds_map_add(weapons[weapontype],"ironsightrecoilmax",0);
ds_map_add(weapons[weapontype],"ironsightspreadmin",-8);
ds_map_add(weapons[weapontype],"ironsightspreadmax",8);
#endregion
#region Projectile
ds_map_add(weapons[weapontype],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[weapontype],"projectilexoffset",25);
ds_map_add(weapons[weapontype],"projectileyoffset",-2);
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
ds_map_add(weapons[weapontype],"shellxoffset",15);
ds_map_add(weapons[weapontype],"shellyoffset",-1);
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
ds_map_add(weapons[weapontype],"muzzleflashxoffset",41);
ds_map_add(weapons[weapontype],"muzzleflashyoffset",-3);
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
*/

pointx = 0;
pointy = 0;
pointdir = 0;
aimside = 1;
stopattack = false;
ironsights = false;
delta = 0;
weapon = 0;
switchdelay = 20;
lastxoffset = 0;
lastyoffset = 0;
primaryattack = false;
secondaryattack = false;
reloading = false;

//currentprimaryammo = -1; is infinite ammo
currentprimaryammo[array_length(weapons)-1] = 0; // Default Primary ammo
currentprimaryreservedammo[array_length(weapons)-1] = 0; // Default Primary reserved ammo
//currentprimaryammo[0] = -1; // Set unarmed currentprimaryammo
currentsecondaryammo[array_length(weapons)-1] = 0; // Default Secondary ammo

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
currentattacktype = 0;
currentfiremodetype = 0;
currentreloaddelay = 0;

SetWeapon(weapontypes.unarmed);

currentweapon = weapon;

test = 0;
