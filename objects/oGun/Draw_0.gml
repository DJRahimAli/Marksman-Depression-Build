draw_self();

//Debug UI
if global.debug
{
draw_text(0,150,"Weapon Variables:            |");
draw_text(0,165,"Firing Delay                 | " + string(firingdelay));
draw_text(0,180,"Recoil                       | " + string(recoil));
draw_text(0,195,"Stop Shooting                | " + string(stopshooting));
}
