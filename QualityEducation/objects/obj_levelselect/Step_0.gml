/// @desc

var _up = 0;
var _down = 0;
var _left = 0;
var _right = 0;
var _confirm = 0;
var _pause = 0;
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
}

if (_confirm) {
	if (selectedlevel.associatedlevel != 0) {
		//fade in
		var _transition = instance_create_depth(0,0,-100,obj_transition);
		_transition.image_alpha = 0;
		_transition.fadeType = 1;
		_transition.fadeSpeed = 0.05;
		_transition.destination = asset_get_index("rm_level_"+string(selectedlevel.associatedlevel));
	} else {
		//fade in
		var _transition = instance_create_depth(0,0,-100,obj_transition);
		_transition.image_alpha = 0;
		_transition.fadeType = 1;
		_transition.fadeSpeed = 0.05;
		_transition.destination = rm_title;
	}
}

if (_pause) {
	//fade in
	var _transition = instance_create_depth(0,0,-100,obj_transition);
	_transition.image_alpha = 0;
	_transition.fadeType = 1;
	_transition.fadeSpeed = 0.05;
	_transition.destination = rm_title;
}