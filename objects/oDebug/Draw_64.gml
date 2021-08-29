//Draw FPS UI
if (global.debugfps)
{
	DrawSetText(c_black, fText, fa_right, fa_top);
	draw_text(RES_W-0.5+2,0.3+2,(string(fps) + " / " + string(room_speed) + " FPS"));
	draw_text(RES_W-0.5+2,20.3+2,(string(fps_real) + " Real FPS"));
	draw_text(RES_W-0.5+2,40.3+2,(string(instance_count) + " Instance Count"));
	draw_set_colour(MakeColorHSVTransition(fps, room_speed, 0, 100, 255, 255, 255, 255));
	draw_text(RES_W-0.5,0.3,(string(fps) + " / " + string(room_speed) + " FPS"));
	draw_set_colour(c_white);
	draw_text(RES_W-0.5,20.3,(string(fps_real) + " Real FPS"));
	draw_text(RES_W-0.5,40.3,(string(instance_count) + " Instance Count"));
}
