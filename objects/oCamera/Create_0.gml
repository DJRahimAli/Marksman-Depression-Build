/// @description Set up camera
cam = view_camera[0];
follow = oPlayer;
view_w = camera_get_view_width(cam);
view_h = camera_get_view_height(cam);
orig_view_w = view_w;
orig_view_h = view_h;
view_w_half = view_w * 0.5;
view_h_half = view_h * 0.5;
xTo = xstart;
yTo = ystart;
camclamp = true;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;

skyscraperslayer = layer_get_id("Skyscrapers");
buildingslayer = layer_get_id("Buildings");
cloudslayer = layer_get_id("Clouds");

cloud_x = 0;

zoom = 1;
zoomsp = 0.015;
