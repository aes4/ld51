if (keyboard_check_released(ord("W")) || keyboard_check_released(vk_up)) {
	if selected > 0 selected -= 1
	else selected = array_length(options) - 1
	audio_play_sound(nselect, 5, false, opersistent.vol)
}
if (keyboard_check_released(ord("S")) || keyboard_check_released(vk_down)) {
	if selected == array_length(options) selected = 0
	else selected += 1
	audio_play_sound(nselect, 5, false, opersistent.vol)
}
if (keyboard_check_released(vk_enter) || keyboard_check_released(vk_space)) {
    switch (options[selected]) {
        case "debug":
            opersistent.debug = true
        case "quit":
            game_end()
            break
        default:
            room_goto(options[selected])
    }
}
if (options[selected] == "volume") {
    if (keyboard_check_released(ord("A")) || keyboard_check_released(vk_left)) {
        if (opersistent.vol - 0.05 > 0) { opersistent.vol -= 0.05 } else { opersistent.vol = 0 }
    }
    if (keyboard_check_released(ord("D")) || keyboard_check_released(vk_right)) {
        opersistent.vol += 0.05
    }
}