/// @desc

var _confirm = keyboard_check_pressed(vk_space);
if (!_confirm) {
	_confirm = keyboard_check_pressed(vk_enter);
}
if (!_confirm) {
	_confirm = keyboard_check_pressed(ord("Z"));
}
var _pause = keyboard_check_pressed(vk_escape);

if (_pause) || (_confirm) {
	var _transition = instance_create_depth(0,0,-100,obj_transition);
	_transition.image_alpha = 0;
	_transition.fadeType = 1;
	_transition.fadeSpeed = 0.05;
	_transition.destination = rm_title;
}

draw_set_valign(fa_middle);
draw_set_halign(fa_center);
draw_set_font(fnt_01)
draw_text_transformed(room_width/2,room_width/2,@"
You defeated the Council of Order (who turned out to be witches)
and in return for sparing their lives, they lifted the curse.
Thanks to you, Sir Magicspells the Wise can live freely
without fear of ever being blown up.

GAME COMPLETE!
",0.35,0.35,0);