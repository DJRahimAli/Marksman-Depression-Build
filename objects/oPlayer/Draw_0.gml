draw_self();

//Debug UI
if global.debug
{
draw_text(0,0,   "Player Variables:            | ");
draw_text(0,1*15,"X Coordinates                | " + string(x));
draw_text(0,2*15,"Y Coordinates                | " + string(y));
draw_text(0,3*15,"Horizontal Speed             | " + string(hsp));
draw_text(0,4*15,"Horizontal Speed No Decimals | " + string(hspstr));
draw_text(0,5*15,"Vertical Speed               | " + string(vsp));
draw_text(0,6*15,"Gravity                      | " + string(grv));
draw_text(0,7*15,"Walk Speed                   | " + string(walksp));
draw_text(0,8*15,"Acceleration                 | " + string(accel));
draw_text(0,9*15,"Crouch                       | " + string(crouch));
draw_text(0,10*15,"Crouch Stuck                 | " + string(crouchstuck));

draw_text(0,12*15,"Controller Variables:        | ");
draw_text(0,13*15,"Controller                   | " + string(controller));
draw_text(0,14*15,"Deadzone                     | " + string(deadzone));
}