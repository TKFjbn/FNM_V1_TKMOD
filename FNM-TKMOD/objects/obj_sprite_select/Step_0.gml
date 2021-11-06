/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (global.seccion_menu = 0) {
	
	#region mover y escalar

	if (point_in_rectangle(mouse_x,mouse_y,min(x,x + sprite_width),min(y,y+sprite_height),max(x,x + sprite_width),max(y,y+sprite_height))) {
	
		if (mouse_check_button_pressed(mb_left)) { //seleccion y movimiento
		
			global.selection = id;
			pos_x_ant_mouse = mouse_x;
			pos_y_ant_mouse = mouse_y;
			pos_x_ant = x;
			pos_y_ant = y;
			movimiento = 1;
		
		} else if (mouse_check_button_released(mb_right)) {
		
			global.edit_sprite_type = origin;
			room_goto(room_creation_add_skins);
		
		}
	
	} else if (point_in_rectangle(mouse_x,mouse_y,x + sprite_width - 20, y + sprite_height - 20,x + sprite_width + 20, y + sprite_height + 20) and (mouse_check_button_pressed(mb_left))) {
	
		global.selection = id; //seleccion escalado
		movimiento = 2;
		pos_x_ant_mouse = mouse_x;
		pos_y_ant_mouse = mouse_y;
	
	}

	if (movimiento = 1) { //movimiento
	
		x = pos_x_ant + (mouse_x - pos_x_ant_mouse);
		y = pos_y_ant + (mouse_y - pos_y_ant_mouse);
	
		if (!mouse_check_button(mb_left)) { //si se suelta, no mover.
			movimiento = 0;
			if (origin = 0) {
				global.data_pos_enemy[2] = x;
				global.data_pos_enemy[3] = y;
			} else {
				global.data_pos_player[2] = x;
				global.data_pos_player[3] = y;
			}
		}
	
	} else if (movimiento = 2) { //escalado
	
		if (keyboard_check(vk_shift)) { //escalado con relacion de aspecto
			image_xscale = (mouse_x - x) / sprite_get_width(sprite_index);
			image_yscale = image_xscale;
		} else { //escalado libre.
			image_xscale = (mouse_x - x) / sprite_get_width(sprite_index);
			image_yscale = (mouse_y - y) /sprite_get_height(sprite_index);
		}
	
		if (!mouse_check_button(mb_left)) { //si se suelta, no escalar
			movimiento = 0;
			if (origin = 0) {
				global.data_pos_enemy[0] = image_xscale;
				global.data_pos_enemy[1] = image_yscale;
			} else {
				global.data_pos_player[0] = image_xscale;
				global.data_pos_player[1] = image_yscale;
			}
		}
	
	}

	if (global.selection != id) {
		movimiento = 0;
	}

	#endregion
	
}

#region enseñar sprites

#region controles

if (keyboard_check(ord("A")) or keyboard_check(vk_left)) {
	var position_sprite = 1;
} else if (keyboard_check(ord("S")) or keyboard_check(vk_down)) {
	var position_sprite = 2;
} else if (keyboard_check(ord("D")) or keyboard_check(vk_right)) {
	var position_sprite = 4;
} else if (keyboard_check(ord("W")) or keyboard_check(vk_up)) {
	var position_sprite = 3;
} else {
	var position_sprite = 0;
}

#endregion


if (origin = 0) {
	sprite_index = global.enemigo_sprites[position_sprite][0];
} else {
	sprite_index = global.player_sprites[position_sprite][0];
}

#endregion
