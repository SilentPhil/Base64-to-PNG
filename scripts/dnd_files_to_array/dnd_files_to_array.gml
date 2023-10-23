function dnd_files_to_array_of_file_path(_files/*:string*/)/*->string[]*/ {
    var lines = string_split(_files, "\n", true);
    
    return array_map(lines, function(_line/*:string*/, _index/*:number*/) /*=>*/ {return string_replace_all(_line, "\n", "")});
}

function convert_file_to_png_and_save(_filepath/*:string*/)/*->void*/ {
    var base64_content = file_read_via_buffer(_filepath);
    if (base64_content == undefined) {
        show_debug_message("Warning! File not opened! " + string(_filepath));
        return;
    }
    
    var filepath_without_file_array = string_split(_filepath, "\\", false);
    var filename = array_pop(filepath_without_file_array);
    var filename_without_format = array_first(string_split(filename, ".", true));
    
    var filepath_without_file = array_reduce(filepath_without_file_array, function(_previous/*:string*/, _current/*:string*/, _index/*:number*/) /*=>*/ {return _previous + "\\" + _current});
    
    // show_debug_message(filepath_without_file_array);
    show_debug_message(filepath_without_file);
    // show_debug_message(filename);
    show_debug_message(filename + ".png");
    
    try {
        var buffer_out = buffer_base64_decode(base64_content);
        buffer_save(buffer_out, filepath_without_file + "\\" + filename + ".png");
        buffer_delete(buffer_out);
    } catch (e) {
        show_message_async(e);
    }
}


function file_read_via_buffer(_filename/*:string*/)/*->string?*/ {
	var buff = buffer_load(_filename);
	if (buff != -1) {
		var data = buffer_read(buff, buffer_text);	
		buffer_delete(buff);
		
		return data;
	} else {
		return undefined;
	}
}