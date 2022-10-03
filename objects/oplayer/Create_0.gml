stage = 0
spread = true  // !inshell
rotate = 0
midair = false
leftshellmidair = false
incurve = false
finaljump = false
finaljumpsound = true
finalwalk = false
oldy = y
s = 0.2  // speed
angle = 1.6
dashing = false
dashes = 0
dashingtimer = 0
dashstage = 0
sprites = [s1, s2, s3, s4, s5, s6, s7, s8, s9, sidle]
keys = ["A", "S",  "D",  "F",  "G",  "H",  "J",  "K",  "L",  ";"]  // move to qwerty after testing
starts = [{ x: 1755, y: 293 }, { x: 1204, y: 213 }, { x: 665, y: 303 }, { x: 403, y: 309 }, { x: 103, y: 246 }]
curves = [
    { x: 2240, y: 614 }, { x: 2189, y: 643 }, { x: 2137, y: 659 }, { x: 2086, y: 656 }, { x: 2038, y: 652 }, { x: 1986, y: 629 }, { x: 1903, y: 552 }, { x: 1824, y: 437 }, { x: 1785, y: 360 },
    { x: 1589, y: 345 }, { x: 1548, y: 418 }, { x: 1500, y: 483 }, { x: 1462, y: 510 }, { x: 1425, y: 523 }, { x: 1379, y: 522 }, { x: 1330, y: 507 }, { x: 1295, y: 461 }, { x: 1247, y: 342 }, { x: 1222, y: 255 },
    { x: 969, y: 439 }, { x: 936, y: 487 }, { x: 879, y: 517 }, { x: 794, y: 516 }, { x: 759, y: 501 }, { x: 724, y: 455 }, { x: 704, y: 403 }, { x: 682, y: 339 },
    { x: 573, y: 367 }, { x: 555, y: 410 }, { x: 519, y: 439 }, { x: 481, y: 438 }, { x: 453, y: 416 }, { x: 425, y: 371 }, { x: 416, y: 334 },
	{ x: 308, y: 342 }, { x: 298, y: 368 }, { x: 275, y: 390 }, { x: 229, y: 401 }, { x: 192, y: 388 }, { x: 166, y: 369 }, { x: 144, y: 348 }, { x: 128, y: 298 }, { x: 118, y: 255 }
]
ends = [{ x: 2288, y: 571 }, { x: 1610, y: 301 }, { x: 989, y: 377 }, { x: 586, y: 313 }, { x: 311, y: 326 }]
tstart = l(starts)
tcurve = l(curves)
tend = l(ends)
next = tcurve