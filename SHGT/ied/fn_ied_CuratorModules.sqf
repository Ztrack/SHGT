// Zeus module to activate a mine/ied object
// 0Module positionARRAYin ASL format
// 1Attached ObjectOBJECTobjNull if not attached
if !(hasInterface) exitWith {};

// Function to create an IED
_FuncSpawnIED = {
	params ["_pos", "_obj"];
	// systemChat str _pos;
	// systemChat str _obj;

	_safePos = _pos findEmptyPosition [0, 5, "B_soldier_AAA_F"];
	if (_safePos isEqualTo []) then {
		_safePos = _pos
	};

	// create
	if (isNull _obj) then {
		// No object exists, spawn a new one
		_type = selectRandom SHGT_civInteraction_IEDListAmmo;
		createVehicle [_type, _safePos, [], 0];
	} else {
		// Dropped on an object, swap it with the mine version
		systemChat "Converting to IED not supported yet, drop on empty position";
		_ammo = ([getText(configFile >> "CfgVehicles" >> typeOf _obj >> "ammo")] select 0);
		if (_ammo isEqualTo "") then {
			systemChat "No IED Ammo found for this, not compatible";
		} else {
			systemChat "IED Created";
			createVehicle [_type, _safePos, [], 0];
			deleteVehicle _pos;
		};
	};
};
["SHGT", "Create IED", _FuncSpawnIED] call zen_custom_modules_fnc_register;

// Function to spawn VBED

_FuncSpawnVBED = {
	params ["_pos", "_obj"];
	// systemChat str _pos;
	// systemChat str _obj;

	if (isNull _obj) then {
		_info = selectRandom SHGT_ied_vbedVehicles;
		_type = _info select 0;

		_safePos = _pos findEmptyPosition [0, 15, _type];
		if (_safePos isEqualTo []) then {
			_safePos = _pos
		};
		_veh = createVehicle [_type, _safePos, [], 0,"NONE"];
		[_veh] call SHGT_fnc_ied_CreateVBED;
	} else {
	// make this vehicle an IED 
	[_veh] call SHGT_fnc_ied_CreateVBED;
	};
};
["SHGT", "Create VBED", _FuncSpawnVBED] call zen_custom_modules_fnc_register;