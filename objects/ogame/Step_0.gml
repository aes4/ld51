if (keyboard_check_released(ord("R"))) {
	instance_destroy(oplayer)
	instance_create_layer(34, 220, "Instances", oplayer)
	otimer.timer = 0
}
if (oplayer.x >= oflag.x) {
    opersistent.finaltime = otimer.timer
	audio_play_sound(nend, 8, false, opersistent.vol)
	if otimer.timer > 60 * 20 { room_goto(rlose) }
    if otimer.timer <= 60 * 20 {
    	if otimer.timer <= 60 * 10 {
    		room_goto(rty)
		} else {
			room_goto(rwin)
		}
	 }
}
if (oplayer.y > room_height) {
    room_goto(rland)
}