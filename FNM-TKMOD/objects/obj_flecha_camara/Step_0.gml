/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (identificator = -1) {
	identificator = array_length(obj_control_editor.camaras);
	obj_control_editor.camaras[identificator] = string(y_aument/global.speed_notes) + ";" + string(image_index) + ";";
}

if (y > -180) and (y < 1260) {
visible = true;

var _escala_draw = display_get_gui_width() / 1920;

#region efecto

if (!paso) and (y < 180) {
	
	if (type_camera = 1) {
		obj_camara.zoom_camera = true;
	} else {
		if (!instance_exists(global.ult_cam_position)) or (y > global.ult_cam_position.y) {
			global.ult_cam_position = id;
			obj_camara.cam_estado = image_index;
		}
	}
	
	paso = true;
	
} else if (y > 180) {
	
	paso = false;
	if (global.ult_cam_position = id) {
		global.ult_cam_position = noone;
	}
	
	with(obj_flecha_camara) {
		if (y < 180) {
			
			if (!instance_exists(global.ult_cam_position)) or (y > global.ult_cam_position.y) {
				global.ult_cam_position = id;
				obj_camara.cam_estado = image_index;
			}
			
		}
	}
	
}

#endregion

#region definir estados (seleccion y etc)

if (collision_point(window_mouse_get_x() / _escala_draw,window_mouse_get_y() / _escala_draw,id,1,0)) and (estado = 0) {
	
	if (mouse_check_button_pressed(mb_left) and (!keyboard_check(vk_shift))) {
		estado = 1;
	}
	
}

#endregion

#region Estados

switch (estado) {
	
	case 0: //estado neutro
	
		if (mouse_check_button_released(mb_right)) and (collision_point(window_mouse_get_x() / _escala_draw,window_mouse_get_y() / _escala_draw,id,1,0)) {
			instance_destroy();
			obj_control_editor.camaras[identificator] = "";
		}
		
	break;
	case 1: //estado movimiento
		
		y_aument = window_mouse_get_y() / _escala_draw - obj_control_editor.y;
		
		if (!mouse_check_button(mb_left)) {
			estado = 0;
			obj_control_editor.camaras[identificator] = string(y_aument/global.speed_notes) + ";" + string(image_index) + ";";
		}
		
	break;
}

#endregion

//color de nota

if (estado = 1) or (collision_point(window_mouse_get_x() / _escala_draw,window_mouse_get_y() / _escala_draw,id,1,0)) {
	image_blend = definir_color(image_index);
} else {
	image_blend = merge_color(definir_color(image_index),c_dkgray,0.5);
}
} else {
	visible = false;
}

y = y_aument + obj_control_editor.y;
