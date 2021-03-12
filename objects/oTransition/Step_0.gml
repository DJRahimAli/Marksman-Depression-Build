/// @desc Progress the transition
if os_windows && (window_frame_get_visible())
{
	w = window_get_width();
	h = window_get_height();
	h_half = h * 0.5;
}

if (mode != TRANS_MODE.OFF)
{
	if (mode == TRANS_MODE.INTRO)
	{
		//percent = max(0,percent-0.05);
		percent = max(0,percent - max((percent/10),0.005));
	}
	else
	{
		//percent = min(1,percent+0.05);
		percent = min(percenttarget,percent + max(((percenttarget - percent)/10),0.005));
	}
	
	if (percent == percenttarget) || (percent == 0)
	{
		switch (mode)
		{
			case TRANS_MODE.INTRO:
			{
				mode = TRANS_MODE.OFF;
				break;
			}
			case TRANS_MODE.NEXT:
			{
				mode = TRANS_MODE.INTRO;
				room_goto_next();
				break;
			}
			case TRANS_MODE.GOTO:
			{
				mode = TRANS_MODE.INTRO;
				room_goto(target);
				break;
			}
			case TRANS_MODE.RESTART:
			{
				game_restart();
				break;
			}
			case TRANS_MODE.QUIT:
			{
				game_end();
				break;
			}
		}
	}
}


