/// @arg weaponid

function SetWeapon(argument0)
{
	weapon = argument0;
	var wp_map = weapons[weapon];
	//sprite = ds_map_find_value(wp_map,"sprite");
	#region Weapon
		#region Position
			xoffset = wp_map[? "xoffset"];
			yoffset = wp_map[? "yoffset"];
			
			crouchxoffset = wp_map[? "crouchxoffset"];
			crouchyoffset = wp_map[? "crouchyoffset"];
		
			xscale = wp_map[? "xscale"];
			yscale = wp_map[? "yscale"];
		
			xfollowspeed = wp_map[? "xfollowspeed"];
			yfollowspeed = wp_map[? "yfollowspeed"];
		
			primaryrecoilmin = wp_map[? "primaryrecoilmin"];
			primaryrecoilmax = wp_map[? "primaryrecoilmax"];
			
			secondaryrecoilmin = wp_map[? "secondaryrecoilmin"];
			secondaryrecoilmax = wp_map[? "secondaryrecoilmax"];
		
			distance = wp_map[? "distance"];
		
			ironsightspeed = wp_map[? "ironsightspeed"];
		
			ironsightdistance = wp_map[? "ironsightdistance"];
		
			primaryironsightrecoilmin = wp_map[? "primaryironsightrecoilmin"];
			primaryironsightrecoilmax = wp_map[? "primaryironsightrecoilmax"];
			
			secondaryironsightrecoilmin = wp_map[? "secondaryironsightrecoilmin"];
			secondaryironsightrecoilmax = wp_map[? "secondaryironsightrecoilmax"];
		#endregion
		
		#region Sprites
			#region Left Side Sprites
				spriteleft = wp_map[? "spriteleft"];
				
				spriteprimaryleft = wp_map[? "spriteprimaryleft"];
				
				spritesecondaryleft = wp_map[? "spritesecondaryleft"];
				
				spritepumpleft = wp_map[? "spritepumpleft"];
				
				spritestartupleft = wp_map[? "spritestartupleft"];
				
				spritereloadleft = wp_map[? "spritereloadleft"];
				
				spriteemptyleft = wp_map[? "spriteemptyleft"];
			#endregion
			#region Right Side Sprites
				spriteright = wp_map[? "spriteright"];
				
				spriteprimaryright = wp_map[? "spriteprimaryright"];
				
				spritesecondaryright = wp_map[? "spritesecondaryright"];
				
				spritepumpright = wp_map[? "spritepumpright"];
				
				spritestartupright = wp_map[? "spritestartupright"];
				
				spritereloadright = wp_map[? "spritereloadright"];
				
				spriteemptyright = wp_map[? "spriteemptyright"];
			#endregion
			#region Left Side Arm Sprites
				armspriteleft = wp_map[? "armspriteleft"];
				
				armspriteprimaryleft = wp_map[? "armspriteprimaryleft"];
				
				armspritesecondaryleft = wp_map[? "armspritesecondaryleft"];
				
				armspritepumpleft = wp_map[? "armspritepumpleft"];
				
				armspritestartupleft = wp_map[? "armspritestartupleft"];
				
				armspritereloadleft = wp_map[? "armspritereloadleft"];
				
				armspriteemptyleft = wp_map[? "armspriteemptyleft"];
			#endregion
			#region Right Side Arm Sprites
				armspriteright = wp_map[? "armspriteright"];
				
				armspriteprimaryright = wp_map[? "armspriteprimaryright"];
				
				armspritesecondaryright = wp_map[? "armspritesecondaryright"];
				
				armspritepumpright = wp_map[? "armspritepumpright"];
				
				armspritestartupright = wp_map[? "armspritestartupright"];
				
				armspritereloadright = wp_map[? "armspritereloadright"];
				
				armspriteemptyright = wp_map[? "armspriteemptyright"];
			#endregion
			#region Sprite Speed
				spritespeed = wp_map[? "spritespeed"];
				
				spriteprimaryspeed = wp_map[? "spriteprimaryspeed"];
				
				spritesecondaryspeed = wp_map[? "spritesecondaryspeed"];
				
				spritepumpspeed = wp_map[? "spritepumpspeed"];
				
				spritestartupspeed = wp_map[? "spritestartupspeed"];
				
				spritereloadspeed = wp_map[? "spritereloadspeed"];
				
				spriteemptyspeed = wp_map[? "spriteemptyspeed"];
			#endregion
			#region Sprite Looping
				spriteprimarylooping = wp_map[? "spriteprimarylooping"];
				
				spritesecondarylooping = wp_map[? "spritesecondarylooping"];
				
				spritepumplooping = wp_map[? "spritepumplooping"];
				
				spritestartuplooping = wp_map[? "spritestartuplooping"];
				
				spritereloadlooping = wp_map[? "spritereloadlooping"];
				
				spriteemptylooping = wp_map[? "spriteemptylooping"];
			#endregion
		#endregion
		
		#region Rotation/Angle
			rspeed = wp_map[? "rspeed"];
			
			hspminmaxangle = wp_map[? "hspminmaxangle"];
			wallminmaxangle = wp_map[? "wallminmaxangle"];
		#endregion
		
		#region Types
			primaryfiremodetype = wp_map[? "primaryfiremodetype"];
			secondaryfiremodetype = wp_map[? "secondaryfiremodetype"];
			
			aimsidetype = wp_map[? "aimsidetype"];
		#endregion
		
		#region Delay
			switchdelay = wp_map[? "switchdelay"];
			#region Primary
				primarystartup = wp_map[? "primarystartup"];
				
				primarycooldownmin = wp_map[? "primarycooldownmin"];
				primarycooldownmax = wp_map[? "primarycooldownmax"];
			#endregion
			#region Secondary
				secondarystartup = wp_map[? "secondarystartup"];
				
				secondarycooldownmin = wp_map[? "secondarycooldownmin"];
				secondarycooldownmax = wp_map[? "secondarycooldownmax"];
			#endregion
		#endregion
		
		#region Ammo
			primaryammo = wp_map[? "primaryammo"];
			primaryreservedammo = wp_map[? "primaryreservedammo"];
			primaryammospent = wp_map[? "primaryammospent"];
			
			secondaryammo = wp_map[? "secondaryammo"];
			secondaryammospent = wp_map[? "secondaryammospent"];
		#endregion
		
		#region Spread
			#region Primary
				primaryspreadmin = wp_map[? "primaryspreadmin"];
				primaryspreadmax = wp_map[? "primaryspreadmax"];
				
				primaryironsightspreadmin = wp_map[? "primaryironsightspreadmin"];
				primaryironsightspreadmax = wp_map[? "primaryironsightspreadmax"];
			#endregion
			#region Secondary
				secondaryspreadmin = wp_map[? "secondaryspreadmin"];
				secondaryspreadmax = wp_map[? "secondaryspreadmax"];
				
				secondaryironsightspreadmin = wp_map[? "secondaryironsightspreadmin"];
				secondaryironsightspreadmax = wp_map[? "secondaryironsightspreadmax"];
			#endregion
		#endregion
		
		#region Kickback
			#region Primary
				primarykickbackxmin = wp_map[? "primarykickbackxmin"];
				primarykickbackxmax = wp_map[? "primarykickbackxmax"];
				
				primarykickbackymin = wp_map[? "primarykickbackymin"];
				primarykickbackymax = wp_map[? "primarykickbackymax"];
			#endregion
			#region Secondary
				secondarykickbackxmin = wp_map[? "secondarykickbackxmin"];
				secondarykickbackxmax = wp_map[? "secondarykickbackxmax"];
				
				secondarykickbackymin = wp_map[? "secondarykickbackymin"];
				secondarykickbackymax = wp_map[? "secondarykickbackymax"];
			#endregion
		#endregion
		
		#region Damage
			primarydamage = wp_map[? "primarydamage"];
			secondarydamage = wp_map[? "secondarydamage"];
		#endregion
		
		#region Sound
			#region Sounds
				soundprimary = wp_map[? "soundprimary"];
				
				soundsecondary = wp_map[? "soundsecondary"];
				
				soundpump = wp_map[? "soundpump"];
				
				soundstartup = wp_map[? "soundstartup"];
				
				soundreload = wp_map[? "soundreload"];
				
				soundempty = wp_map[? "soundempty"];
			#endregion
			#region Gain
				soundprimarygainmin = wp_map[? "soundprimarygainmin"];
				soundprimarygainmax = wp_map[? "soundprimarygainmax"];
				
				soundsecondarygainmin = wp_map[? "soundsecondarygainmin"];
				soundsecondarygainmax = wp_map[? "soundsecondarygainmax"];
				
				soundpumpgainmin = wp_map[? "soundpumpgainmin"];
				soundpumpgainmax = wp_map[? "soundpumpgainmax"];
				
				soundstartupgainmin = wp_map[? "soundstartupgainmin"];
				soundstartupgainmax = wp_map[? "soundstartupgainmax"];
				
				soundsecondarygainmin = wp_map[? "soundsecondarygainmin"];
				soundsecondarygainmax = wp_map[? "soundsecondarygainmax"];
				
				soundemptygainmin = wp_map[? "soundemptygainmin"];
				soundemptygainmax = wp_map[? "soundemptygainmax"];
			#endregion
			#region Pitch
				soundprimarypitchmin = wp_map[? "soundprimarypitchmin"];
				soundprimarypitchmax = wp_map[? "soundprimarypitchmax"];
				
				soundsecondarypitchmin = wp_map[? "soundsecondarypitchmin"];
				soundsecondarypitchmax = wp_map[? "soundsecondarypitchmax"];
				
				soundpumppitchmin = wp_map[? "soundpumppitchmin"];
				soundpumppitchmax = wp_map[? "soundpumppitchmax"];
				
				soundstartuppitchmin = wp_map[? "soundstartuppitchmin"];
				soundstartuppitchmax = wp_map[? "soundstartuppitchmax"];
				
				soundsecondarypitchmin = wp_map[? "soundsecondarypitchmin"];
				soundsecondarypitchmax = wp_map[? "soundsecondarypitchmax"];
				
				soundemptypitchmin = wp_map[? "soundemptypitchmin"];
				soundemptypitchmax = wp_map[? "soundemptypitchmax"];
			#endregion
		#endregion
	#endregion
	
	#region Camera
		#region Primary
			primarycamerashakemagnitudemin = wp_map[? "primarycamerashakemagnitudemin"];
			primarycamerashakemagnitudemax = wp_map[? "primarycamerashakemagnitudemax"];
			
			primarycamerashakelengthmin = wp_map[? "primarycamerashakelengthmin"];
			primarycamerashakelengthmax = wp_map[? "primarycamerashakelengthmax"];
			
			primarycameraironsightshakemagnitudemin = wp_map[? "primarycameraironsightshakemagnitudemin"];
			primarycameraironsightshakemagnitudemax = wp_map[? "primarycameraironsightshakemagnitudemax"];
			
			primarycameraironsightshakelengthmin = wp_map[? "primarycameraironsightshakelengthmin"];
			primarycameraironsightshakelengthmax = wp_map[? "primarycameraironsightshakelengthmax"];
		#endregion
		#region Secondary
			secondarycamerashakemagnitudemin = wp_map[? "secondarycamerashakemagnitudemin"];
			secondarycamerashakemagnitudemax = wp_map[? "secondarycamerashakemagnitudemax"];
			
			secondarycamerashakelengthmin = wp_map[? "secondarycamerashakelengthmin"];
			secondarycamerashakelengthmax = wp_map[? "secondarycamerashakelengthmax"];
			
			secondarycameraironsightshakemagnitudemin = wp_map[? "secondarycameraironsightshakemagnitudemin"];
			secondarycameraironsightshakemagnitudemax = wp_map[? "secondarycameraironsightshakemagnitudemax"];
			
			secondarycameraironsightshakelengthmin = wp_map[? "secondarycameraironsightshakelengthmin"];
			secondarycameraironsightshakelengthmax = wp_map[? "secondarycameraironsightshakelengthmax"];
		#endregion
	#endregion
	
	#region Projectile
		#region Primary
			primaryprojectile = wp_map[? "primaryprojectile"];
		
			primaryprojectilexoffset = wp_map[? "primaryprojectilexoffset"];
			primaryprojectileyoffset = wp_map[? "primaryprojectileyoffset"];
		
			primaryprojectilexscale = wp_map[? "primaryprojectilexscale"];
			primaryprojectileyscale = wp_map[? "primaryprojectileyscale"];
		
			primaryprojectilesprite = wp_map[? "primaryprojectilesprite"];
		
			primaryprojectileamount = wp_map[? "primaryprojectileamount"];
		
			primaryprojectilelifemin = wp_map[? "primaryprojectilelifemin"];
			primaryprojectilelifemax = wp_map[? "primaryprojectilelifemax"];
		
			primaryprojectilealphalength = wp_map[? "primaryprojectilealphalength"];
		
			primaryprojectilespeedmin = wp_map[? "primaryprojectilespeedmin"];
			primaryprojectilespeedmax = wp_map[? "primaryprojectilespeedmax"];
		#endregion
		#region Secondary
			secondaryprojectile = wp_map[? "secondaryprojectile"];
		
			secondaryprojectilexoffset = wp_map[? "secondaryprojectilexoffset"];
			secondaryprojectileyoffset = wp_map[? "secondaryprojectileyoffset"];
		
			secondaryprojectilexscale = wp_map[? "secondaryprojectilexscale"];
			secondaryprojectileyscale = wp_map[? "secondaryprojectileyscale"];
		
			secondaryprojectilesprite = wp_map[? "secondaryprojectilesprite"];
		
			secondaryprojectileamount = wp_map[? "secondaryprojectileamount"];
		
			secondaryprojectilelifemin = wp_map[? "secondaryprojectilelifemin"];
			secondaryprojectilelifemax = wp_map[? "secondaryprojectilelifemax"];
		
			secondaryprojectilealphalength = wp_map[? "secondaryprojectilealphalength"];
		
			secondaryprojectilespeedmin = wp_map[? "secondaryprojectilespeedmin"];
			secondaryprojectilespeedmax = wp_map[? "secondaryprojectilespeedmax"];
		#endregion
	#endregion
	
	#region Hitspark
		#region Primary
			primaryhitspark = wp_map[? "primaryhitspark"];
			
			primaryhitsparkxscale = wp_map[? "primaryhitsparkxscale"];
			primaryhitsparkyscale = wp_map[? "primaryhitsparkyscale"];
			
			primaryhitsparkalpha = wp_map[? "primaryhitsparkalpha"];
			
			primaryhitsparksprite = wp_map[? "primaryhitsparksprite"];
			
			primaryhitsparkspritespeed = wp_map[? "primaryhitsparkspritespeed"];
		#endregion
		#region Secondary
			secondaryhitspark = wp_map[? "secondaryhitspark"];
			
			secondaryhitsparkxscale = wp_map[? "secondaryhitsparkxscale"];
			secondaryhitsparkyscale = wp_map[? "secondaryhitsparkyscale"];
			
			secondaryhitsparkalpha = wp_map[? "secondaryhitsparkalpha"];
			
			secondaryhitsparksprite = wp_map[? "secondaryhitsparksprite"];
			
			secondaryhitsparkspritespeed = wp_map[? "secondaryhitsparkspritespeed"];
		#endregion
	#endregion
	
	#region Shell
		#region Primary
			primaryshell = wp_map[? "primaryshell"];
			
			primaryshellxoffset = wp_map[? "primaryshellxoffset"];
			primaryshellyoffset = wp_map[? "primaryshellyoffset"];
			
			primaryshellxscale = wp_map[? "primaryshellxscale"];
			primaryshellyscale = wp_map[? "primaryshellyscale"];
			
			primaryshellsprite = wp_map[? "primaryshellsprite"];
			
			primaryshellamount = wp_map[? "primaryshellamount"];
			
			primaryshelllifemin = wp_map[? "primaryshelllifemin"];
			primaryshelllifemax = wp_map[? "primaryshelllifemax"];
			
			primaryshellalphalength = wp_map[? "primaryshellalphalength"];
			
			primaryshellhspmin = wp_map[? "primaryshellhspmin"];
			primaryshellhspmax = wp_map[? "primaryshellhspmax"];
			
			primaryshellvspmin = wp_map[? "primaryshellvspmin"];
			primaryshellvspmax = wp_map[? "primaryshellvspmax"];
			
			primaryshellgrv = wp_map[? "primaryshellgrv"];
			
			primaryshellbouncehspmin = wp_map[? "primaryshellbouncehspmin"];
			primaryshellbouncehspmax = wp_map[? "primaryshellbouncehspmax"];
			
			primaryshellbouncevspmin = wp_map[? "primaryshellbouncevspmin"];
			primaryshellbouncevspmax = wp_map[? "primaryshellbouncevspmax"];
		#endregion
		#region Secondary
			secondaryshell = wp_map[? "secondaryshell"];
			
			secondaryshellxoffset = wp_map[? "secondaryshellxoffset"];
			secondaryshellyoffset = wp_map[? "secondaryshellyoffset"];
			
			secondaryshellxscale = wp_map[? "secondaryshellxscale"];
			secondaryshellyscale = wp_map[? "secondaryshellyscale"];
			
			secondaryshellsprite = wp_map[? "secondaryshellsprite"];
			
			secondaryshellamount = wp_map[? "secondaryshellamount"];
			
			secondaryshelllifemin = wp_map[? "secondaryshelllifemin"];
			secondaryshelllifemax = wp_map[? "secondaryshelllifemax"];
			
			secondaryshellalphalength = wp_map[? "secondaryshellalphalength"];
			
			secondaryshellhspmin = wp_map[? "secondaryshellhspmin"];
			secondaryshellhspmax = wp_map[? "secondaryshellhspmax"];
			
			secondaryshellvspmin = wp_map[? "secondaryshellvspmin"];
			secondaryshellvspmax = wp_map[? "secondaryshellvspmax"];
			
			secondaryshellgrv = wp_map[? "secondaryshellgrv"];
			
			secondaryshellbouncehspmin = wp_map[? "secondaryshellbouncehspmin"];
			secondaryshellbouncehspmax = wp_map[? "secondaryshellbouncehspmax"];
			
			secondaryshellbouncevspmin = wp_map[? "secondaryshellbouncevspmin"];
			secondaryshellbouncevspmax = wp_map[? "secondaryshellbouncevspmax"];
		#endregion
	#endregion
	
	#region Muzzleflash
		#region Primary
			primarymuzzleflash = wp_map[? "primarymuzzleflash"];
			
			primarymuzzleflashxoffset = wp_map[? "primarymuzzleflashxoffset"];
			primarymuzzleflashyoffset = wp_map[? "primarymuzzleflashyoffset"];
			
			primarymuzzleflashxscale = wp_map[? "primarymuzzleflashxscale"];
			primarymuzzleflashyscale = wp_map[? "primarymuzzleflashyscale"];
			
			primarymuzzleflashalpha = wp_map[? "primarymuzzleflashalpha"];
			
			primarymuzzleflashsprite = wp_map[? "primarymuzzleflashsprite"];
			
			primarymuzzleflashspritespeed = wp_map[? "primarymuzzleflashspritespeed"];
		#endregion
		#region Secondary
			secondarymuzzleflash = wp_map[? "secondarymuzzleflash"];
			
			secondarymuzzleflashxoffset = wp_map[? "secondarymuzzleflashxoffset"];
			secondarymuzzleflashyoffset = wp_map[? "secondarymuzzleflashyoffset"];
			
			secondarymuzzleflashxscale = wp_map[? "secondarymuzzleflashxscale"];
			secondarymuzzleflashyscale = wp_map[? "secondarymuzzleflashyscale"];
			
			secondarymuzzleflashalpha = wp_map[? "secondarymuzzleflashalpha"];
			
			secondarymuzzleflashsprite = wp_map[? "secondarymuzzleflashsprite"];
			
			secondarymuzzleflashspritespeed = wp_map[? "secondarymuzzleflashspritespeed"];
		#endregion
	#endregion
	
	#region Crosshair
		crosshairxoffset = wp_map[? "crosshairxoffset"];
		crosshairyoffset = wp_map[? "crosshairyoffset"];
			
		crosshairxscale = wp_map[? "crosshairxscale"];
		crosshairyscale = wp_map[? "crosshairyscale"];
			
		crosshairsprite = wp_map[? "crosshairsprite"];
			
		crosshairdistance = wp_map[? "crosshairdistance"];
		
		crosshairironsightspeed = wp_map[? "crosshairironsightspeed"];
			
		crosshairironsightdistance = wp_map[? "crosshairironsightdistance"];
		#region Primary
			primarycrosshairshakemagnitudemin = wp_map[? "primarycrosshairshakemagnitudemin"];
			primarycrosshairshakemagnitudemax = wp_map[? "primarycrosshairshakemagnitudemax"];
			
			primarycrosshairshakelengthmin = wp_map[? "primarycrosshairshakelengthmin"];
			primarycrosshairshakelengthmax = wp_map[? "primarycrosshairshakelengthmax"];
			
			primarycrosshairironsightshakemagnitudemin = wp_map[? "primarycrosshairironsightshakemagnitudemin"];
			primarycrosshairironsightshakemagnitudemax = wp_map[? "primarycrosshairironsightshakemagnitudemax"];
			
			primarycrosshairironsightshakelengthmin = wp_map[? "primarycrosshairironsightshakelengthmin"];
			primarycrosshairironsightshakelengthmax = wp_map[? "primarycrosshairironsightshakelengthmax"];
		#endregion
		#region Secondary
			secondarycrosshairshakemagnitudemin = wp_map[? "secondarycrosshairshakemagnitudemin"];
			secondarycrosshairshakemagnitudemax = wp_map[? "secondarycrosshairshakemagnitudemax"];
			
			secondarycrosshairshakelengthmin = wp_map[? "secondarycrosshairshakelengthmin"];
			secondarycrosshairshakelengthmax = wp_map[? "secondarycrosshairshakelengthmax"];
			
			secondarycrosshairironsightshakemagnitudemin = wp_map[? "secondarycrosshairironsightshakemagnitudemin"];
			secondarycrosshairironsightshakemagnitudemax = wp_map[? "secondarycrosshairironsightshakemagnitudemax"];
			
			secondarycrosshairironsightshakelengthmin = wp_map[? "secondarycrosshairironsightshakelengthmin"];
			secondarycrosshairironsightshakelengthmax = wp_map[? "secondarycrosshairironsightshakelengthmax"];
		#endregion
	#endregion
	
	currentcd = 0;
	currentdelay = -1;
	if (oPlayer.crouch)
	{
		currentxoffset = crouchxoffset*aimside;
		currentyoffset = crouchyoffset;
	}
	else
	{
		currentxoffset = xoffset*aimside;
		currentyoffset = yoffset;
	}
	animationplaying = false;
	animationlooping = false;
	animstate = animstates.idle;
	//if (aimside) image_angle = 300; else image_angle = 240;
	image_xscale = xscale;
	image_yscale = yscale;
}
        