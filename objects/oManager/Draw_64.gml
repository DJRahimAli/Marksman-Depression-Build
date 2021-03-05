//Debug UI
if global.debug
{
draw_set_color(c_white);
draw_text(0,0,   "Player Variables:              | ");
draw_text(0,1*15,"| X Coordinates                | " + string(oPlayer.x));
draw_text(0,2*15,"| Y Coordinates                | " + string(oPlayer.y));
draw_text(0,3*15,"| Horizontal Speed             | " + string(oPlayer.hsp));
draw_text(0,4*15,"| Horizontal Speed No Decimals | " + string(oPlayer.hspstr));
draw_text(0,5*15,"| Vertical Speed               | " + string(oPlayer.vsp));
draw_text(0,6*15,"| Gravity                      | " + string(oPlayer.grv));
draw_text(0,7*15,"| Walk Speed                   | " + string(oPlayer.walksp));
draw_text(0,8*15,"| Acceleration                 | " + string(oPlayer.accel));
draw_text(0,9*15,"| Crouch                       | " + string(oPlayer.crouch));

draw_text(0,10*15,"| Crouch Stuck                 | " + string(oPlayer.crouchstuck));
draw_text(0,11*15,"|                              |");
draw_text(0,12*15,"Controller Variables:          | ");
draw_text(0,13*15,"| Controller                   | " + string(oPlayer.controller));
draw_text(0,14*15,"| Deadzone                     | " + string(oPlayer.deadzone));
draw_text(0,15*15,"| Controller Angle             | " + string(oWeapon.controllerangle));
draw_text(0,16*15,"|                              |");
draw_text(0,17*15,"Weapon Variables:              | ");
draw_text(0,18*15,"| Firing Delay                 | " + string(oWeapon.firingdelay));
draw_text(0,19*15,"| Recoil                       | " + string(oWeapon.recoil));
draw_text(0,20*15,"| Stop Shooting                | " + string(oWeapon.stopshooting));
draw_text(0,21*15,"| Bullet Count                 | " + string(instance_number(oBullet)));
draw_text(0,22*15,"|                              |");
draw_text(0,23*15,"Camera Variables:              |");
draw_text(0,24*15,"| Camera                       | " + string(oCamera.cam));
draw_text(0,25*15,"| Camera Following             | " + string(oCamera.follow));
draw_text(0,26*15,"| Camera View Width Half       | " + string(oCamera.view_w_half));
draw_text(0,27*15,"| Camera View Height Half      | " + string(oCamera.view_h_half));
draw_text(0,28*15,"| Camera X To                  | " + string(oCamera.xTo));
draw_text(0,29*15,"| Camera X To                  | " + string(oCamera.xTo));
draw_text(0,30*15,"| Camera Clamp                 | " + string(oCamera.camclamp));
draw_text(0,31*15,"|                              |");
draw_text(0,32*15,"Cheat Variables:               |");
draw_text(0,33*15,"| Cheats                       | " + string(global.cheat));
draw_text(0,34*15,"| Fly Mode                     | " + string(global.fly));
draw_text(1200,0, "| FPS " + string(fps));
draw_text(1200,15,"| Real FPS " + string(fps_real));
}
