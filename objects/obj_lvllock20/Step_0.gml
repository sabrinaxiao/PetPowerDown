/// @DnDAction : YoYo Games.Common.If_Variable
/// @DnDVersion : 1
/// @DnDHash : 3FE40B2D
/// @DnDArgument : "var" "global.levellock"
/// @DnDArgument : "op" "2"
/// @DnDArgument : "value" "20"
if(global.levellock > 20)
{
	/// @DnDAction : YoYo Games.Instances.Destroy_Instance
	/// @DnDVersion : 1
	/// @DnDHash : 661BE05E
	/// @DnDParent : 3FE40B2D
	instance_destroy();
}