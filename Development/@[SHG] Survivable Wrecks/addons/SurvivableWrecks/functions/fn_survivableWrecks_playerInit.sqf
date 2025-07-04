// This function will handle all player side scripting
params ["_unit","_veh","_fire"];

// Checks
//if ((SHGT_SW_ignore_AI_Units) and !(isPlayer _x)) exitWith {};

// Move player out of vehicle
if (SHGT_SW_eject_crew) then {
	_unit action ["eject", _veh];
	if (vehicle _unit != _unit) then {
		moveOut _unit;
	};
	_unit switchMove "";
	_unitVelocity = velocity _unit;
	_unit setVelocity [0,0,0];
	_ranDir = random 360;
	_ranDist = random [5, 10, 20];
	_ranPos = _veh getRelPos [_ranDist, _ranDir];
	_unit setPosATL _ranPos;
};
// set player damage
if (SHGT_SW_immune_damage) then {_unit allowDamage true};
//[_unit,_unit] call ACE_medical_fnc_treatmentAdvanced_fullHealLocal; SC does this, is it needed?
{
	_cause = ["vehiclecrash", "explosive"] select (round random 1);
	[_unit, SHGT_SW_damageMultiplier * random [.5, 1, 1.5], _x, _cause] call ace_medical_fnc_addDamageToUnit;
} forEach ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];

// Wake up player
[_unit] spawn {
	params ["_unit"];
    sleep 5;
    if (SHGT_SW_unconscious) then {[_unit, false] call ace_medical_fnc_setUnconscious};
};

// delete fires clientside
[_fire] spawn {
	sleep 30;
	params ["_fire"];
    deleteVehicle _fire;
};