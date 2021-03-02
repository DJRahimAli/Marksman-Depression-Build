draw_self();

//Debug UI
if global.debug
{
draw_text(0,0,"Player Variables:            |");
draw_text(0,15,"X Coordinates                | " + string(x));
draw_text(0,30,"Y Coordinates                | " + string(y));
draw_text(0,45,"Horizontal Speed             | " + string(hsp));
draw_text(0,60,"Horizontal Speed No Decimals | " + string(hspstr));
draw_text(0,75,"Vertical Speed               | " + string(vsp));
draw_text(0,90,"Gravity                      | " + string(grv));
draw_text(0,105,"Walk Speed                   | " + string(walksp));
draw_text(0,120,"Acceleration                 | " + string(accel));
}
