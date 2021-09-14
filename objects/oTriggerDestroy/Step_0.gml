var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget != noone) && (currenttriggerdelay == 0)
{
	currenttriggerdelay = triggerdelay;
	instance_destroy(triggerdestroytarget);
}

currenttriggerdelay = max(0,currenttriggerdelay-1);
