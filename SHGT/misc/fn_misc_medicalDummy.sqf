
SHGT_spawnDummy = {
	params ["_target","_position","_caller"];
	_unit = group _caller createUnit ["B_RangeMaster_F", _position, [], 0, "FORM"];
	_target setVariable ["SHGT_patient",_unit,true];
	_unit setVariable ["acex_headless_blacklist", true];
	removeAllWeapons _unit;
	removeGoggles _unit;
	removeHeadgear _unit;
	removeVest _unit;
	//removeUniform _unit;
	removeAllAssignedItems _unit;
	clearAllItemsFromBackpack _unit;
	removeBackpack _unit;
	_unit disableAI "path";
	_unit disableAI "move";
	_unit disableAI "ANIM";
	_unit disableAI "AUTOTARGET";
	_unit switchMove "AmovPpneMstpSrasWrflDnon";
	_unit setDir (getDir _target);
	_unit attachTo [_target,[.5,0,0.5]];
	_unit setUnconscious true;
	_unit setVariable ["ace_medical_damageThreshold",1000,true]; 
	//_unit attachTo [_target,[0,0,0.5]];
};

SHGT_selectRndBodyPart = {
	selectRandom ["Head", "Body", "LeftArm", "RightArm", "LeftLeg", "RightLeg"]
};

// Apply a set amount of wounds to a given unit over a given number of iterations.
//
// PARAMETERS:
// _target (object) The unit to add damage to.
// _iterations (integer): How many passes should be taken at the unit?
// _minDamage (float, 0-1): What is the minumum severity of the damage to be added?
// _maxDamage (float, 0-1): What is the maximum severity of the damage to be added?
// _damageType (string): The type of damage to apply (bullet, explosive) 
//
// RETURNS: nil
SHGT_applyWounds = {
	params ["_target", "_iterations","_minDamage", "_maxDamage", "_damageType"];

	// For each iteration...
	for "_i" from 0 to _iterations do {

		// Select a random body part
		
		// Select a random body part, compute the damage, and add it to the unit
		// ace damage adding only works for [0,1)
		_part = [] call SHGT_selectRndBodyPart;
		_damage = random (_maxDamage - _minDamage) + _minDamage;
		[_target, _damage, _part, _damageType] call ace_medical_fnc_addDamageToUnit;
	};
};

SHGT_applyWoundsEasy = {
	params ["_target"];
	[_target, 2, 0.1, 0.5, "bullet"] call SHGT_applyWounds;
};

SHGT_applyWoundsMedium = {
	params ["_target"];
	[_target, 4, 0.3, 0.7, "bullet"] call SHGT_applyWounds;
};

SHGT_applyWoundsHard = {
	params ["_target"];	
	[_target, 7, 0.3, 0.9, "bullet"] call SHGT_applyWounds;
};

SHGT_applyWoundsImpossible = {
	params ["_target"];
	[_target, 12, 0.6, 1.0, "bullet"] call SHGT_applyWounds;
};





["Land_Stretcher_01_F", "init", {
	(_this select 0) addAction ["Spawn easy patient", {

		// Setup dummy code to remote Exec
		_dummyCode = {
			if !(isServer) exitWith {};
			params ["_target","_caller"];
			_position = getPosATL _target;
			_existingUnit = _target getVariable ["SHGT_patient",[]];

			// If no unit is currently spawwned for this stretcher
			if (_existingUnit isEqualTo []) then {
				[_target,_position,_caller] call SHGT_spawnDummy;
				sleep 1;
				[_target] call SHGT_applyWoundsEasy;
				systemChat "Dummy spawned";
			} else {
				// If a unit exists on this stretcher
				systemChat "A dummy is already on this stretcher";
			};
		};

		// Run code
		params ["_target", "_caller", "_actionId", "_arguments"];
		[[_target,_caller],_dummyCode] remoteExec ["spawn",0]; // call dummy code on server

	},[],6,false,true,"","true",10];

	(_this select 0) addAction ["Spawn Medium patient", {

		// Setup dummy code to remote Exec
		_dummyCode = {
			if !(isServer) exitWith {};
			params ["_target","_caller"];
			_position = getPosATL _target;
			_existingUnit = _target getVariable ["SHGT_patient",[]];

			// If no unit is currently spawwned for this stretcher
			if (_existingUnit isEqualTo []) then {
				[_target,_position,_caller] call SHGT_spawnDummy;
				sleep 1;
				[_target] call SHGT_applyWoundsMedium;
				systemChat "Dummy spawned";
			} else {
				// If a unit exists on this stretcher
				systemChat "A dummy is already on this stretcher";
			};
		};

		// Run code
		params ["_target", "_caller", "_actionId", "_arguments"];
		[[_target,_caller],_dummyCode] remoteExec ["spawn",0]; // call dummy code on server

	},[],6,false,true,"","true",10];

	(_this select 0) addAction ["Spawn Hard patient", {

		// Setup dummy code to remote Exec
		_dummyCode = {
			if !(isServer) exitWith {};
			params ["_target","_caller"];
			_position = getPosATL _target;
			_existingUnit = _target getVariable ["SHGT_patient",[]];

			// If no unit is currently spawwned for this stretcher
			if (_existingUnit isEqualTo []) then {
				[_target,_position,_caller] call SHGT_spawnDummy;
				sleep 1;
				[_target] call SHGT_applyWoundsHard;
				systemChat "Dummy spawned";
			} else {
				// If a unit exists on this stretcher
				systemChat "A dummy is already on this stretcher";
			};
		};

		// Run code
		params ["_target", "_caller", "_actionId", "_arguments"];
		[[_target,_caller],_dummyCode] remoteExec ["spawn",0]; // call dummy code on server

	},[],6,false,true,"","true",10];

	(_this select 0) addAction ["Spawn Impossible patient", {

		// Setup dummy code to remote Exec
		_dummyCode = {
			if !(isServer) exitWith {};
			params ["_target","_caller"];
			_position = getPosATL _target;
			_existingUnit = _target getVariable ["SHGT_patient",[]];

			// If no unit is currently spawwned for this stretcher
			if (_existingUnit isEqualTo []) then {
				[_target,_position,_caller] call SHGT_spawnDummy;
				sleep 1;
				[_target] call SHGT_applyWoundsImpossible;
				systemChat "Dummy spawned";
			} else {
				// If a unit exists on this stretcher
				systemChat "A dummy is already on this stretcher";
			};
		};

		// Run code
		params ["_target", "_caller", "_actionId", "_arguments"];
		[[_target,_caller],_dummyCode] remoteExec ["spawn",0]; // call dummy code on server

	},[],6,false,true,"","true",10];

	(_this select 0) addAction ["Clear Patient", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_existingUnit = _target getVariable ["SHGT_patient",[]];
		deleteVehicle _existingUnit;
		_target setVariable ["SHGT_patient",[],true];
		systemChat "Dummy cleared";
	},[],6,false,true,"","true",10];


}, true, [], true] call CBA_fnc_addClassEventHandler;