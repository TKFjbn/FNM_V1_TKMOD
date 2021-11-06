/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (identification = -1) {
	identification = array_length(obj_control_editor.notas_general);
	obj_control_editor.notas_general[identification] = string(y_aument / global.speed_notes) + ";" + string(x) + ";" + string(duracion_nota) + ";" + string(image_index) + ";";
}

if ((y + duracion_nota * global.speed_notes) > -180) and (y < 1260) {
visible = true;
var _escala_draw = display_get_gui_width() / 1920;

#region efecto

if (!paso) and (y < 180) {
	paso = true;
	escala_efecto = 1;
	if (x < room_width / 2) {
		var quien = obj_control_editor._id_enemigo;
		quien.position_sprite_show = image_index + 1;
		quien.cont = 20;
		quien.image_index = 0;
	} else {
		var quien = obj_control_editor._id_player;
		quien.position_sprite_show = image_index + 1;
		quien.cont = 20;
		quien.image_index = 0;
	}
} else if (y > 180) {
	paso = false;
} else {
	
	if ((y + duracion_nota * global.speed_notes) > 180) {
		if (x < room_width / 2) {
			var quien = obj_control_editor._id_enemigo;
			quien.position_sprite_show = image_index + 1;
			quien.cont = 20;
		} else {
			var quien = obj_control_editor._id_player;
			quien.position_sprite_show = image_index + 1;
			quien.cont = 20;
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

if point_in_rectangle(window_mouse_get_x() / _escala_draw,window_mouse_get_y() / _escala_draw,x - 20,y - 20, x + 20, y + 20 + duracion_nota * global.speed_notes) and (mouse_check_button_pressed(mb_left)) and (keyboard_check(vk_shift)) {
	estado = 2;
}

#endregion

#region Estados

switch (estado) {
	
	case 0: //estado neutro
	
		if (mouse_check_button_released(mb_right)) and (image_blend = definir_color(image_index)) {
			obj_control_editor.notas_general[identification] = "";
			instance_destroy();
		}
		
	break;
	case 1: //estado movimiento
		
		if (!instance_place(x,window_mouse_get_y() / _escala_draw,obj_flecha_editor)) {
			//y = mouse_y - obj_control_editor.y;
			y_aument = window_mouse_get_y() / _escala_draw - obj_control_editor.y;
		}
		
		if (!mouse_check_button(mb_left)) {
			estado = 0;
			obj_control_editor.notas_general[identification] = string(y_aument / global.speed_notes) + ";" + string(x) + ";" + string(duracion_nota) + ";" + string(image_index) + ";";
		}
		
	break;
	case 2: //estado cambiar duracion
		
		if ((window_mouse_get_y() / _escala_draw - obj_control_editor.y) > y_ant) {
			duracion_nota = ((window_mouse_get_y() / _escala_draw - y)) / global.speed_notes;
		} else {
			duracion_nota = 0;
		}
		
		if (!mouse_check_button(mb_left)) or (!keyboard_check(vk_shift)) {
			estado = 0;
			obj_control_editor.notas_general[identification] = string(y_aument / global.speed_notes) + ";" + string(x) + ";" + string(duracion_nota) + ";" + string(image_index) + ";";
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

//Paulo estuvo viendo esto :)
//T'k igual :)

} else {
	visible = false;
}

y = y_aument + obj_control_editor.y;

if (escala_efecto > 0) {
	escala_efecto -= 0.2 * global.time_delta;
	if (escala_efecto < 0) {
		escala_efecto = 0;
	}
}

