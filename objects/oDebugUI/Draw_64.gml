#region //Debug UI
if instance_exists(oPlayer) && !instance_exists(oWeapon)
{
	var s;
	s = "Player Variables:"
		+ "#X Coordinates: " + string(oPlayer.x)
		+ "#Y Coordinates: " + string(oPlayer.y)
		+ "#Horizontal Speed: " + string(oPlayer.hsp)
		+ "#Horizontal Speed No Decimals: " + string(oPlayer.hspnodec)
		+ "#Vertical Speed: " + string(oPlayer.vsp)
		+ "#Vertical Speed No Decimals: " + string(oPlayer.vspnodec)
		+ "#Gravity: " + string(oPlayer.grv)
		+ "#Walk Speed: " + string(oPlayer.walksp)
		+ "#Walk Speed Rate: " + string(oPlayer.walksprate)
		+ "#Crouching Walk Speed Rate: " + string(oPlayer.walkspcrouchrate)
		+ "#Acceleration: " + string(oPlayer.accel)
		+ "#Moving: " + string(oPlayer.moving)
		+ "#Crouch: " + string(oPlayer.crouch)
		+ "#Crouch Stuck: " + string(oPlayer.crouchstuck)
		+ "#Has Weapon: " + string(global.hasweapon)
		+ "#Controller Variables: "
		+ "#Controller: " + string(oPlayer.controller)
		+ "#Deadzone: " + string(oPlayer.deadzone)
		+ "#Weapon Variables:"
		+ "#Bullet Count: " + string(instance_number(oBullet))
		+ "#Shell Count: " + string(instance_number(oShell))
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
		+ "#Fly Mode: " + string(global.fly)
		+ "#Noclip Mode: " + string(global.noclip)
		+ "#God Mode: " + string(global.god);
}

if instance_exists(oPlayer) && instance_exists(oWeapon)
{
	var s;
	s = "Player Variables:"
		+ "#X Coordinates: " + string(oPlayer.x)
		+ "#Y Coordinates: " + string(oPlayer.y)
		+ "#Horizontal Speed: " + string(oPlayer.hsp)
		+ "#Horizontal Speed No Decimals: " + string(oPlayer.hspnodec)
		+ "#Vertical Speed: " + string(oPlayer.vsp)
		+ "#Vertical Speed No Decimals: " + string(oPlayer.vspnodec)
		+ "#Gravity: " + string(oPlayer.grv)
		+ "#Walk Speed: " + string(oPlayer.walksp)
		+ "#Walk Speed Rate: " + string(oPlayer.walksprate)
		+ "#Crouching Walk Speed Rate: " + string(oPlayer.walkspcrouchrate)
		+ "#Acceleration: " + string(oPlayer.accel)
		+ "#Moving: " + string(oPlayer.moving)
		+ "#Crouch: " + string(oPlayer.crouch)
		+ "#Crouch Stuck: " + string(oPlayer.crouchstuck)
		+ "#Has Weapon: " + string(global.hasweapon)
		+ "#Controller Variables: "
		+ "#Controller: " + string(oPlayer.controller)
		+ "#Deadzone: " + string(oPlayer.deadzone)
		+ "#Controller Angle: " + string(oWeapon.controllerangle)
		+ "#Weapon Variables:"
		+ "#Firing Delay: " + string(oWeapon.firingdelay)
		+ "#Recoil: " + string(oWeapon.recoil)
		+ "#Stop Shooting: " + string(oWeapon.stopshooting)
		+ "#Bullet Count: " + string(instance_number(oBullet))
		+ "#Shell Count: " + string(instance_number(oShell))
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
		+ "#Fly Mode: " + string(global.fly)
		+ "#Noclip Mode: " + string(global.noclip)
		+ "#God Mode: " + string(global.god);
}

if instance_exists(oPlayerDead)
{
	var s;
	s = "Player Variables:"
		+ "#X Coordinates: " + string(oPlayerDead.x)
		+ "#Y Coordinates: " + string(oPlayerDead.y)
		+ "#Horizontal Speed: " + string(oPlayerDead.hsp)
		+ "#Vertical Speed: " + string(oPlayerDead.vsp)
		+ "#Gravity: " + string(oPlayerDead.grv)
		+ "#Done Falling when dead: " + string(oPlayerDead.done)
		+ "#Has Weapon: " + string(global.hasweapon)
		+ "#Weapon Variables:"
		+ "#Bullet Count: " + string(instance_number(oBullet))
		+ "#Shell Count: " + string(instance_number(oShell))
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
		+ "#Fly Mode: " + string(global.fly)
		+ "#Noclip Mode: " + string(global.noclip)
		+ "#God Mode: " + string(global.god);
}

if !instance_exists(oPlayer) && !instance_exists(oPlayerDead)
{
	var s;
	s = "Player Variables:"
		+ "#Has Weapon: " + string(global.hasweapon)
		+ "#Weapon Variables:"
		+ "#Bullet Count: " + string(instance_number(oBullet))
		+ "#Shell Count: " + string(instance_number(oShell))
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
		+ "#Fly Mode: " + string(global.fly)
		+ "#Noclip Mode: " + string(global.noclip)
		+ "#God Mode: " + string(global.god);
}

var f;
f = (string(fps) + " FPS")
	+ "#" + (string(fps_real) + " Real FPS");

#endregion

//Draw Debug UI
if global.debug
{
	DrawSetText(c_black, fText, fa_left, fa_top);
	draw_text(0.5-2,0.3+2,string_hash_to_newline(s));
	draw_set_color(c_white);
	draw_text(0.5,0.3,string_hash_to_newline(s));

	DrawSetText(c_black, fText, fa_right, fa_top);
	draw_text(RES_W-0.5+2,0.3+2,string_hash_to_newline(f));
	draw_set_color(c_white);
	draw_text(RES_W-0.5,0.3,string_hash_to_newline(f));

/*
	draw_set_color(c_black);
	draw_text(0-2,0,string_hash_to_newline(s));
	draw_text(0+2,0,string_hash_to_newline(s));
	draw_text(0,0+2,string_hash_to_newline(s));
	draw_text(0,0-2,string_hash_to_newline(s));
*/

/*
	draw_set_color(c_black);
	draw_text(1200-2,0, "| FPS " + string(fps));
	draw_text(1200+2,0, "| FPS " + string(fps));
	draw_text(1200,0+2, "| FPS " + string(fps));
	draw_text(1200,0-2, "| FPS " + string(fps));
	draw_text(1200-2,25,"| Real FPS " + string(fps_real));
	draw_text(1200+2,25,"| Real FPS " + string(fps_real));
	draw_text(1200,25+2,"| Real FPS " + string(fps_real));
	draw_text(1200,25-2,"| Real FPS " + string(fps_real));
*/
}
