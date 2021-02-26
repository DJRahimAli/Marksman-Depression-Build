draw_self();

//Debug UI
if global.debug
{
draw_text(0,225,"Cheat Variables:             |");
draw_text(0,240,"Cheats                       | " + string(global.cheat));
draw_text(0,255,"Fly Mode                     | " + string(global.fly));
}
