//draw scores

var player_score_text = string(global.player_score);
var enemy_score_text = string(global.enemy_score);

draw_set_font(fnt_points);
	draw_set_color(c_white);
	draw_text(10, 10, enemy_score_text);
	draw_text(10,700, player_score_text);
	
	show_debug_message("P:" + string(global.player_score) + " E:" + string(global.enemy_score));