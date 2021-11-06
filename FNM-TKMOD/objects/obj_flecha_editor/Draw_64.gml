/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if ((y + duracion_nota * global.speed_notes) > -180) and (y < 1260) {

var _escala_draw = display_get_gui_width() / 1920;

draw_set_color(c_white);
draw_set_alpha(1);

#region dibujar mantener

if (duracion_nota > 0) {
	var distancia = duracion_nota * global.speed_notes;
	for (var i = 0; i < (floor(distancia/22) - 1);i++) {
		draw_sprite_ext(spr_cola_flecha,0,x * _escala_draw,(y + 22 * i) * _escala_draw,_escala_draw,_escala_draw,0,image_blend,0.5);
	}
	
	var sobras = frac(distancia / 22);
	
	draw_sprite_ext(spr_cola_flecha,0,x * _escala_draw,(y + 22 * (floor(distancia/22) - 1)) * _escala_draw,_escala_draw,sobras * _escala_draw,0,image_blend,0.5);
	draw_sprite_ext(spr_cola_flecha,1,x * _escala_draw,(y + 22 * (distancia/22 - 1)) * _escala_draw,_escala_draw,_escala_draw,0,image_blend,0.5);
}

#endregion

#region dibujar nota y efecto

draw_sprite_ext(sprite_index,image_index,x * _escala_draw,y * _escala_draw,_escala_draw,_escala_draw,0,image_blend,image_alpha);
draw_sprite_ext(sprite_index,image_index,x * _escala_draw,180 * _escala_draw,(2-escala_efecto) * _escala_draw,(2-escala_efecto) * _escala_draw,0,image_blend,escala_efecto);

#endregion

}