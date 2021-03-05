/// @desc Size variables and mode setup

w = display_get_gui_width();
h = display_get_gui_height();
h_half = h * 0.5;
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