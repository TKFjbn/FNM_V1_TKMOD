/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

image_speed = 0;
if (global.posicion_flechas) {
	veloc = global.speed_notes;
} else {
	veloc = -global.speed_notes;
}

if (x < 960) {
	origen = 0;
} else {
	origen = 1;
}

count_add = 0;
