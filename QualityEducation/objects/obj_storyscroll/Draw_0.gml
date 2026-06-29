/// @desc

var _confirm = 0;
var _pause = 0;
if (caninput) {
	_confirm = keyboard_check_pressed(vk_space);
	if (!_confirm) {
		_confirm = keyboard_check_pressed(vk_enter);
	}
	if (!_confirm) {
		_confirm = keyboard_check_pressed(ord("Z"));
	}
	_pause = keyboard_check_pressed(vk_escape);
}

if (_confirm) || (_pause) {
	alarm[0] = 1;
	exit;
}

draw_self();

var _text = @"
I believe that I, Sir Magicspells the Wise, will die as soon as tomorrow morning.
This is my story.

50 years ago, I wanted to celebrate my birthday by playing a prank on the neighboring witches.
I sent a letter saying "+"\""+"U R STUPIDS"+"\""+@", and the witches took revenge by placing a curse upon me.
An unbreakable curse which would have made me explode violently upon entering an magic academy or school of any sort, so I had to drop out.
It turned out to be a blessing in disguise however, as I found a love for swordfighting that I would have never discovered had I continued going to the academy like the other wizards.

     Fast forward to tonight, as I looked upon my crystal ball to see what tomorrow would bring, I wept.
For tomorrow, the Council of Order will have decided to cast a MIND-CONTROL SPELL on all the denizens of Mageia to force them to go to magic academy, myself included...
This is where you come in, dear player. Guide my blade on a quest to change the future and stop the Council of Order before it's too late!!
...Pretty please.
I don't want to blow up.
"

draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_set_font(fnt_02)
draw_text_ext_transformed_colour(23,10,_text,18,450,0.25,0.25,0,c_black,c_black,c_black,c_black,1);