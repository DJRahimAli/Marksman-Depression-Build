var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget == noone) && (currenttriggerdelay == -1) currenttriggerdelay = 0;

if (triggertarget != noone) && (currenttriggerdelay == 0)
{
	currenttriggerdelay = triggerdelay;
	{
		x = targetx;
		y = targety;
	}
}

if (currenttriggerdelay != -1) currenttriggerdelay = max(0,currenttriggerdelay-1);
