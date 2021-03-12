/// @desc Size variables and mode setup
if os_windows
{
	w = 0;
	h = 0;
	h_half = 0;
}
else
{
	w = display_get_gui_width();
	h = display_get_gui_height();
	h_half = h * 0.5;
}

enum TRANS_MODE
{
	OFF,
	NEXT,
	GOTO,
	RESTART,
	QUIT,
	INTRO
}
mode = TRANS_MODE.INTRO;
percent = 1;
percenttarget = 1.2;
target = room;
