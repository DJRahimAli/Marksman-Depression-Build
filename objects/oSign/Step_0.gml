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
	
	if (point_in_circle(oPlayer.x,oPlayer.y,x,y,64)) && (!instance_exists(oText))
	{
		image_speed = 1;
	}
	else
	{
		image_speed = 0;
		image_index = 1;
	}
	
	if (instance_exists(oText)) && (oText.letters <= oText.length)
	{
		image_speed = 0;
		image_index = 0;
	}
}
else
{
	image_speed = 0;
	image_index = 1;
}
