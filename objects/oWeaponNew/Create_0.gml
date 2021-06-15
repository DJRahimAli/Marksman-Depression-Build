image_speed = 0;
image_index = 0;

//instance_create_layer(x,y,"Crosshair",oCrosshair);
instance_create_layer(x,y,"Weapon",oMuzzleFlash);

//unarmed
weapons[0] = ds_map_create();
ds_map_add(weapons[0],"sprite",-1);
ds_map_add(weapons[0],"recoil",0);
ds_map_add(weapons[0],"spreadmin",0);
ds_map_add(weapons[0],"spreadmax",0);
ds_map_add(weapons[0],"ironsight",0);
ds_map_add(weapons[0],"ironsigtrecoil",0);
ds_map_add(weapons[0],"ironsightspreadmin",0);
ds_map_add(weapons[0],"ironsightspreadmax",0);
ds_map_add(weapons[0],"kickback",0);
ds_map_add(weapons[0],"damage",0);
ds_map_add(weapons[0],"projectile",-1);
ds_map_add(weapons[0],"projectilelength",0);
ds_map_add(weapons[0],"shell",-1);
ds_map_add(weapons[0],"shellejectlength",0);
ds_map_add(weapons[0],"startup",0);
ds_map_add(weapons[0],"distance",0);
ds_map_add(weapons[0],"cooldown",0);
ds_map_add(weapons[0],"bulletspeed",0);
ds_map_add(weapons[0],"automatic",false);

//pistol
weapons[1] = ds_map_create();
ds_map_add(weapons[1],"sprite",sWeaponPistol);
ds_map_add(weapons[1],"recoil",3);
ds_map_add(weapons[1],"spreadmin",-2);
ds_map_add(weapons[1],"spreadmax",3);
ds_map_add(weapons[1],"ironsight",1);
ds_map_add(weapons[1],"ironsightrecoil",3);
ds_map_add(weapons[1],"ironsightspreadmin",-1);
ds_map_add(weapons[1],"ironsightspreadmax",2);
ds_map_add(weapons[1],"kickback",1.5);
ds_map_add(weapons[1],"damage",8);
ds_map_add(weapons[1],"projectile",oBullet);
ds_map_add(weapons[1],"projectilelength",24);
ds_map_add(weapons[1],"shell",oShell);
ds_map_add(weapons[1],"shellejectlength",0);
ds_map_add(weapons[1],"startup",0);
ds_map_add(weapons[1],"distance",40);
ds_map_add(weapons[1],"cooldown",15);
ds_map_add(weapons[1],"bulletspeed",25);
ds_map_add(weapons[1],"automatic",false);

//submachine gun
weapons[2] = ds_map_create();
ds_map_add(weapons[2],"sprite",sWeaponPistol);
ds_map_add(weapons[2],"recoil",3);
ds_map_add(weapons[2],"spreadmin",-2);
ds_map_add(weapons[2],"spreadmax",3);
ds_map_add(weapons[2],"ironsight",1);
ds_map_add(weapons[2],"ironsightrecoil",3);
ds_map_add(weapons[2],"ironsightspreadmin",-1);
ds_map_add(weapons[2],"ironsightspreadmax",2);
ds_map_add(weapons[2],"kickback",1.5);
ds_map_add(weapons[2],"damage",8);
ds_map_add(weapons[2],"projectile",oBullet);//oHitscan);
ds_map_add(weapons[2],"projectilelength",24);
ds_map_add(weapons[2],"shell",oShell);
ds_map_add(weapons[2],"shellejectlength",0);
ds_map_add(weapons[2],"startup",0);
ds_map_add(weapons[2],"distance",40);
ds_map_add(weapons[2],"cooldown",15);
ds_map_add(weapons[2],"bulletspeed",25);
ds_map_add(weapons[2],"automatic",true);

weapon = 0;
ammo[array_length_1d(weapons)-1] = 0;
ammo[0] = -1;

ChangeWeapon(2);

currentcd = 0;
currentdelay = -1;
currentrecoil = 0;
currentprimaryammo = 0;
currentsecondaryammo = 0;
