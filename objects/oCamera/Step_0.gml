/// @description Update camera

//Update destination
if (instance_exists(follow))
{
	/*if (global.controller == 0)
	{
		xTo = mean(follow.x, follow.x, mouse_x);
		yTo = mean(follow.y, follow.y, mouse_y);

		if (point_distance(follow.x,follow.y,xTo,yTo) > maxdistance)
		{
			var dir = point_direction(follow.x,follow.y,xTo,yTo);
			xTo = follow.x + lengthdir_x(maxdistance, dir);
			yTo = follow.y + lengthdir_y(maxdistance, dir);
		}
	}*/

	xTo = follow.x;
	yTo = follow.y;

	if ((follow).object_index = oPlayerDead)
	{
		x = xTo;
		y = yTo;
	}
}

//Update object position
x += (xTo - x) / 5 //25;
y += (yTo - y) / 5 //25;

//Keep camera center inside room
if (room != rMenu)
{
	if (camclamp)
	{
		x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
		y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);
	}
}
else
{
	if (camclamp)
	{
		x = clamp(x,view_w_half,room_width-view_w_half);
		y = clamp(y,view_h_half,room_height-view_h_half);
	}
}

//Screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);
view_w_half = view_w/2;
view_h_half = view_h/2;

camera_set_view_pos(cam,x-view_w_half,y-view_h_half);

camera_set_view_size(cam,orig_view_w*zoom,orig_view_h*zoom);

if (room != rMenu) && (room != rEnding)
{
	if (layer_exists(skyscraperslayer))
	{
		layer_x(skyscraperslayer,x/2);
	}

	if (layer_exists(buildingslayer))
	{
		layer_x(buildingslayer,x/4);
	}
	
	if (layer_exists(cloudslayer))
	{
		cloud_x += 0.3;
		layer_x(cloudslayer,(x/2) + cloud_x);
	}
}
