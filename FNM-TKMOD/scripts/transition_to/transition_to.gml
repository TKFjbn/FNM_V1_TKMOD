// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function transition_to(room_destino,trans_speed){
	if (instance_number(obj_transicion) < 1) {
		
		var _transicion = instance_create_depth(0,0,-100,obj_transicion)
		_transicion.room_dest = room_destino;
		_transicion.veloc_trans = trans_speed;
		
	}
}