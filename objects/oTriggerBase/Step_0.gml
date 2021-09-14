/* Trigger delay can be used to add a delay after the Trigger fires. */

/* You can make the Trigger fire once until the Trigger object isn't colliding by setting the Trigger delay to -1 */

/* You can also make the Trigger fire only once by setting the Trigger delay to -2 */

var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget == noone) && (currenttriggerdelay == -1) currenttriggerdelay = 0;

if (triggertarget != noone) && (currenttriggerdelay == 0)
{
	currenttriggerdelay = triggerdelay;
	//Do thing
	//Example: with (triggertarget) instance_destroy();
}

if (currenttriggerdelay >= 0) currenttriggerdelay = max(0,currenttriggerdelay-1);
