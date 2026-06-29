/// @desc

draw_set_halign(fa_left);
draw_set_valign(fa_top);
if (selectedlevel.associatedlevel != 0) {
	draw_text(5,2,string(global.highscores[selectedlevel.associatedlevel]));
}