/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _escala_draw = display_get_gui_width() / 1920;

var escala_cola = 1 - 2 * global.posicion_flechas;

draw_set_alpha(1);

if (duration > 0) {
	var distancia = duration * global.speed_notes;
	for (var i = 0; i < (floor(distancia/22) - 1);i++) {
		draw_sprite_ext(spr_cola_flecha,0,x * _escala_draw,(y + 22 * i * escala_cola) * _escala_draw, _escala_draw,_escala_draw * escala_cola,0,image_blend,0.5);
	}
	var sobras = frac(distancia / 22);
	draw_sprite_ext(spr_cola_flecha,0,x * _escala_draw,(y + (22 * (floor(distancia/22) - 1) * escala_cola)) * _escala_draw, _escala_draw,sobras * _escala_draw * escala_cola,0,image_blend,0.5);
	draw_sprite_ext(spr_cola_flecha,1,x * _escala_draw,(y + 22 * (distancia/22 - 1) * escala_cola) * _escala_draw, _escala_draw,_escala_draw * escala_cola,0,image_blend,0.5);
}

if (veloc = 0) {
	image_alpha = 0;
}
draw_sprite_ext(sprite_index, image_index, x  * _escala_draw, y * _escala_draw, _escala_draw, _escala_draw,0,image_blend,image_alpha)