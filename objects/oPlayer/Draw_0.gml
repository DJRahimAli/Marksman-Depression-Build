draw_self();

//Debug UI
if global.debug
{
draw_text(0,0,"X Coordinates               | " + string(x));
draw_text(0,15,"Y Coordinates               | " + string(y));
draw_text(0,30,"Horizontal Speed            | " + string(hsp));
draw_text(0,45,"Horizontal Speed No Decimals| " + string(hspstr));
draw_text(0,60,"Vertical Speed              | " + string(vsp));
draw_text(0,75,"Gravity                     | " + string(grv));
draw_text(0,90,"Walk Speed                  | " + string(wlksp));
draw_text(0,105,"Acceleration                | " + string(accel));
}
