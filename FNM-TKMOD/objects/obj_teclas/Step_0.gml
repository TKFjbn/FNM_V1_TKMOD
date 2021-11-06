/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

var escala_aux = 1 - 2 * global.posicion_flechas;

if (!global.pause) {

#region definir teclas
#region type input (WASD or DFJK).

var arrows = [];

if (global.input_default) {
	arrows[0] = ord("D");
	arrows[1] = ord("F");
	arrows[2] = ord("J");
	arrows[3] = ord("K");
} else {
	arrows[0] = ord("A");
	arrows[1] = ord("S");
	arrows[2] = ord("W");
	arrows[3] = ord("D");
}

#endregion

var buttons_touch_released = [];
var buttons_touch_pressed = [];
var buttons_touch = [];

buttons_touch_released[0] = keyboard_check_released(arrows[0]) or (keyboard_check_released(vk_left));
buttons_touch_released[1] = keyboard_check_released(arrows[1]) or (keyboard_check_released(vk_down));
buttons_touch_released[2] = keyboard_check_released(arrows[2]) or (keyboard_check_released(vk_up));
buttons_touch_released[3] = keyboard_check_released(arrows[3]) or (keyboard_check_released(vk_right));

buttons_touch_pressed[0] = keyboard_check_pressed(arrows[0]) or (keyboard_check_pressed(vk_left));
buttons_touch_pressed[1] = keyboard_check_pressed(arrows[1]) or (keyboard_check_pressed(vk_down));
buttons_touch_pressed[2] = keyboard_check_pressed(arrows[2]) or (keyboard_check_pressed(vk_up));
buttons_touch_pressed[3] = keyboard_check_pressed(arrows[3]) or (keyboard_check_pressed(vk_right));

buttons_touch[0] = keyboard_check(arrows[0]) or (keyboard_check(vk_left));
buttons_touch[1] = keyboard_check(arrows[1]) or (keyboard_check(vk_down));
buttons_touch[2] = keyboard_check(arrows[2]) or (keyboard_check(vk_up));
buttons_touch[3] = keyboard_check(arrows[3]) or (keyboard_check(vk_right));

#endregion

#region atrapar notas

for (var i = 0; i < 4; i++) {
	
	if (buttons_touch_pressed[i]) {
		
		#region atrapar notas
		if (global.posicion_flechas) {
			nota_atrapada[i] = collision_line(x + 1020 + 180 * i,y - 110,x + 1020 + 180 * i,y + 90,obj_flechas,1,0);
		} else {
			nota_atrapada[i] = collision_line(x + 1020 + 180 * i,y - 90,x + 1020 + 180 * i,y + 110,obj_flechas,1,0);
		}
		
		if (nota_atrapada[i]) {
			
			global.score_level += 200;
			
			music_unmute_fail();
			
			nota_atrapada[i].veloc = 0;
			
			if (global.posicion_flechas) {
				if (nota_atrapada[i].y > y) {
					nota_atrapada[i].duration = ((nota_atrapada[i].duration * global.speed_notes) - (nota_atrapada[i].y - y)) / global.speed_notes;
				}
			} else {
				if (nota_atrapada[i].y < y) {
					nota_atrapada[i].duration = ((nota_atrapada[i].y + (nota_atrapada[i].duration * global.speed_notes)) - y) / global.speed_notes;
				}
			}
			
			nota_atrapada[i].y = y;
		
		} else {
			global.score_level -= 10;
			music_mute_fail();
			obj_reproductor_notas.points_player -= 2.5;
			escalas[i + 4] = 0.9;
			var quien = obj_reproductor_notas._id_player;
			quien.position_sprite_show = i + 5;
			quien.image_index = 0;
			quien.cont = 20;
		}
		#endregion
		
	} else if (buttons_touch_released[i]) {
		
		if (nota_atrapada[i] and instance_exists(nota_atrapada[i])) {
			nota_atrapada[i].veloc = -global.speed_notes * escala_aux;
			nota_atrapada[i] = 0;
		}
			
	} else if (!nota_atrapada[i]) and (buttons_touch[i]) {
		
		var evaluate_note;
		
		#region buscar nota mantener
		
		if (global.posicion_flechas) {
			evaluate_note = collision_line(x + 1020 + 180 * i,y,x + 1020 + 180 * i,y + 60,obj_flechas,1,0);
		} else {
			evaluate_note = collision_line(x + 1020 + 180 * i,y - 60,x + 1020 + 180 * i,y,obj_flechas,1,0);
		}
		
		#endregion
		
		#region atrapar mantener
		
		if (evaluate_note) and (evaluate_note.duration > 0) {
			
			music_unmute_fail();
			
			obj_reproductor_notas.points_player -= 2;
			nota_atrapada[i] = evaluate_note;
			nota_atrapada[i].veloc = 0;
			
			if (global.posicion_flechas) {
				if (nota_atrapada[i].y > y) {
					nota_atrapada[i].duration = ((nota_atrapada[i].duration * global.speed_notes) - (nota_atrapada[i].y - y)) / global.speed_notes;
				}
			} else {
				if (nota_atrapada[i].y < y) {
					nota_atrapada[i].duration = ((nota_atrapada[i].y + (nota_atrapada[i].duration * global.speed_notes)) - y) / global.speed_notes;
				}
			}
		
			nota_atrapada[i].y = y;
		} else if (escalas[i+4] <= 1) {
			escalas[i + 4] = 0.9;
		}
		#endregion
		
	}
	
	if (nota_atrapada[i]) {
		var quien = obj_reproductor_notas._id_player;
		quien.cont = 20;
		if (quien.position_sprite_show != (i+1)) {
			quien.image_index = 0;
			quien.position_sprite_show = i + 1;
		}
		if (escalas[i + 4] < 1.02) {
			escalas[i + 4] = 1.1;
		}
		
		if (!instance_exists(nota_atrapada[i])) {
			nota_atrapada[i] = 0;
		}
	}
	
}

#endregion

}
//animaciones

for (var i = 0; i < 8; i++) {
	if (escalas[i] > 1) {
		escalas[i] -= 0.02 * global.time_delta;
		if (escalas[i] < 1) {
			escalas[i] = 1
		}
	} else if (escalas[i] < 1) {
		escalas[i] += 0.02 * global.time_delta;
		if (escalas[i] > 1) {
			escalas[i] = 1
		}
	}
}
