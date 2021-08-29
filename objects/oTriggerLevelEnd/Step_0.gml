/// @desc Move to next room

var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget != noone)
{
	TransitionStart(target,sqFadeOut,sqFadeIn);
	global.hascontrol = false;
}
