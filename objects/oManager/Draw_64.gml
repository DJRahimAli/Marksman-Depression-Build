draw_set_color(c_white);

var s;
s = "Debug Menu"
    + "#Player Variables:"
    + "#X Coordinates: " + string(oPlayer.x)
    + "#Y Coordinates: " + string(oPlayer.y)
    + "#Horizontal Speed: " + string(oPlayer.hsp)
    + "#Horizontal Speed No Decimals: " + string(oPlayer.hspstr)
    + "#Vertical Speed: " + string(oPlayer.vsp)
    + "#Gravity: " + string(oPlayer.grv)
    + "#Walk Speed: " + string(oPlayer.walksp)
    + "#Acceleration: " + string(oPlayer.accel)
    + "#Crouch: " + string(oPlayer.crouch)
    + "#Crouch Stuck:| " + string(oPlayer.crouchstuck)
    + "#Controller Variables: "
    + "#Controller: " + string(oPlayer.controller)
    + "#Deadzone: " + string(oPlayer.deadzone)
    + "#Controller Angle: " + string(oWeapon.controllerangle)
    + "#Weapon Variables: "
    + "#Firing Delay: " + string(oWeapon.firingdelay)
    + "#Recoil: " + string(oWeapon.recoil)
    + "#Stop Shooting: " + string(oWeapon.stopshooting)
    + "#Bullet Count: " + string(instance_number(oBullet))
    + "#Camera Variables:"
    + "#Camera: " + string(oCamera.cam)
    + "#Camera Following: " + string(oCamera.follow)
    + "#Camera View Width Half: " + string(oCamera.view_w_half)
    + "#Camera View Height Half: " + string(oCamera.view_h_half)
    + "#Camera X To: " + string(oCamera.xTo)
    + "#Camera X To: " + string(oCamera.xTo)
    + "#Camera Clamp: " + string(oCamera.camclamp)
    + "#Camera Shake Length: " + string(oCamera.shake_length)
    + "#Camera Shake Magnitude: " + string(oCamera.shake_magnitude)
    + "#Camera Shake Remain: " + string(oCamera.shake_remain)
    + "#Camera Buffer: " + string(oCamera.buff)
    + "#Cheat Variables:"
    + "#Cheats: " + string(global.cheat)
    + "#Fly Mode: " + string(global.fly);

//Debug UI
if global.debug
{
draw_text(0, 0, string_hash_to_newline(s));
	
draw_text(1200,0, "| FPS " + string(fps));
draw_text(1200,15,"| Real FPS " + string(fps_real));
}
