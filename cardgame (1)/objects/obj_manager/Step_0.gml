

switch (global.STATE)
{
	case STATE.DEALING:

{
    if (ds_list_size(deck) > 0)
    {
       //add to queue
        var _deal_count = min(3, ds_list_size(deck));
        for (var i = 0; i < _deal_count; i++)
        {
            ds_list_add(deal_queue, "enemy");
        }
        for (var i = 0; i < _deal_count; i++)
        {
            ds_list_add(deal_queue, "player");
        }
        global.STATE = STATE.COMPARE;
		
		//dealing code is in alarm
        alarm[5] = 20;
    }
    else
    {
        global.STATE = STATE.RESHUFFLE;
    }
}


break;

	case STATE.CHOOSE:
{
    if (player_choice != noone)
    {
		audio_play_sound(cardsound, 1, false);
        alarm[1] = 60; //delay before reveal
        global.STATE = STATE.COMPARE;
    }
}
break;

	case STATE.COMPARE:
	{
		//alarm
	}
	break;

case STATE.RESOLVE:
{
	
    if (player_choice != noone && enemy_choice != noone)
    {
        var _p_done =
            abs(player_choice.x - player_choice.target_x) < 1 &&
            abs(player_choice.y - player_choice.target_y) < 1;
        var _e_done =
            abs(enemy_choice.x - enemy_choice.target_x) < 1 &&
            abs(enemy_choice.y - enemy_choice.target_y) < 1;

        if (_p_done && _e_done) //if both have picked cards
        {
            var _p = player_choice.face_index;
            var _e = enemy_choice.face_index;
		//tie or add points to winner
            if (_p == _e)
                show_debug_message("TIE");
            else if ((_p == 0 && _e == 2) || (_p == 1 && _e == 0) || (_p == 2 && _e == 1))
               { global.player_score++;
				audio_play_sound(roundwin, 1, false);
			   }
            else
			{
                global.enemy_score++;
				audio_play_sound(roundlose, 1, false);	
			}

           //add them to discard list
            ds_list_add(discard_queue, enemy_choice);
            ds_list_add(discard_queue, player_choice);

			//put them in a queue so they discard one at a time
            while (ds_list_size(enemy_hand) > 0)
            {
                ds_list_add(discard_queue, ds_list_find_value(enemy_hand, 0));
                ds_list_delete(enemy_hand, 0);
            }

            while (ds_list_size(player_hand) > 0)
            {
                ds_list_add(discard_queue, ds_list_find_value(player_hand, 0));
                ds_list_delete(player_hand, 0);
            }

            player_choice = noone;
            enemy_choice = noone;
			//discard once its their turn
            alarm[4] = 20;
        }
    }
}
break;

	case STATE.RESHUFFLE:
	
	//clear the hands 
{
    while (ds_list_size(enemy_hand) > 0)
    {
        var _card = ds_list_find_value(enemy_hand, 0);
        ds_list_delete(enemy_hand, 0);
        _card.in_player_hand = false;
        _card.face_up = false;
        ds_list_add(discard, _card);
    }

    if (ds_list_size(discard) > 0)
    {
        var _card_to_move = ds_list_find_value(discard, 0);
        ds_list_delete(discard, 0);
        ds_list_add(deck, _card_to_move);
        _card_to_move.target_x = x;
		var _deck_index = ds_list_size(deck) - 1;
		_card_to_move.target_y = y - (ds_list_size(deck) - 1 + _deck_index) * 2;
      
        _card_to_move.target_depth = -ds_list_size(deck);
        _card_to_move.face_up = false;
        _card_to_move.in_player_hand = false;
    }
    else
    {
        global.STATE = STATE.COMPARE;
        alarm[6] = 60;
    }
}
break;

}