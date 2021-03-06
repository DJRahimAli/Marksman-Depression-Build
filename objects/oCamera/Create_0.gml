/// @description Set up camera
cam = view_camera[0];
follow = oPlayer;
view_w_half = camera_get_view_width(cam) * 0.5;
view_h_half = camera_get_view_height(cam) * 0.5;
xTo = xstart;
yTo = ystart;
camclamp = true;

shake_length = 0;
shake_magnitude = 0;
shake_remain = 0;
buff = 32;

skyscraperslayer = layer_get_id("Skyscrapers");
buildingslayer = layer_get_id("Buildings");
