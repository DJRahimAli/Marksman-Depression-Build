draw_set_color(c_white);
if os_windows
{
	/*var s;
	s = string_format(current_time / 1000, 0, 1) + "s"
	    + "#Try things:"
	    + "#1: Enable border"
	    + "#2: Disable border"
	    + "#3: Toggle fulscreen"
	    + "#4: Minimize"
	    + "#T: Toggle stay-on-top"
	    + "#Size: " + string(window_get_width()) + "x" + string(window_get_height());
	draw_text(0, 0, string_hash_to_newline(s));*/
	if (keyboard_check_pressed(ord("1"))) window_frame_set_visible(true);
	if (keyboard_check_pressed(ord("2"))) window_frame_set_visible(false);
	if (keyboard_check_pressed(ord("3"))) window_frame_set_fullscreen(!window_get_fullscreen());
	if (keyboard_check_pressed(ord("4"))) window_command_run(window_command_minimize);
	if (keyboard_check_pressed(ord("T"))) window_set_topmost(!window_get_topmost());
}
