/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _escala_draw = display_get_gui_width() / 1920;

draw_set_color(c_black);
draw_set_alpha(1);

draw_rectangle(505 * _escala_draw,(980 - 910 * global.posicion_flechas) * _escala_draw,1440 * _escala_draw,(1010 - 910 * global.posicion_flechas) * _escala_draw,0);

draw_set_color(c_blue);
draw_rectangle(515 * _escala_draw,(990 - 910 * global.posicion_flechas) * _escala_draw,1430 * _escala_draw,(1000 - 910 * global.posicion_flechas) * _escala_draw,0);

draw_set_color(c_red);
if (points_player < 100) {
	draw_rectangle(515 * _escala_draw,(990 - 910 * global.posicion_flechas) * _escala_draw,(515 + (920 / 100) * (100 - points_player)) * _escala_draw,(1000 - 910 * global.posicion_flechas) * _escala_draw,0);
}

#region dibujar personajes iconos

var pos_base_icons = (510 + (925 / 100) * (100 - points_player));

draw_sprite_ext(global.face_player,round((100 - points_player) * 0.02),(pos_base_icons + 75) * _escala_draw,(995 - 910 * global.posicion_flechas) * _escala_draw,_escala_draw * player_scale_icon * scale_anim_icons,_escala_draw * player_scale_icon * scale_anim_icons,0,c_white,1)

draw_sprite_ext(global.face_enemy,round(points_player * 0.02),(pos_base_icons - 75) * _escala_draw,(995 - 910 * global.posicion_flechas) * _escala_draw,_escala_draw * enemy_scale_icon * scale_anim_icons,_escala_draw * enemy_scale_icon * scale_anim_icons,0,c_white,1)

#endregion

if (iniciado = 1) and audio_is_playing(iniciando_sound) {
	
	var position = audio_sound_get_track_position(iniciando_sound);
	
	if (position > 1.6) {
		draw_sprite_ext(spr_start_sprites,2,960 * _escala_draw,540 * _escala_draw,_escala_draw,_escala_draw,0,c_white,0.9);
	} else if (position > 1.1) {
		draw_sprite_ext(spr_start_sprites,1,960 * _escala_draw,540 * _escala_draw,_escala_draw,_escala_draw,0,c_white,0.9);
	} else if (position > 0.5) {
		draw_sprite_ext(spr_start_sprites,0,960 * _escala_draw,540 * _escala_draw,_escala_draw,_escala_draw,0,c_white,0.9);
	}
	
}

draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_font(font_fps);
draw_text_transformed(1430 * _escala_draw,(1010 - 910 * global.posicion_flechas) * _escala_draw,"score: " + string(global.score_level),_escala_draw/2,_escala_draw/2,0);
