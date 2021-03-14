/// @desc Footsteps!
if (sprite_index == sPlayerR) || (sprite_index == sPlayerRC)
{
	//audio_play_sound(choose(snd_Foot1,snd_Foot2,snd_Foot3,snd_Foot4),1,false);
	audio_sound_pitch(snd_Landing,(choose(0.98,1.0,1.2)));
	audio_play_sound(snd_Landing,5,false);
}