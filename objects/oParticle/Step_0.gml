if instance_exists(oPlayer) image_index = oPlayer.image_index;

if instance_exists(oPlayerDead) image_index = oPlayerDead.image_index;

if particlelife = 0 instance_destroy();

particlelife--;
image_alpha = particlelife/40;
