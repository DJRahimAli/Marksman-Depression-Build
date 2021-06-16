/// @desc ScreenShake(magnitude, frames, obj)
/// @arg Magnitude sets the strength of the shake (radius in pixels)
/// @arg Frames sets the length of the shake in frames (60 = 1 second at 60fps)
/// @arg obj is the object to shake

function Shake(_shake_magnitude,_shake_length,_object)
{
	with(_object)
	{
		shake_remain = _shake_magnitude;
		shake_magnitude = _shake_magnitude;
		shake_length = _shake_length;
		if(argument_count > 1) _shake_length = argument[1];
	}
}
