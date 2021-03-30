if (place_meeting(x,y,oWall)) || (place_meeting(x,y,oBulletWall)) || image_alpha < 0 instance_destroy();

bulletlife--;
image_alpha = bulletlife/bulletalphalength;
