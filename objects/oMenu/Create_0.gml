/// @desc GUI/Vars/Menu setup
#macro SAVEFILE "Marksman.oggysav"

gui_width = display_get_gui_width();
gui_height = display_get_gui_height();
gui_margin = 32;

menu_x = -200//gui_width+200//- gui_margin;
menu_y = gui_height - gui_margin;

menu_x_target = gui_margin;
menu_speed = 10; //lower is faster
menu_font = fMenu;
menu_itemheight = font_get_size(fMenu);
menu_commited = -1;
menu_control = true;

menu[2] = "New Game";
menu[1] = "Continue";
menu[0] = "Quit";

menu_items = array_length(menu);

menu_top = menu_y - ((menu_itemheight * 1.5) * menu_items);

menu_cursor = 1;
menu_last_cursor = menu_cursor;
