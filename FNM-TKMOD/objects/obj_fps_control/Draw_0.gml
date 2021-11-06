/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_set_alpha(0.5);

draw_set_color(c_black);
draw_rectangle(x,y,x+240,y+120,0);

draw_set_color(c_white);
draw_set_font(font_fps);
draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_text(x + 120, y + 60, "FPS: " + string(sprite_get_speed(obj_seleccion_sprites.sprite_index)))
