/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (mouse_check_button_released(mb_right) and point_in_rectangle(mouse_x,mouse_y,735,1005,960,1080)) {
	
	var nuevo_icono = get_open_filename("sprite_sheet|*.png", "");
	
	if (nuevo_icono != "") {
		global.face_enemy = sprite_add(nuevo_icono,3,0,1,0,0);
		file_copy(nuevo_icono,global.ruta + "e_faces.png");
		sprite_set_offset(global.face_enemy,sprite_get_width(global.face_enemy) / 2,sprite_get_height(global.face_enemy) / 2);
		enemy_scale_icon = 75 / max(sprite_get_width(global.face_enemy),sprite_get_height(global.face_enemy));
		sprite_save_strip(global.face_enemy,global.ruta + "e_faces.png");
	}
	
}

if (mouse_check_button_released(mb_right) and point_in_rectangle(mouse_x,mouse_y,961,1005,1185,1080)) {
	var nuevo_icono = get_open_filename("sprite_sheet|*.png", "");
	
	if (nuevo_icono != "") {
		global.face_player = sprite_add(nuevo_icono,3,0,1,0,0);
		file_copy(nuevo_icono,global.ruta + "p_faces.png");
		sprite_set_offset(global.face_player,sprite_get_width(global.face_player) / 2,sprite_get_height(global.face_player) / 2);
		player_scale_icon = 75 / max(sprite_get_width(global.face_player),sprite_get_height(global.face_player));
		sprite_save_strip(global.face_player,global.ruta + "p_faces.png");
	}
}

if (global.seccion_menu != 0) {
	global.selection = noone;
}
