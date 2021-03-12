/// @desc Size variables and mode setup

w = 0;
h = 0;
h_half = 0;

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
