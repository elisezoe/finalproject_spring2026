//discard one at a time


if (ds_list_size(discard_queue) > 0)
{
	audio_play_sound(cardsound, 1, false);
    var _next = ds_list_find_value(discard_queue, 0);
    ds_list_delete(discard_queue, 0);

	//visual stacking
    var _idx = ds_list_size(discard);
    _next.target_x = discard_x_position;
    _next.target_y = discard_y_position - _idx * 2;
    _next.target_depth = -_idx;
    _next.face_up = true;
    _next.in_player_hand = false;
    ds_list_add(discard, _next);

	//wait between cards
    alarm[4] = 20;
}
else
//if queue empty
{
    if (ds_list_size(deck) > 0)
        global.STATE = STATE.DEALING;
    else
        global.STATE = STATE.RESHUFFLE;
}