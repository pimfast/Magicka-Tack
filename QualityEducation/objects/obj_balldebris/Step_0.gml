/// @desc

var _friction = 0.25;

if (vsp > 0) {
	if (vsp-_friction < 0) {
		vsp = 0;
	} else {
		vsp -= _friction;
	}
}
if (vsp < 0) {
	if (vsp+_friction > 0) {
		vsp = 0;
	} else {
		vsp += _friction;
	}
}
if (hsp > 0) {
	if (hsp-_friction < 0) {
		hsp = 0;
	} else {
		hsp -= _friction;
	}
}
if (hsp < 0) {
	if (hsp+_friction > 0) {
		hsp = 0;
	} else {
		hsp += _friction;
	}
}

x += hsp;
y += vsp;