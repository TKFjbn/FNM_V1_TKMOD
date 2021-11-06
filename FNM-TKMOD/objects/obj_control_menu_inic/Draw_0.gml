/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

draw_set_alpha(0.7)
draw_set_color(merge_color(c_blue,c_black,0.7));

draw_rectangle(0,0,480,1080,0);

draw_set_halign(fa_center);
draw_set_valign(fa_middle);

for (var i = 0; i < array_length(proyectos); i++) {
	
	draw_set_alpha(0.7)
	if (point_in_rectangle(mouse_x,mouse_y,0, 108 * i - base_projects_list,480, 107 + 108 * i - base_projects_list)) {
		
		if (mouse_check_button(mb_left)) {
			draw_set_color($F5DC20)
		} else {
			draw_set_color($FA802F)
		}
		
	} else {
		draw_set_color($E0660B);
	}
	
	draw_rectangle(0,108 * i - base_projects_list,480, 107 + 108 * i - base_projects_list,0);
	
	draw_set_font(font_menu);
	if (string_width(proyectos[i]) > 400) {
		var _escala_text = 400 / string_width(proyectos[i]);
	} else {
		var _escala_text = 1;
	}
	
	draw_set_color(c_black);
	//draw_set_color($B13FFF);
	draw_set_alpha(1)
	draw_text_transformed(240,54 + 108 * i - base_projects_list,string_upper(proyectos[i]),_escala_text,_escala_text,0);
	
	draw_set_font(font_menu_2);
	draw_set_color($FFFF00);
	//draw_set_color($B13FFF);
	//draw_set_color(c_white);
	draw_text_transformed(240,54 + 108 * i - base_projects_list,string_upper(proyectos[i]),_escala_text,_escala_text,0);
	
}


if (array_length(proyectos) * 108) > 1080 {
	
	var escala_barra = 1080 / (array_length(proyectos) * 108);
	
	if (point_in_rectangle(mouse_x,mouse_y,481,base_projects_list * escala_barra,540,(base_projects_list + 1080) * escala_barra)) {
		
		if (mouse_check_button(mb_left)) {
			draw_set_color(c_white);
		} else {
			draw_set_color(c_gray);
		}
		
	} else {
		draw_set_color(c_dkgray);
	}
	
	draw_rectangle(481,base_projects_list * escala_barra,540,(base_projects_list + 1080) * escala_barra,0);
	
}

draw_set_font(font_fps);
draw_set_alpha(1);
draw_set_color(c_white);
draw_set_valign(fa_top);
draw_set_halign(fa_right);
draw_text_transformed(1920,0,global.game_version,0.5,0.5,0);
