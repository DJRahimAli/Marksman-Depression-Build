if instance_exists(oPlayer) image_index = oPlayer.image_index;

if instance_exists(oPlayerDead) image_index = oPlayerDead.image_index;

if (oPlayer.moving) instance_create_layer(x,y,"Entities",oParticle)

if particlelife == 0 || image_alpha < 0 instance_destroy();

particlelife--;
image_alpha = particlelife/particlealphalength;
