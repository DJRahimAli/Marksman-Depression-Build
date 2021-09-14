var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget != noone) && (currenttriggertimer == 0)
{
	currenttriggertimer = triggertimer;
	instance_destroy(triggerdestroytarget);
}

currenttriggertimer = max(0,currenttriggertimer-1);
