/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 690A88B6
/// @DnDArgument : "value" "4"
/// @DnDArgument : "var" "levellock"
global.levellock = 4;

/// @DnDAction : YoYo Games.Common.Set_Global
/// @DnDVersion : 1
/// @DnDHash : 1EFA8862
/// @DnDArgument : "var" "onoffvolume"
global.onoffvolume = 0;

/// @DnDAction : YoYo Games.Audio.Audio_Set_Volume
/// @DnDVersion : 1
/// @DnDHash : 4979DEB1
/// @DnDArgument : "sound" "tic"
/// @DnDArgument : "volume" "0"
/// @DnDSaveInfo : "sound" "3c3870ad-2a0b-431d-b7eb-fccc9578bd07"
audio_sound_gain(tic, 0, 0);

/// @DnDAction : YoYo Games.Rooms.Go_To_Room
/// @DnDVersion : 1
/// @DnDHash : 4A561DA5
/// @DnDArgument : "room" "rm_title"
/// @DnDSaveInfo : "room" "7479bad9-05ae-4292-b699-a2f2e19a7a8f"
room_goto(rm_title);