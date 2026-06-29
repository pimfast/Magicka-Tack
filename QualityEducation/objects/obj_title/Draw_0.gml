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
	audio_play_sound(sfx_select,0,0);
}

draw_set_font(fnt_01);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _unselectedcolor = make_color_rgb(160,90,160);
var _selectedcolor;
if (caninput == true) {
	_selectedcolor = c_white;
} else {
	_selectedcolor = c_gray;
}


//DRAW MENU
var _titleX = room_width/2;
var _titleY = room_height*0.20;
var _playbuttonX = room_width/5;
var _playbuttonY = room_height*0.6;
var _quitbuttonX = room_width/5;
var _quitbuttonY = room_height*0.7;
var _scrollX = 123;
var _scrollY = 93;

var _scroll;

draw_text_transformed_color(_titleX,_titleY,"Magicka-Tack",1.5,1.5,0,_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);

switch (selectedoption) {
	case 0:
		//start game
		draw_text_color(_playbuttonX,_playbuttonY,"Play",_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		draw_text_color(_quitbuttonX,_quitbuttonY,"Quit",_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		_scroll = draw_sprite(spr_scroll,0,_scrollX,_scrollY);
		
		if (_up) {
			selectedoption = 1;
		}
		if (_down) {
			selectedoption = 1;
		}
		if (_right) {
			selectedoption = 2;
		}
		if (_confirm) {
			caninput = false;
			audio_play_sound(sfx_select,0,0);
			audio_group_set_gain(ag_mus,0,500);
			var _transition = instance_create_depth(0,0,-100,obj_transition);
			_transition.image_alpha = 0;
			_transition.fadeType = 1;
			_transition.fadeSpeed = 0.05;
			_transition.destination = rm_levelselect;
		}
		break;
	case 1:
		//quit game
		draw_text_color(_playbuttonX,_playbuttonY,"Play",_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_quitbuttonX,_quitbuttonY,"Quit",_selectedcolor,_selectedcolor,_selectedcolor,_selectedcolor,1);
		_scroll = draw_sprite(spr_scroll,0,_scrollX,_scrollY);
		
		if (_up) {
			selectedoption = 0;
		}
		if (_down) {
			selectedoption = 0;
		}
		if (_right) {
			selectedoption = 2;
		}
		if (_confirm) {
			game_end();
		}
		break;
	case 2:
		//scroll
		draw_text_color(_playbuttonX,_playbuttonY,"Play",_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		draw_text_color(_quitbuttonX,_quitbuttonY,"Quit",_unselectedcolor,_unselectedcolor,_unselectedcolor,_unselectedcolor,1);
		
		var _scrollWidth = sprite_get_width(spr_scroll);
		var _scrollHeight = sprite_get_height(spr_scroll);
		var _scrollExpansion = 1.25;
		if (!instance_exists(obj_storyscroll)) {
			_scroll = draw_sprite_stretched(spr_scroll,1,_scrollX-(_scrollWidth*_scrollExpansion)/2,_scrollY-(_scrollHeight*_scrollExpansion)/2,_scrollWidth*_scrollExpansion,_scrollHeight*_scrollExpansion);
		}
		
		if (_left) {
			selectedoption = 0;
		}
		if (_confirm) {
			caninput = false;
			instance_create_depth(room_width/2,0,10,obj_storyscroll);
		}
}

if (_pause) {
	if (selectedoption != 1) {
		selectedoption = 1;
	} else {
		game_end();
	}
}