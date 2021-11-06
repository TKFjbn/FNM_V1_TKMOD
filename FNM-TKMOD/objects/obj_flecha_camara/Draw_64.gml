/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (y > -180) and (y < 1260) {

var _escala_draw = display_get_gui_width() / 1920;

draw_set_color(c_white);
draw_set_alpha(1);

draw_sprite_ext(sprite_index,image_index,x * _escala_draw,y * _escala_draw,_escala_draw,_escala_draw,0,image_blend,image_alpha);

}