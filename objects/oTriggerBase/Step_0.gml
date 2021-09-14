var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget == noone) && (currenttriggerdelay == -1) currenttriggerdelay = 0;

if (triggertarget != noone) && (currenttriggerdelay == 0)
{
	currenttriggerdelay = triggerdelay;
	//Do thing
	//Example: with (triggertarget) instance_destroy();
}

currenttriggerdelay = max(0,currenttriggerdelay-1);
