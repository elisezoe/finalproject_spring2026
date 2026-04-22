//actual reshuffle code

ds_list_shuffle(deck);

for (var i = 0; i < ds_list_size(deck); i++)
{
    audio_play_sound(cardsound, 1, false);
    var _current_card = ds_list_find_value(deck, i);
    _current_card.target_x = x;
    _current_card.target_y = y - (ds_list_size(deck) - 1 + i) * 2;
    _current_card.target_depth = -i;
    _current_card.face_up = false;
    _current_card.in_player_hand = false;
}

global.STATE = STATE.DEALING;