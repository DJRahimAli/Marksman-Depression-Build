var triggertarget = instance_place(x,y,triggerobject);

if (triggertarget != noone)
{
	with (triggertarget) instance_destroy();
}
