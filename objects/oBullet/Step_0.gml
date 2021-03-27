if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall)) || bulletlife == 0 instance_destroy();

bulletlife--;
image_alpha = bulletlife/40;
