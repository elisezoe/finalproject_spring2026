enum STATE
{
    PLAYING,
    JACK_REVEALED,
    RESET
}

global.STATE = STATE.PLAYING;

deck = ds_list_create();
discard = ds_list_create();

num_cards = 20;

//positions
deck_x = room_width * 0.25;
deck_y = room_height * 0.5;

play_center_x = room_width * 0.75;
play_center_y = room_height * 0.5;

discard_x = room_width * 0.9;
discard_y = room_height * 0.5;


current_card = noone;
round_active = false;

reaction_timer = 0;
enemy_react_time = 0;

enemy_min_react = 40;
enemy_max_react = 110;

player_react_window = 150; 

global.player_score = 0;
global.enemy_score = 0;


for (var i = 0; i < num_cards; i++)
{
    var _card = instance_create_depth(deck_x, deck_y, 0, obj_card);

    
    _card.face_index = irandom_range(1, 4);

    //one jack
    if (i == 0)
    {
        _card.face_index = 0;
    }

    _card.face_up = false;

    _card.target_x = deck_x;
    _card.target_y = deck_y - i * 2;

    ds_list_add(deck, _card);
}


randomize();
ds_list_shuffle(deck);


for (var i = 0; i < ds_list_size(deck); i++)
{
    var _card = ds_list_find_value(deck, i);

    _card.target_x = deck_x;
    _card.target_y = deck_y - (i * 2);
    _card.depth = -i;
    _card.face_up = false;
}


alarm[0] = 60;

depth_counter = -1000;

center_pile = ds_list_create(); 

return_queue = ds_list_create();

return_stack_index = 0;