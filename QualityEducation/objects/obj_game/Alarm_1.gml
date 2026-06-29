/// @desc win

obj_player.caninput = false;
obj_player.alarm[0] = -1;
gameState = "win";

switch (currentlevel) {
	case 0:
		global.skills[0] = true;
		break;
	case 1:
		global.skills[1] = true;
		break;
	case 2:
		global.skills[2] = true;
		break;
	case 3:
		global.skills[3] = true;
		break;
	case 4:
		global.skills[4] = true;
		break;
	case 5:
		//fade in
		var _transition = instance_create_depth(0,0,-100,obj_transition);
		_transition.image_alpha = 0;
		_transition.fadeType = 1;
		_transition.fadeSpeed = 0.05;
		_transition.destination = rm_win;
		break;
}

if (currentlevel+1 > global.levelsunlocked) {
	global.levelsunlocked = currentlevel+1;
}
global.highscores[currentlevel] = pnts;