image_alpha = currentfadecountdown/alphalength;

if (currentfadecountdown != fadecountdown) && (!fadeindone) currentfadecountdown++;

if (currentfadecountdown != 0) && (fadeindone) currentfadecountdown--;

if (currentfadecountdown == fadecountdown) fadeindone = true;

if (image_alpha == 1) && (!fadeindone) audio_play_sound(snd_Splash,1,false);

if (currentfadecountdown == 0) && (fadeindone) room_goto_next();

if (keyboard_check(vk_anykey) || mouse_check_button(mb_any))
{
	currentfadecountdown = 0;
	fadeindone = true;
	audio_stop_sound(snd_Splash);
}
