/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (global.seccion_menu != 0) {
	
	visible = 1;
	
	if (mouse_check_button_pressed(mb_left)) and (point_in_rectangle(mouse_x,mouse_y,x - 720, y - 405, x + 720, y + 405)) and (!point_in_rectangle(mouse_x,mouse_y,0,0,90 * sprite_get_number(spr_edit_button),90)) {
		estado = 1;
		pos_x_mouse_ant = mouse_x;
		pos_y_mouse_ant = mouse_y;
		pos_x_obj_ant = x;
		pos_y_obj_ant = y;
	}
	
	if (estado = 1) {
		x = pos_x_obj_ant + mouse_x - pos_x_mouse_ant;
		y = pos_y_obj_ant + mouse_y - pos_y_mouse_ant;
		if (mouse_check_button_released(mb_left)) {
			estado = 0;
		}
	} else {
		x = global.points_cam[image_index * 2];
		y = global.points_cam[image_index * 2 + 1];
	}
	
	if (x - 721) < 0 {
		x = 721;
	} else if (x + 722) > 1920 {
		x = 1198;
	}
	if (y - 406) < 0 {
		y = 406;
	} else if (y + 407) > 1080 {
		y = 673;
	}
	
	global.points_cam[image_index * 2] = x;
	global.points_cam[image_index * 2 + 1] = y;
	
} else {
	visible = 0;
}
