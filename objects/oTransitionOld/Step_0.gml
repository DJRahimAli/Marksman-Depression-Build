/// @desc Progress the transition

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
		percent = min(percenttarget,percent + max(((percenttarget - percent)/15),0.005));
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
				//game_restart();
				mode = TRANS_MODE.INTRO;
				global.levelchanging = false;
				global.hasweapon = false;
				global.kills = 0;
				global.killsthisroom = 0;
				global.hp = 100;
				global.hascontrol = true;
				room_goto(rMenu);
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


