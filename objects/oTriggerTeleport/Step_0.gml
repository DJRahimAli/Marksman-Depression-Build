var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget != noone) && (currenttriggerdelay == 0)
{
	currenttriggerdelay = triggerdelay;
	{
		x = targetx;
		y = targety;
	}
}

currenttriggerdelay = max(0,currenttriggerdelay-1);
