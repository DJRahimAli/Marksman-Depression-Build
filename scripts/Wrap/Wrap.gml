/// @desc Wrap(value, min, max)
/// @arg value
/// @arg min
/// @arg max

// Returns the value wrapped, values over or under will be wrapped around

function Wrap(value, min, max)
{
	var _mod = (argument0 - argument1) mod (argument2 - argument1);
	if (_mod < 0) return _mod + argument2 else return _mod + argument1;
}
