var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget != noone) && (currenttriggertimer == 0)
{
	currenttriggertimer = triggertimer;
	//Do thing
	//Example: with (target) instance_destroy();
}

currenttriggertimer = max(0,currenttriggertimer-1);
