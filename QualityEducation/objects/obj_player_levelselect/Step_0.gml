/// @desc

var _up = 0;
var _down = 0;
var _left = 0;
var _right = 0;
if (caninput) {
	_up = keyboard_check_pressed(vk_up);
	_down = keyboard_check_pressed(vk_down);
	_left = keyboard_check_pressed(vk_left);
	_right = keyboard_check_pressed(vk_right);
}

var _xSpriteCenter = x+(sprite_width/2)
var _ySpriteCenter = y+(sprite_height/2)
var _targetlevel = noone;

if (_up == true) {
	
	var _list = ds_list_create();
	
	var _num = collision_line_list(_xSpriteCenter,_ySpriteCenter-8,_xSpriteCenter,_ySpriteCenter-80,obj_level,false,true,_list,true);
	if (_num > 0) {
		//for (var i = 0; i < _num; ++i)
		//{
			_targetlevel = _list[| 0];
		//}
	}
	ds_list_destroy(_list);
}
if (_down == true) {
	
	var _list = ds_list_create();
	
	var _num = collision_line_list(_xSpriteCenter,_ySpriteCenter+8,_xSpriteCenter,_ySpriteCenter+80,obj_level,false,true,_list,true);
	if (_num > 0) {
		_targetlevel = _list[| 0];
	}
	ds_list_destroy(_list);
}
if (_left == true) && (obj_levelselect.selectedlevel.associatedlevel != 3) {
	
	var _list = ds_list_create();
	
	var _num = collision_line_list(_xSpriteCenter-8,_ySpriteCenter,_xSpriteCenter-80,_ySpriteCenter,obj_level,false,true,_list,true);
	if (_num > 0) {
		_targetlevel = _list[| 0];
	}
	ds_list_destroy(_list);
}

if (_right == true) && (obj_levelselect.selectedlevel.associatedlevel != 0) {
	
	var _list = ds_list_create();
	
	var _num = collision_line_list(_xSpriteCenter+8,_ySpriteCenter,_xSpriteCenter+80,_ySpriteCenter,obj_level,false,true,_list,true);
	if (_num > 0) {
		_targetlevel = _list[| 0];
	}
	ds_list_destroy(_list);
}

if (_targetlevel != noone) {
	x = _targetlevel.x;
	y = _targetlevel.y;
	
	global.playerLevelSelectX = obj_player_levelselect.x;
	global.playerLevelSelectY = obj_player_levelselect.y;
	
	obj_levelselect.selectedlevel = instance_position(x,y,obj_level);
}