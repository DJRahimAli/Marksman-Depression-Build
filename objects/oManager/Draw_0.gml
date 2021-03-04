draw_self();

//Debug UI
if global.debug
{
draw_text(0,21*15,"Cheat Variables:             |");
draw_text(0,22*15,"Cheats                       | " + string(global.cheat));
draw_text(0,23*15,"Fly Mode                     | " + string(global.fly));
draw_text(1200,0, "FPS " + string(fps));
draw_text(1200,15,"Real FPS " + string(fps_real));
}

//draw_text(x,y,test);
