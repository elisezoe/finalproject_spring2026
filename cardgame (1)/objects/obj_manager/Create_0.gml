
enum STATE
{
	DEALING,
	CHOOSE,
	COMPARE,
	RESOLVE,
	RESHUFFLE
}

global.STATE = STATE.DEALING;

//card setup vars
num_cards = 24;



//lists
deck = ds_list_create();
player_hand = ds_list_create();
discard = ds_list_create();
enemy_hand = ds_list_create();


//position setup
hand_x_offset = 100;
discard_x_position = room_width - 100;
discard_y_position = y-50;

hand_y = room_height * 0.8;
enemy_hand_y = room_height *0.2;
enemy_hand_x_offset = 100;

play_center_x = room_width / 2;
play_center_y = room_height / 2;

player_offset = -60;


//card variables
player_choice = noone;
enemy_choice = noone;
global.player_score = 0;
global.enemy_score = 0;



for(var _i = 0; _i < num_cards; _i++)
{
	//make new card
	var _new_card = instance_create_layer(x,y,"Instances",obj_card);
	
	//declares variables & tells card what their value is 
	//face color
	//this will determine 0,1,2
	_new_card.face_index = _i % 3;
	
	//not face up
	_new_card.face_up = false;
	
	//not in hand
	_new_card.in_player_hand = false;

	//target depth 0
	_new_card.target_depth = 0;
	
	_new_card.target_x = x;
	_new_card.target_y = y;
	
	
	//add to deck
	ds_list_add(deck, _new_card);
}

//random seed
randomize();
//shuffle deck
ds_list_shuffle(deck);

for (var i = 0; i < ds_list_size(deck); i++)
{
    var _card = ds_list_find_value(deck, i);

    _card.target_x = x;
    
    _card.target_y = y - (ds_list_size(deck) - 1 + i) * 2;
    
    _card.target_depth = -i;
}

//discard cards one at a time
discard_queue = ds_list_create();

//deal one at a time
deal_queue = ds_list_create();