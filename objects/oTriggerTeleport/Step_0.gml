var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget == noone) && (currenttriggerdelay == -1) currenttriggerdelay = 0;

if (triggertarget != noone) && (currenttriggerdelay == 0)
{
	currenttriggerdelay = triggerdelay;
	with (triggerteleporttarget)
	{
		x = targetx;
		y = targety;
	}
}

if (currenttriggerdelay >= 0) currenttriggerdelay = max(0,currenttriggerdelay-1);
