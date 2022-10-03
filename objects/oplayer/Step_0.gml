function falling() {
    return (oldy < y)
}

function onground() {
    return (incurve && next.y + 80 < y && midair && leftshellmidair)
}

function fall() {
    return (!incurve && !place_meeting(x, y + 1, owall) && !place_meeting(x, y + 1, owall2) && !finaljump)  // maybe missing && midair && leftshellmidair
}

function walk() {
    image_angle = 0
    for (i = 0; i < array_length(keys) - 1; i++) {
        if (i <= array_length(keys) - 2) {
            if (keyboard_check(ord(keys[i])) && stage = i) {
                sprite_index = sprites[i]
                x++
                stage++
                // if (stage == 9) { stage = 0 }
            }
        }
        if (keyboard_check(186) && stage == 9) { sprite_index = sidle x++ stage = 0 }
    }
}

function verticalclimb() {
    image_angle = 90
    for (i = 0; i < array_length(keys) - 1; i++) {
        if (i <= array_length(keys) - 2) {
            if (keyboard_check(ord(keys[i])) && stage = i) {
                sprite_index = sprites[i]
                y--
                stage++
                // if (stage == 9) { stage = 0 }
            }
        }
        if (keyboard_check(186) && stage == 9) { sprite_index = sidle y-- stage = 0 }
    }
}

function walkoncurve() {
    image_angle = point_direction(x, y, next.x, next.y)
    for (i = 0; i < array_length(keys) - 1; i++) {
        if (i <= array_length(keys) - 2) {
            if (keyboard_check(ord(keys[i])) && stage = i) {
                sprite_index = sprites[i]
                move_towards_point(next.x, next.y, 1)
                stage++
                // if (stage == 9) { stage = 0 }
            }
        }
        if (keyboard_check(186) && stage == 9) { sprite_index = sidle move_towards_point(next.x, next.y, 1) stage = 0 }
    }
}



move_towards_point(0, 0, 0)  // if move get set have to unset it

if (len(starts) >= 2) {
    if (x > tstart.x) {
        pop(starts) tstart = l(starts)
        incurve = true
    }
}
if (len(starts) == 1) {
    if (x > tstart.x) {
        tstart = starts[0]
        incurve = true
        pop(starts)
    }
}
if (len(starts) == 0) {
    if (x > tstart.x) {
        incurve = true
    }
}
if (len(curves) >= 2) {
    if (x > tcurve.x) {
        pop(curves) tcurve = l(curves)
    }
}
if (len(curves) == 1) {
    if (x > tcurve.x) {
        tcurve = curves[0]
        pop(curves)
    }
}
if (len(curves) == 0) {
    if (x > tcurve.x) {
        tcurve = tend
    }
}
if (len(ends) >= 2) {
    if (x > tend.x) {
        pop(ends) tend = l(ends)
        incurve = false
        audio_play_sound(nlaunch, 4, false, opersistent.vol)
        midair = true
    }
}
if (len(ends) == 1) {
    if (x > tend.x) {
        tend = ends[0]
        pop(ends)
        incurve = false
        audio_play_sound(nlaunch, 4, false, opersistent.vol)
        midair = true
    }
}
if (len(starts) == 0 && len(curves) == 0 && len(ends) == 0) {
    finaljump = true incurve = false
}
if (tcurve.x < tend.x) {
    next = tcurve
} else {
    next = tend
}

if !(dashing) {
    if !(finalwalk) {
        if (spread) {
            if (fall()) { y++ }
            if (!incurve && !midair && !finaljump) { walk() if keyboard_check_released(ord("I")) dashing = true}
            if (incurve && !midair) { walkoncurve() }
            if (!incurve && midair) {  // land
                if (place_meeting(x, y + 2, owall)) || (place_meeting(x, y + 2, owall2)) {
                    audio_play_sound(nland, 9, false, opersistent.vol)
                    midair = false leftshellmidair = false
                }
            }
            if (incurve && midair && leftshellmidair) {
                y++
                if (onground) { midair = false leftshellmidair = false }
            }
            if (finaljump) {
                if (place_meeting(x, y, overticalwall)) {
                    if (finaljumpsound) { audio_play_sound(nland, 15, false, opersistent.vol) finaljumpsound = false }
                    verticalclimb()
                    if (place_meeting(x, y, owall)) { y -= 76 finalwalk = true }
                } else {
                    x += s y -= s * angle
                }
            }
            if (keyboard_check_released(vk_space)) { sprite_index = sshell spread = false }
        } else {
            if ((incurve && !midair) || (incurve && midair && leftshellmidair) && !finaljump) { move_towards_point(next.x, next.y, s) }
            if (midair && !leftshellmidair) {  // launch after end at angle
                x += s y -= s * angle
            }
            if (onground()) { midair = false leftshellmidair = false }
            if (falling()) { s += 0.08 } else {
                if (s > 0.1) { s -= 0.076 }
            }
            if (fall()) { y++ }
            if (finaljump) {
                if (place_meeting(x, y, overticalwall)) {
                    y += 2
                } else {
                    x += s y -= s * angle
                }
            }
            if (rotate > -360) { image_angle = rotate rotate-- } else { rotate = 0 }
            if (keyboard_check_released(vk_space)) {
                s = 0.1
                spread = true
                if (midair) { leftshellmidair = true }
                sprite_index = sidle
            }
        }
    } else {
        if (!place_meeting(x, y + 1, owall)) { y++ }
        if keyboard_check_released(ord("I")) dashing = true
        walk()
    }
} else {
    if (dashes > 0) {
        if (dashstage <= ((len(sprites)) * 2) + 2) {
            x++
            if (dashstage <= len(sprites)) {
                sprite_index = sprites[dashstage]
            } else { sprite_index = sprites[dashstage - (len(sprites) + 1)] }
            dashstage++
        }
        if (dashstage == ((len(sprites)) * 2) + 2) {
            dashing = false dashstage = 0 dashes--
        }
    } else {
        dashing = false
    }
}

oldy = y
if (dashingtimer < 60 * 10) {dashingtimer++} else { dashes++ dashingtimer = 0}