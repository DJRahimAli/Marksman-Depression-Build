image_alpha = 0;
image_speed = 0;
image_index = 0;

//if (oPlayer.controller == false) image_angle = point_direction(x,y,mouse_x,mouse_y);

firingdelay = 0;
recoil = 0;
pointdir = 0;
mouseangle = 0;
controllerangle = 0;

stopshooting = false;
holstered = false;

ironsights = false;

weapondistance = 40;
weaponcrouchdistance = 0;
weaponcrouchdistancerate = 5;

instance_create_layer(x,y,"Crosshair",oCrosshair);
//instance_create_layer(x,y,"Weapon",oMuzzleflash);

x += lengthdir_x(weapondistance-weaponcrouchdistance-recoil,image_angle);
y += lengthdir_y(weapondistance-weaponcrouchdistance-recoil,image_angle);

delta = 0;
minmaxangle = 60;
rspeed = 0.25; // Max = 1 or else things will glitch the fuck out
currentrspeed = 0;

if (global.hasweapon == false) instance_destroy();

//test = false;
