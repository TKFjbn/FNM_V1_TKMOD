/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var _escala_draw = display_get_gui_width() / 1920;

#region dibujar teclas enemigo y jugador

for (var i = 0; i < 4;i++) {
	draw_sprite_ext(spr_arrow,i,(x + 180 * i) * _escala_draw,180 * _escala_draw,_escala_draw,_escala_draw,0,c_white,0.5 + (edit / 3));
	draw_sprite_ext(spr_arrow,i,(1200 + 180 * i) * _escala_draw,180 * _escala_draw,_escala_draw,_escala_draw,0,c_white,1 - (edit / 3));
}

#endregion

#region dibujar botones_camara

for (var i = 0; i < 3; i++) {
	
	draw_set_alpha(1);
	if (obj_camara.cam_estado = i) {
		draw_sprite_ext(spr_camara_teclas,i,(870 + 90 * i) * _escala_draw,180 * _escala_draw,_escala_draw,_escala_draw,0,c_white,1);
	} else {
		draw_sprite_ext(spr_camara_teclas,i,(870 + 90 * i) * _escala_draw,180 * _escala_draw,_escala_draw,_escala_draw,0,c_white,0.5);
	}
}

#endregion

#region iluminar parte poner notas enemigo y jugador

draw_set_alpha(0.2);
draw_set_color(c_white);

for(var i = 0; i < 4; i++) {
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),(x - 90 + 180 * i) * _escala_draw,0,(x + 90 + 180 * i) * _escala_draw,1080 * _escala_draw) {
		draw_rectangle((x-90 + (180 * i)) * _escala_draw,0,(x+90 + (180 * i)) * _escala_draw,1080 * _escala_draw,0);
	}
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),(1110 + 180 * i) * _escala_draw,0,(1290 + 180 * i) * _escala_draw,1080)) {
		draw_rectangle((1200-90 + (180 * i)) * _escala_draw,0,(1200+90 + (180 * i)) * _escala_draw,1080 * _escala_draw,0);
	}
}

#endregion

#region iluminar parte poner notas camara

draw_set_alpha(0.2);
draw_set_color(c_white);

for(var i = 0; i < 3; i++) {
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),(825 + 90 * i) * _escala_draw,0,(915 + 90 * i) * _escala_draw,1080 * _escala_draw) {
		draw_rectangle((825 + (90 * i)) * _escala_draw,0,(915 + (90 * i)) * _escala_draw,1080 * _escala_draw,0);
	}
}

#endregion

#region scroll

draw_set_alpha(1);
draw_set_color($E0660B);
draw_rectangle(1860 * _escala_draw,0,1920 * _escala_draw,1080 * _escala_draw,0);
draw_set_color(c_black);
draw_rectangle(1860 * _escala_draw,-y*aux * _escala_draw,1920 * _escala_draw,(-y+1080) * aux * _escala_draw,0);

#endregion

#region botones

button_select = "";

draw_set_alpha(1);
var tam_botones = 1080 / (sprite_get_number(spr_botones) - 1);

for (var i = 0; i < sprite_get_number(spr_botones) - 1; i++) {
	
	if (point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),0,i * tam_botones * _escala_draw,60 * _escala_draw,(i+1) * tam_botones * _escala_draw) and mouse_check_button (mb_left)) {
		draw_set_color($F5DC20);
	} else {
		draw_set_color($E0660B);
	}
	
	if point_in_rectangle(window_mouse_get_x(),window_mouse_get_y(),0,i * tam_botones * _escala_draw,60 * _escala_draw,(i+1) * tam_botones * _escala_draw) {
		if (!mouse_check_button (mb_left)) {
			button_select = global.text[50 + i];
			if (button_select != "") {
				draw_set_valign(fa_middle);
				draw_set_halign(fa_left);
				draw_set_alpha(1);
				draw_set_font(font_menu);
				draw_set_color(c_black);
				draw_text_transformed(80 * _escala_draw,(i * tam_botones + tam_botones / 2) * _escala_draw,string_upper(button_select),_escala_draw,_escala_draw,0);
				draw_set_font(font_menu_2);
				draw_set_color(c_white);
				draw_text_transformed(80 * _escala_draw,(i * tam_botones + tam_botones / 2) * _escala_draw,string_upper(button_select),_escala_draw,_escala_draw,0);
			}
			draw_set_color($FA802F);
		}
		draw_rectangle(0,i*tam_botones * _escala_draw,70 * _escala_draw,((i+1) * tam_botones - 1) * _escala_draw,0);
		if (i != 0) {
			draw_sprite_ext(spr_botones,i + 1,35 * _escala_draw,((tam_botones * i) + tam_botones/2) * _escala_draw,_escala_draw,_escala_draw,0,c_white,1);
		} else {
			draw_sprite_ext(spr_botones,audio_is_paused(global.music_play[0]),35 * _escala_draw,((tam_botones * i) + tam_botones/2) * _escala_draw,_escala_draw,_escala_draw,0,c_white,1);
		}
	} else {
		draw_rectangle(0,i*tam_botones * _escala_draw,60 * _escala_draw,((i+1) * tam_botones - 1) * _escala_draw,0);
		if (i != 0) {
			draw_sprite_ext(spr_botones,i + 1,30 * _escala_draw,((tam_botones * i) + tam_botones/2) * _escala_draw,_escala_draw,_escala_draw,0,c_white,1);
		} else {
			draw_sprite_ext(spr_botones,audio_is_paused(global.music_play[0]),30 * _escala_draw,((tam_botones * i) + tam_botones/2) * _escala_draw,_escala_draw,_escala_draw,0,c_white,1);
		}
	}
	
}
#endregion
