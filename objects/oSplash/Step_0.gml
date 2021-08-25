image_alpha = currentfadecountdown/alphalength;

if (currentfadecountdown == fadecountdown) fadeindone = true;

if (currentfadecountdown != fadecountdown) && (!fadeindone) currentfadecountdown++;

if (fadeindone) currentfadecountdown--;

if (image_alpha == 1) && (!fadeindone) audio_play_sound(snd_Splash,1,false);

if (currentfadecountdown == -50) && (fadeindone) || (keyboard_check(vk_anykey) || mouse_check_button(mb_any))
{
	audio_stop_sound(snd_Splash);
	room_goto_next();
}
