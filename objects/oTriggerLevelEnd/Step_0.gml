/// @desc Move to next room

var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget != noone)
{
	SlideTransition(TRANS_MODE.GOTO,target);
	global.hascontrol = false;
}
