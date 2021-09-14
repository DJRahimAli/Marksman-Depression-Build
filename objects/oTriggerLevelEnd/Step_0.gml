/// @desc Move to next room

/*
Trigger delay can be used to add a delay after the Trigger fires.

You can set the Trigger delay to -1 to make the Trigger fire once until the Trigger object isn't colliding.

You can set the Trigger delay to -2 to make the Trigger fire only once.

You can set the Trigger delay to -3 to make the Trigger fire forever every frame.
*/

var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget == noone) && (currenttriggerdelay == -1) currenttriggerdelay = 0;

if (triggertarget != noone) && (currenttriggerdelay == 0 || currenttriggerdelay == -3)
{
	currenttriggerdelay = triggerdelay;
	TransitionStart(target,sqFadeOut,sqFadeIn);
	global.hascontrol = false;
}

if (currenttriggerdelay >= 0) currenttriggerdelay = max(0,currenttriggerdelay-1);
