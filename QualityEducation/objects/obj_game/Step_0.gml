/// @desc

var _up = 0;
var _down = 0;
var _left = 0;
var _right = 0;
var _confirm = 0;
var _pause = 0;
var _debug = 0;
if (caninput) {
	_up = keyboard_check_pressed(vk_up);
	_down = keyboard_check_pressed(vk_down);
	_left = keyboard_check_pressed(vk_left);
	_right = keyboard_check_pressed(vk_right);
	_confirm = keyboard_check_pressed(vk_space);
	if (!_confirm) {
		_confirm = keyboard_check_pressed(vk_enter);
	}
	if (!_confirm) {
		_confirm = keyboard_check_pressed(ord("Z"));
	}
	_pause = keyboard_check_pressed(vk_escape);
	if (global.debug == true) {
		_debug = keyboard_check_pressed(vk_tab);
	}
}

if (_debug) {
	instance_destroy(obj_brickparent_vulnerable);
	pnts = 1000;
}

if (_pause) {
	//fade in
	var _transition = instance_create_depth(0,0,-100,obj_transition);
	_transition.image_alpha = 0;
	_transition.fadeType = 1;
	_transition.fadeSpeed = 0.05;
	_transition.destination = rm_levelselect;
}

if (_confirm) && (gameState == "gameover") {
	room_restart();
}	

//evaluate game if in game mode and there's no balls remaining
if (gameState == "game") && (!instance_exists(obj_ball)) {
	//win if out of bricks and have enough points
	if (pnts >= targetPoints) {
		if (instance_number(obj_brickparent_vulnerable) <= 0) || (ballsRemaining <= 0) {
			alarm[2] = (0.5 * game_get_speed(gamespeed_fps));
			gameState = "beforewin"
		}
	} else {
		//game over if out of balls and there's still bricks left
		if (ballsRemaining <= 0) {
			alarm[0] = (1 * game_get_speed(gamespeed_fps));
			gameState = "beforegameover";
		}
	}
}