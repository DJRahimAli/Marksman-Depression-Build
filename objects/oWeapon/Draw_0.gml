draw_self();

//Debug UI
if global.debug
{
draw_text(0,15*15,"Controller Angle             | " + string(controllerangle));

draw_text(0,17*15,"Weapon Variables:            | ");
draw_text(0,18*15,"Firing Delay                 | " + string(firingdelay));
draw_text(0,19*15,"Recoil                       | " + string(recoil));
draw_text(0,20*15,"Stop Shooting                | " + string(stopshooting));
}

//draw_text(x,y,test);