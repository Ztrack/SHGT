
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
	_part = round (random 5);
	if (_part isEqualTo 0) then {_part = "Head"};
	if (_part isEqualTo 1) then {_part = "Body"};
	if (_part isEqualTo 2) then {_part = "LeftArm"};
	if (_part isEqualTo 3) then {_part = "RightArm"};
	if (_part isEqualTo 4) then {_part = "LeftLeg"};
	if (_part isEqualTo 5) then {_part = "RightLeg"};
	_part
};

SHGT_applyWoundsEasy = {
	params ["_target"];
	_unit = _target getVariable ["SHGT_patient",[]];
	//systemChat str _unit;
	_part = [] call SHGT_selectRndBodyPart;
	_int = round ( random 6 + 4 );
	[_unit, 6, _part, "bullet"] call ace_medical_fnc_addDamageToUnit;

	_int = round ( random 6 + 4 );
	_part = [] call SHGT_selectRndBodyPart;
	[_unit, 6, _part, "bullet"] call ace_medical_fnc_addDamageToUnit;

};

SHGT_applyWoundsMedium = {
	params ["_target"];
	_unit = _target getVariable ["SHGT_patient",[]];
	//systemChat str _unit;

	for "_i" from 0 to 4 do {
	_part = [] call SHGT_selectRndBodyPart;
	_int = round ( random 4 + 4 );
	[_unit, 6, _part, "bullet"] call ace_medical_fnc_addDamageToUnit;
	};

};

SHGT_applyWoundsHard = {
	params ["_target"];
	_unit = _target getVariable ["SHGT_patient",[]];
	//systemChat str _unit;

	for "_i" from 0 to 7 do {
	_part = [] call SHGT_selectRndBodyPart;
	_int = round ( random 6 + 4 );
	[_unit, 6, _part, "bullet"] call ace_medical_fnc_addDamageToUnit;
	};

};

SHGT_applyWoundsImpossible = {
	params ["_target"];
	_unit = _target getVariable ["SHGT_patient",[]];
	//systemChat str _unit;

	for "_i" from 0 to 12 do {
	_part = [] call SHGT_selectRndBodyPart;
	_int = round ( random 6 + 4 );
	[_unit, 6, _part, "bullet"] call ace_medical_fnc_addDamageToUnit;
	};

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