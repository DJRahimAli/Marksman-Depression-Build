xscale = 2;
yscale = 2;

image_xscale = xscale;
image_yscale = yscale;

hsp = 0;
hspnodec = 0;
hspfrac = 0;
hspfricground = 0.15;
hspfricair = 0.02;

vsp = 0;
vspnodec = 0;
vspfrac = 0;
vspmax = 20;
vspmaxwall = 2;

jumpheight = 6;
jumpheightcrouch = jumpheight;
jumpheightwall = 5;
jumpheightmulti = 3.5;
jumpheightspring = 10;

multijump = 0;
currentmultijump = 0;

accel = 0.4;
walksp = 4;
walkspcrouch = 2;
currentwalksp = 0;

onground = false;
onwall = 0;

walltouching = false;
wallsliding = false;

dust = 0;

grv = 0.2;
grvwall = grv;

jumpbuffer = 5;
currentjumpbuffer = 0;

crouch = false;
crouchstuck = false;

moving = false;

hp = 100;
currenthp = hp;
lasthp = currenthp;
drawnhp = currenthp;

hitfrom = 0;

suicide = false;

flash = 0;

kickbackx = 0;
kickbacky = 0;

walljumpheight = 0;

walljumpdelay = 20;
currentwalljumpdelay = 0;

walljumpbuffer = 5;
currentwalljumpbuffer = 0;

walljumpdirection = 0;

aimside = 1;

playertrail = true;

movedir = 0;

healthbarwidth = 100;
healthbarheight = 12;

healthbarx = (RES_W/2) - (healthbarwidth/2);
healthbary = (RES_H/2);

//test = 0;

global.hascontrol = true;

if (!file_exists(SAVEFILE)) SaveGame();

var file = file_text_open_read(SAVEFILE);
var ignore = file_text_read_real(file);
var ignore2 = file_text_read_real(file);
if (global.levelchanging == false)
{
	global.hasweapon = file_text_read_real(file);
	x = file_text_read_real(file);
	y = file_text_read_real(file);
}
file_text_close(file);
