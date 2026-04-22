//deal cards one by one


if (ds_list_size(deal_queue) > 0)
{
	 audio_play_sound(cardsound, 1, false);
    var _target = ds_list_find_value(deal_queue, 0);
    ds_list_delete(deal_queue, 0);

    if (ds_list_size(deck) > 0)
    {
		//pick top card
        var _card = ds_list_find_value(deck, ds_list_size(deck) - 1);
        ds_list_delete(deck, ds_list_size(deck) - 1);

			//deal enemy first
        if (_target == "enemy")
        {
            var _idx = ds_list_size(enemy_hand);
            ds_list_add(enemy_hand, _card);
            _card.target_x = room_width -  435 + (_idx - 1) * enemy_hand_x_offset;
            _card.target_y = enemy_hand_y;
            _card.in_player_hand = false;
            _card.face_up = false;
        }
        else
        {
			//deal player
            var _idx = ds_list_size(player_hand);
            ds_list_add(player_hand, _card);
            _card.target_x = room_width - 435 + (_idx - 1) * hand_x_offset;
            _card.target_y = hand_y;
            _card.in_player_hand = true;
            _card.face_up = true;
        }
    }
	//delay between cards
    alarm[5] = 20;
}
else
{
    global.STATE = STATE.CHOOSE;
    alarm[0] = 30;
}