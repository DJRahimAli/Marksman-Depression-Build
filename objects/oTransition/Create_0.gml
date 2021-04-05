/// @desc Size variables and mode setup

w = RES_W;
h = RES_H;
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
