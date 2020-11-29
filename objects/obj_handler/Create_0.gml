// A "mega object" that handles a lot of set and background variables that need to be made.
// Is recreated at the start of every level and allows us to keep track of what pets we need in a level,
// how fast they should be moving, what the pet objects are, etc.

// Preventing issues with the current level not being defined on creation and making sure it doesn't get reset
if(!variable_global_exists("current_level"))
{
	global.current_level = 0
}

// A general definition of the size of a tile that can be adjusted
global.tile_size = 32


// Storage of all the pet objects
global.pet_objects = [obj_pet_1, obj_pet_2, obj_pet_3, obj_pet_4, obj_pet_5]


// Storage of all the level rooms
global.level_rooms = [undefined, rm_level_01, rm_level_02, rm_level_03, rm_level_04, rm_level_05, rm_level_06, rm_level_07, rm_level_08, rm_level_09, rm_level_10, rm_level_11, rm_level_12, rm_level_13, rm_level_14, rm_level_15, rm_level_16, rm_level_17, rm_level_18, rm_level_19, rm_level_20, rm_level_21, rm_level_22, rm_level_23, rm_level_24]


// Storage of what pets show up in each level
global.pets_in_each_level = [
	[doggo],	// level 0
	[doggo],	// level 1
	[doggo],	// level 2
	[doggo],	// level 3
	[catto],	// level 4
	[catto],	// level 5
	[bunno],	// level 6
	[bunno, catto],	// level 7
	[doggo],	// level 8
	[doggo, bunno, spr_hedgehog],	// level 9
	[spr_hedgehog, doggo, catto],	// level 10
	[spr_snake],	// level 11
	[doggo, spr_hedgehog],	// level 12
	[catto],	// level 13
	[spr_hedgehog, spr_snake],	// level 14
	[doggo, bunno, spr_snake, spr_hedgehog, catto]	// level 15
	//[undefined, undefined, undefined, undefined, undefined]	// level x
	]


// Storage of what pets show up in the current level
global.pets_in_current_level = global.pets_in_each_level[global.current_level]


// Setup of the audio emitters so the pets can bark, meow, etc.
global.pet_1_audio_emitter = audio_emitter_create()
global.pet_2_audio_emitter = audio_emitter_create()
global.pet_3_audio_emitter = audio_emitter_create()
global.pet_4_audio_emitter = audio_emitter_create()
global.pet_5_audio_emitter = audio_emitter_create()
global.audio_emitters = [global.pet_1_audio_emitter, global.pet_2_audio_emitter, global.pet_3_audio_emitter, global.pet_4_audio_emitter, global.pet_5_audio_emitter]
audio_falloff_set_model(audio_falloff_linear_distance_clamped);
var i
for(i = 0; i < 5; i++)
{
	audio_emitter_falloff(global.audio_emitters[i],1,750,1.5);
}


// Assigning sprites to pets based on level
if(global.current_level != 0)
{
	var i
	for(i = 0; i < array_length_1d(global.pets_in_current_level); i ++)
	{
		global.pet_objects[i].sprite_index = global.pets_in_current_level[i]
	}
}

// Player speed and number of steps
global.movespeed_of_player = global.tile_size/8
global.step_amount_of_player = global.tile_size/global.movespeed_of_player


// Movement speed for all the pets stored in an dictionary
global.movespeed_of_pets = ds_map_create()
ds_map_add(global.movespeed_of_pets, doggo, global.tile_size/4)
ds_map_add(global.movespeed_of_pets, bunno, global.tile_size/2)
ds_map_add(global.movespeed_of_pets, catto, global.tile_size/16)
ds_map_add(global.movespeed_of_pets, spr_snake, global.tile_size/2)
ds_map_add(global.movespeed_of_pets, spr_hedgehog, global.tile_size/8)
//ds_map_add(global.movespeed_of_pets, %pet sprite name%, global.tile_size/4)


// Step count per move for all pets stored in a dictionary
global.step_amount_of_pets = ds_map_create()
ds_map_add(global.step_amount_of_pets, doggo, global.tile_size/global.movespeed_of_pets[? doggo])
ds_map_add(global.step_amount_of_pets, bunno, global.tile_size/global.movespeed_of_pets[? bunno])
ds_map_add(global.step_amount_of_pets, catto, global.tile_size/global.movespeed_of_pets[? catto])
ds_map_add(global.step_amount_of_pets, spr_snake, global.tile_size/global.movespeed_of_pets[? spr_snake])
ds_map_add(global.step_amount_of_pets, spr_hedgehog, global.tile_size/global.movespeed_of_pets[? spr_hedgehog])
//ds_map_add(global.step_amount_of_pets, %pet sprite name%, global.tile_size/global.movespeed_of_pets[? %pet sprite name%]))


// Player turn and movement direction counters [up, down, left, right]
global.player_turn_counter = 3
global.player_step_direction_counters = [0, 0, 0, 0]


// Pet movement direction counters [up, down, left, right]
global.pet_step_direction_counter = []
for(i = 0; i < array_length_1d(global.pets_in_current_level); i ++)
{
	global.pet_step_direction_counter[i] = [0, 0, 0, 0]
}


// Number of Pets Caught in the level, used to know when to move to the next level
global.pets_caught = 0
