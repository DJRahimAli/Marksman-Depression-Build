hsp = 0;
vsp = 0;
grv = 0.3;
done = 0;

image_speed = 0;
image_index = 0;

//ScreenShake(6,60);
Shake(6,60,oCamera);
audio_play_sound(snd_PlayerDeath,10,false);
//game_set_speed(30,gamespeed_fps);
with (oCamera) follow = other.id;
