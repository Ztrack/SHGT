// This function allows players to quickly drop their backpack on the ground. Use case will be to drop the backpack before an assault or when trying to run away at fastest speed possible without having stamina be an issue.

// Create drop backpack BIS_fnc_function
SHGT_fnc_misc_quickDropBackpackFunc = {
	systemChat "Dropped Backpack";
	//if ((backpack player) isEqualTo "") exitWith {};
	_pos = (getPosATL player);
	_groundObject = "GroundWeaponHolder" createVehicle _pos;
	player action ["DropBag", _groundObject, typeOf unitBackpack player];
	_groundObject setPosATL [_pos select 0, _pos select 1, -.5];

};

// Add keybind
#include "\a3\editor_f\Data\Scripts\dikCodes.h"
["SHGT","misc_quickDropBackpack", "Quick Drop Backpack", {[] call SHGT_fnc_misc_quickDropBackpackFunc}, "", [35, [true, true, false]]] call CBA_fnc_addKeybind;