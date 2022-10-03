if (keyboard_check_released(ord("W")) || keyboard_check_released(vk_up)) {
	if selected > 0 selected -= 1
	else selected = array_length(options) - 1
	audio_play_sound(nselect, 5, false, opersistent.vol)
}
if (keyboard_check_released(ord("S")) || keyboard_check_released(vk_down)) {
	if selected == array_length(options) - 1 selected = 0
	else selected += 1
	audio_play_sound(nselect, 5, false, opersistent.vol)
}
if (keyboard_check_released(vk_enter) || keyboard_check_released(vk_space)) {
    switch (options[selected]) {
        case "quit":
            game_end()
            break
        default:
            room_goto(options[selected])
    }
}