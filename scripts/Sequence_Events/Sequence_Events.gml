// Auto-generated stubs for each available event.

function sqSplash_Moment()
{
	TransitionStart(rMenu,sqFadeOut,sqFadeIn);
}

function sqSplash_event_step()
{
	if (keyboard_check(vk_anykey) || mouse_check_button(mb_any)) sqSplash_Moment();
}

function sqEnd_Moment()
{
	game_end();
}
