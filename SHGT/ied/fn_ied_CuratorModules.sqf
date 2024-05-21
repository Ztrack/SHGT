// Zeus module to activate a mine/ied object
// 0Module positionARRAYin ASL format
// 1Attached ObjectOBJECTobjNull if not attached
if !(hasInterface) exitWith {};

// Function to create a road IED
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
		_type = selectRandom SHGT_civInteraction_RoadIEDListAmmo;
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
["SHGT", "Create Random Road IED", _FuncSpawnIED] call zen_custom_modules_fnc_register;

// Function to create a road IED
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
		_type = selectRandom SHGT_civInteraction_BuildingIEDListAmmo;
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
["SHGT", "Create Random object IED", _FuncSpawnIED] call zen_custom_modules_fnc_register;

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
["SHGT", "Create Random VBED", _FuncSpawnVBED] call zen_custom_modules_fnc_register;


// add zeus module to delete nearest ied within 20m

_deleteIEDFunc = {
params ["_pos", "_obj"]; // IED obj wont be visible in zeus so _obj will be null
private _ied = (nearestObjects [[_pos select 0,_pos select 1, 0], SHGT_ied_iedListAmmo,10]) select 0;
if (_ied isEqualTo []) exitWith {systemChat "no ied found"};
deleteVehicle _ied;
systemChat "Deleted";
};
["SHGT", "Delete Nearest IED", _deleteIEDFunc] call zen_custom_modules_fnc_register;


_setOffIEDWithNokiaFunc = {
params ["_pos", "_obj"]; // IED obj wont be visible in zeus so _obj will be null
private _ied = (nearestObjects [[_pos select 0,_pos select 1, 0], SHGT_ied_iedListAmmo,10]) select 0;
if (_ied isEqualTo []) exitWith {systemChat "no ied found"};
_ied setVariable ["boom",true];
[_ied] call SHGT_ied_activateWithNokia;

};
["SHGT", "Set Off Nearest IED with nokia", _setOffIEDWithNokiaFunc] call zen_custom_modules_fnc_register;

_setOffIEDFunc = {
params ["_pos", "_obj"]; // IED obj wont be visible in zeus so _obj will be null
private _ied = (nearestObjects [[_pos select 0,_pos select 1, 0], SHGT_ied_iedListAmmo,10]) select 0;
if (_ied isEqualTo []) exitWith {systemChat "no ied found"};
_ied setVariable ["boom",true];
_ied setDamage 1;
};
["SHGT", "Set Off Nearest IED now", _setOffIEDFunc] call zen_custom_modules_fnc_register;

_createSBomber = {
params ["_pos", "_obj"]; // IED obj wont be visible in zeus so _obj will be null
if (isNull _obj) then {private _grp = createGroup east; _obj = _grp createUnit ["UK3CB_TKC_O_CIV", [_pos select 0, _pos select 1,0], [], 10, "NONE"];};
[[_obj],SHGT_fnc_ied_SBomber] remoteExec ["spawn",_obj];
//[_obj,_pos] spawn SHGT_fnc_ied_SBomber;
};
["SHGT", "Create S Bomber", _createSBomber] call zen_custom_modules_fnc_register;
/*
_ied = nearestObjects [player, SHGT_ied_iedListAmmo,8];
	if !(_ied isEqualTo [])  then {
		_ied = _ied select 0; // get the first IED
		if (!(_ied getVariable ["boom",false]) and (random 100 <= SHGT_ied_radioActivationChance)) then {
			_ied setVariable ["boom",true];
			//[[_ied],IEDactivationScript] remoteExec ["call",2,false];
			[_ied] call IEDactivationScript;
		};
	};