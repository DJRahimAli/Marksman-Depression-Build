image_alpha = 0.8;

with (instance_create_depth(x,y,depth-1,oDPadOutline))
{
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}

with (instance_create_depth(x,y,depth-2,oDPadUp))
{
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}

with (instance_create_depth(x,y,depth-2,oDPadDown))
{
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}

with (instance_create_depth(x,y,depth-2,oDPadLeft))
{
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}

with (instance_create_depth(x,y,depth-2,oDPadRight))
{
	image_xscale = other.image_xscale;
	image_yscale = other.image_yscale;
}
