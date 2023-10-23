var str = "";
if (file_dnd_get_enabled()) {
    if (file_dnd_filelist == "") {
        str = "drop some files please";
    } else {
        str = string(dnd_files_to_array_of_file_path(file_dnd_filelist));
    }
} else {
    str = "file dropped disabled";
}

draw_text_ext(10, 10, str, -1, room_width - 20);