//Particle System
particleSystem = part_system_create();

particleType_Player_Fade = part_type_create();

part_type_size(particleType_Player_Fade,1,1,0,0);

part_type_life(particleType_Player_Fade,5,5);
part_type_alpha3(particleType_Player_Fade,0.3,0.2,0.1)

part_system_depth(particleType_Player_Fade,oPlayer.depth+50);
