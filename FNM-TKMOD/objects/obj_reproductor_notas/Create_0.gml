/// @description Inserte aquí la descripción
// Puede escribir su código en este editor

global.score_level = 0;
global.pause = false;

iniciado = 0;

depth = -100;
paso = 0; //tiempo transcurrido desde el inicio. (basado en 60 fps * delta_time).
nota_siguiente = 0; //posision del array de la siguiente nota.
notas_creacion = string_to_array_real(global.notes,";"); //array de los datos de las notas a crear.

retraso = 1020 / global.speed_notes;

cam_siguiente = 0;
cam_movement = string_to_array_real(global.notas_cam,";");

points_player = 50;

enemy_scale_icon = 150 / max(sprite_get_width(global.face_enemy),sprite_get_height(global.face_enemy));
player_scale_icon = 150 / max(sprite_get_width(global.face_player),sprite_get_height(global.face_player));

anim_icons = 0;
scale_anim_icons = 1;

_id_enemigo = inst_12033C0D;
_id_player = inst_CFF9C6F;

time_mute = 0;
