/// @desc Move to next room

var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget != noone) && (currenttriggertimer == 0)
{
	currenttriggertimer = triggertimer;
	TransitionStart(target,sqFadeOut,sqFadeIn);
	global.hascontrol = false;
}
