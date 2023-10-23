file_dnd_set_files(file_dnd_pattern, file_dnd_allowfiles, file_dnd_allowdirs, file_dnd_allowmulti);
file_dnd_filelist = file_dnd_get_files();

array_foreach(dnd_files_to_array_of_file_path(file_dnd_filelist), function(_filepath/*:string*/, _index/*:number*/) /*=>*/ {
    show_debug_message(_filepath);
    convert_file_to_png_and_save(_filepath);
});

file_dnd_filelist = "";
file_dnd_set_enabled(false);
file_dnd_set_enabled(true);
