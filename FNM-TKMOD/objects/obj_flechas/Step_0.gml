/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

if (!global.pause) {
y += veloc * global.time_delta;

if (global.posicion_flechas) {
	if (y > 1170) {
		music_mute_fail();
		if (count_add <= 0) {
			count_add = 10;
			obj_reproductor_notas.points_player -= 3.5;
		} else {
			count_add -= global.time_delta;
		}
	
		if (y - duration * global.speed_notes) > 1170 {
			instance_destroy();
		}
		
	}
} else {
	if (y < -140) {
		
		music_mute_fail();
		
		if (count_add <= 0) {
			count_add = 10;
			obj_reproductor_notas.points_player -= 3.5;
		} else {
			count_add -= global.time_delta;
		}
	
		if (y + duration * global.speed_notes) < -140 {
			instance_destroy();
		}
	
	}
}

if (origen) {
	
	#region nota del jugador
	
	if (veloc = 0) {
		if (count_add <= 0) {
			count_add = 10;
			obj_reproductor_notas.points_player += 3;
		} else {
			count_add -= global.time_delta;
		}
		duration -= global.time_delta;
		if (duration < 0) {
			instance_destroy();
		}
	} else if (duration <= 5) and (duration > 0) {
		veloc = 0;
		y = 140;
		duration -= global.time_delta;
	}
	
	#endregion
	
} else {
	
	#region nota enemiga
	
	if (global.posicion_flechas = 0) and (y <= obj_teclas.y) {
		
		var quien = obj_reproductor_notas._id_enemigo;
		quien.position_sprite_show = image_index + 1;
		quien.cont = 20;
		if (veloc != 0) {
			veloc = 0;
			quien.image_index = 0;
			y = obj_teclas.y;
		}
		
		duration -= global.time_delta;
		if (duration <= 0) {
			instance_destroy();
		}
		
		if (obj_teclas.escalas[image_index] < 1.02) {
			obj_teclas.escalas[image_index] = 1.1
		}
		
	} else if (global.posicion_flechas) and (y >= obj_teclas.y) {
		
		var quien = obj_reproductor_notas._id_enemigo;
		quien.position_sprite_show = image_index + 1;
		quien.cont = 20;
		if (veloc != 0) {
			veloc = 0;
			quien.image_index = 0;
			y = obj_teclas.y;
		}
		
		duration -= global.time_delta;
		if (duration <= 0) {
			instance_destroy();
		}
		
		if (obj_teclas.escalas[image_index] < 1.02) {
			obj_teclas.escalas[image_index] = 1.1
		}
		
	}
	
	#endregion
	
}

}

image_yscale = (1 + (duration * global.speed_notes) / 90) * (1 - 2 * global.posicion_flechas)
