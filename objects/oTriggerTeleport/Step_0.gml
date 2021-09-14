var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget != noone) && (currenttriggertimer == 0)
{
	currenttriggertimer = triggertimer;
	{
		x = targetx;
		y = targety;
	}
}

currenttriggertimer = max(0,currenttriggertimer-1);
