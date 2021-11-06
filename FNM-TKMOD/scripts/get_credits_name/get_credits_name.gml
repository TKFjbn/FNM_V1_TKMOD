// Los recursos de Script han cambiado para la v2.3.0 Consulta
// https://help.yoyogames.com/hc/en-us/articles/360005277377 para más información
function get_credits_name(_name_level){
	
	var temp_path = global.ruta_dest + _name_level + global.separator;
	
	if file_exists(temp_path + "credits.txt") {
		
		var archive_credits = file_text_open_read(temp_path + "credits.txt");
		
		var text_show = "[CREDITS]";
		
		do {
			text_show += "\n" + file_text_read_string(archive_credits);
			file_text_readln(archive_credits)
		} until (file_text_eof(archive_credits));
		
		file_text_close(archive_credits);
		
		return(text_show);
	} else {
		return("none");
	}
	
}