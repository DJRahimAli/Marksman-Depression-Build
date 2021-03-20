if(instance_exists(oPlayer))
{
if (oPlayer.key_interact)
{
	if (point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) && (!instance_exists(oText))
	{
		with (instance_create_layer(x,y-64,layer,oText))
		{
			text = other.text;
			length = string_length(text);
		}
		
		with (oCamera)
		{
			follow = other.id;
		}
		
		oPlayer.hascontrol = 0;
	}
}
	if (!instance_exists(oText))
	{
		oPlayer.hascontrol = 1;
	}
}
