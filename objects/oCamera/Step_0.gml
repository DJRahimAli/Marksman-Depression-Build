/// @description Update camera

//Update destination
if (instance_exists(follow))
{
	xTo = follow.x;
	yTo = follow.y;
	
	if ((follow).object_index = oPlayerDead)
	{
		x = xTo;
		y = yTo;
	}
}

//Update object position
x += (xTo - x) / 10 //25;
y += (yTo - y) / 10 //25;

//Keep camera center inside room
if (camclamp)
{
	x = clamp(x,view_w_half+buff,room_width-view_w_half-buff);
	y = clamp(y,view_h_half+buff,room_height-view_h_half-buff);
}

//Screen shake
x += random_range(-shake_remain,shake_remain);
y += random_range(-shake_remain,shake_remain);
shake_remain = max(0,shake_remain-((1/shake_length)*shake_magnitude));

//Update camera view
view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);
view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;

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
}
