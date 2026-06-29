/// @desc

//show points
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text(5,5,string(pnts));

//draw target score OR your highscore if that's higher
draw_set_halign(fa_right);
draw_set_valign(fa_top);
if (global.highscores[currentlevel] > targetPoints) {
	draw_text_color(room_width-5,5,string(global.highscores[currentlevel]),c_white,c_white,c_white,c_white,1);
} else {
	//targetPoints is higher, so that's more important to display
	draw_text_color(room_width-5,5,string(targetPoints),c_purple,c_purple,c_purple,c_purple,1);
}

//draw remaining balls
if (ballsRemaining >= 1) {
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	draw_text_colour(room_width-5,room_height-5,string(ballsRemaining),c_yellow,c_yellow,c_yellow,c_yellow,1);
}

//draw win/lose message
draw_set_halign(fa_center);
draw_set_valign(fa_top);
if (gameState == "win") && (currentlevel != 5) {
	draw_text(room_width/2,room_height/4,"Level complete!\nPress Esc to continue");
	switch (currentlevel) {
	case 0:
		//
		break;
	case 1:
		draw_set_colour(make_color_rgb(255,173,50));
		draw_text(room_width/2,room_height/2-20,"\nYou learned\nsomething new!")
		draw_set_colour(make_color_rgb(229,11,26));
		draw_text(room_width/2,room_height/2-20,"\n\n\nPress Shift to strafe!!");
		break;
	case 2:
		draw_set_colour(make_color_rgb(255,173,50));
		draw_text(room_width/2,room_height/2-20,"\nYou learned\nsomething new!")
		draw_set_colour(make_color_rgb(229,11,26));
		draw_text(room_width/2,room_height/2-20,"\n\n\nHold Attack to Dash!!");
		break;
	case 3:
		//draw_set_colour(make_color_rgb(255,173,50));
		//draw_text(room_width/2,room_height/2-15,"\nYou learned\nsomething new!")
		//draw_set_colour(make_color_rgb(229,11,26));
		//draw_text(room_width/2,room_height/2-15,"\n\n\nPress X to strike!!");
		break;
	case 4:
		draw_set_colour(make_color_rgb(255,173,50));
		draw_text(room_width/2,room_height/2-20,"\nYou learned\nsomething else!")
		draw_set_colour(make_color_rgb(229,11,26));
		draw_text(room_width/2,room_height/2-20,"\n\n\nHit the ball at the end of\n a level for a bonus!!");
		break;
	case 5:
		//
		break;
	}
	draw_set_colour(c_white);
}
if (gameState == "gameover") {
	draw_text(room_width/2,room_height/4,"Game over!\nPress Space to retry\nEsc to return to menu");
}