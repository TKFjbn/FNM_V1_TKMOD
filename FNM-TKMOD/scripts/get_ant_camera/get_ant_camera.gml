// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function get_ant_camera(){
	
	global.calculate_ant_cam = noone;
	
	with(obj_flecha_camara) {
		if (y < other.y) {
			if ((!instance_exists(global.calculate_ant_cam)) or (y > global.calculate_ant_cam.y)) {
				global.calculate_ant_cam = id;
			}
		}
	}
	
	return(global.calculate_ant_cam);
	
}