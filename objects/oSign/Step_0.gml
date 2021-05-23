if (instance_exists(oPlayer)) && (point_in_circle(oPlayer.x,oPlayer.y,x,y,32)) && (!instance_exists(oText))
{
	nearby = true;
	if (global.key_interact_pressed)
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
		global.hascontrol = false;
		oPlayer.hsp = 0;
	}
}else nearby = false;

if (nearby)
{
	image_speed = 1;
}
else
{
	image_speed = 0;
	image_index = 0;
}

if (instance_exists(oText)) && (oText.letters <= oText.length)
{
	image_speed = 0;
	image_index = 0;
}
