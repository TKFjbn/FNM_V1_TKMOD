// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function string_to_array_real(_text,_character){
	
	var array_temp = [];
	
	var aux_content = "";
	var aux_count = 0;
	for (var i = 0; i < string_length(_text);i++) {
		if (string_char_at(_text,i+1) != _character) {
			aux_content += string_char_at(_text,i+1);
		} else {
			array_temp[aux_count] = real(aux_content);
			aux_content = "";
			aux_count++;
		}
	}
	
	return(array_temp);
	
}

function string_to_array_string(_text,_character){
	
	var array_temp = [];
	
	var aux_content = "";
	var aux_count = 0;
	for (var i = 0; i < string_length(_text);i++) {
		if (string_char_at(_text,i+1) != _character) {
			aux_content += string_char_at(_text,i+1);
		} else {
			array_temp[aux_count] = string(aux_content);
			aux_content = "";
			aux_count++;
		}
	}
	
	return(array_temp);
	
}