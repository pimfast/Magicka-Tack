/// @desc

audio_group_stop_all(ag_mus);

//fade in
var _transition = instance_create_depth(0,0,-100,obj_transition);
_transition.image_alpha = 1;
_transition.fadeType = 0;

caninput = true;
pnts = 0;
gameState = "game";
currentlevel = int64(string_digits(room_get_name(room)));

switch (currentlevel) {
	case 1:
		ballsRemaining = 3;
		targetPoints = 120;
		break;
	case 2:
		ballsRemaining = 3;
		targetPoints = 300;
		break;
	case 3:
		ballsRemaining = 3;
		targetPoints = 175;
		break;
	case 4:
		ballsRemaining = 2;
		targetPoints = 200;
		break;
	case 5:
		ballsRemaining = 1;
		targetPoints = 185;
		break;
}

//targetPoints = 0;