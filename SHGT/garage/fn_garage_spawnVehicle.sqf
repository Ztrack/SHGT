params ["_dataIn","_index"];

// Read in data
_tag = _dataIn select 0;
_classname = _dataIn select 1;
_numLeftBefore = _dataIn select 2; // # of vehicles left before the action was selected
_numLeftAfter = _numLeftBefore-1;

// Check if less than
if (_numLeftBefore <= 0) exitWith{systemChat "None Left"};

// Find nearest Garage
_garageObject = nearestObjects [player, SHGT_garage_object,50];
_garageObject = (_target select 0);

// find nearest target that has space
_neartargets = nearestObjects [player, SHGT_garage_target,50];
if (_neartargets isEqualTo []) exitWith {systemChat "No spawn targets nearby"};

_safePos = [];
_target = [];
{
	_target = _x;
	_pos = getPosATL _target;
	//systemChat str ((typeOf _target isEqualTo Land_HelipadEmpty_F));
	if (((typeOf _target) isEqualTo "Land_HelipadEmpty_F") or (_target getVariable ["SHGT_spawndirectly",false] isEqualTo true)) then {
		// This is an empty helipad, spawn directly on it
		//if ((nearestObjects [_pos, ["Man","Car","Ship","Air"], 5]) isEqualTo []) then {_safePos = _pos} else {_safePos = []};
		_safePos = _pos;
		breakWith "END";
		} else {
		// Not an empty helipad, check the surroundings first
		_safePos = _pos findEmptyPosition [0,0,_classname];
	};

	if !(_safePos isEqualTo []) then { breakWith "END"; };
} forEach _neartargets;
if (_safePos isEqualTo []) exitWith {systemChat "Not enough space on the target to spawn"};

// Spawn vehicle
_obj = objNull; // Init
if (((typeOf _target) isEqualTo "Land_HelipadEmpty_F") or (_target getVariable ["SHGT_spawndirectly",false] isEqualTo true)) then {
	_obj = createVehicle [_classname,_safePos,[],0,"CAN_COLLIDE"];
} else {
	_obj = createVehicle [_classname,_safePos,[],0,"NONE"];
};

// Set indestructible for a few seconds
_obj allowDamage false;
//[_obj] spawn {sleep 5; params ["_obj"]; _obj allowDamage true;};
[{params ["_obj"]; _obj allowDamage true}, [_obj], 10] call CBA_fnc_waitAndExecute;


// Determine if its a drone, if so we want to spawn crew
_isDrone = _classname isKindOf "UAV";
if (_isDrone) then {
	createVehicleCrew _obj; 
};

// Clear cargo
clearItemCargoGlobal _obj;
clearMagazineCargoGlobal _obj;
clearWeaponCargoGlobal _obj;
clearBackpackCargoGlobal _obj;

// Save changes to garage variable
SHGT_garage_vehicleStorage set [_index,[_tag,_classname, _numLeftAfter]];
publicVariable "SHGT_garage_vehicleStorage";
