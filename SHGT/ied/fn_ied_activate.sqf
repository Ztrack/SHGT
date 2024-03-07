// This function runs locally on each client and blows up the IED if a player gets too close while not crouched
if !(hasInterface) exitWith {}; 

IEDactivationScript = {
	//if !isServer exitWith {}; // redundant but for testing
	params ["_ied"];
	[_ied] spawn {
		params ["_ied"];
		[_ied, ["SHGT_nokia1",50]] remoteExec ["say3D",0];
		_explodelay = random [1, 3, 8]; // random # [min, mid, max], gaussian distribution centered on mid
		sleep _explodelay;
		//detach _ied;
		if !(_ied isKindOf "MineBase") then {
			//systemChat "not a normal ied";
			_dummy = createMine ["IEDLandSmall_F", _ied, [], 0];
			deleteVehicle _ied;
			//_dummy setPosATL (getPosATL _ied);
			_dummy setDamage 1;
		} else {
			_ied setDamage 1;
		};
	};
};

IEDdefusalInteraction = {
	params ["_ied"];
	_action = ["DefuseIED","Defuse","a3\ui_f\data\igui\cfg\actions\repair_ca.paa",{[player, _target] call ACE_Explosives_fnc_StartDefuse; [_target] spawn {params ["_target"]; sleep 8; deleteVehicle _target};},{"ACE_DefusalKit" in (items _player)},{},[],[0,0,0],2,[false, true, false, false, false],{}] call ace_interact_menu_fnc_createAction;
	[_ied, 0, ["ACE_MainActions"], _action] call ace_interact_menu_fnc_addActionToObject;
	_ied setVariable ["SHGT_IEDDefusal",true];
};

// Add inits for radio activation of IEDs
["MyID", "OnTangent", {
//hint format ["%1 %2 speaking", _this select 0, if(_this select 1)then{"is"}else{"isn't"}];
	_ied = nearestObjects [player, SHGT_ied_iedAmmo,10];
	if !(_ied isEqualTo [])  then {
		_ied = _ied select 0; // get the first IED
		if (!(_ied getVariable ["boom",false]) and (random 100 <= SHGT_ied_radioActivationChance)) then {
			_ied setVariable ["boom",true];
			//[[_ied],IEDactivationScript] remoteExec ["call",2,false];
			[_ied] call IEDactivationScript;
		};
	};
}, Player] call TFAR_fnc_addEventHandler;

// Handler for regular IEDs
_handle = [{
	//systemChat "CBA Handler Initialized";
	_ied = nearestObjects [player, SHGT_ied_iedListAmmo,10];
	if !(_ied isEqualTo []) then {
		_ied = _ied select 0; // get the first IED
		_dist = _ied getVariable ["iedDistance",true]; // Check if IED has a programmed random distance
		if (_dist isEqualTo true) then {_dist = random [3, 6, 10]; _ied setVariable ["iedDistance",_rand,true]}; // Generate random distance

		// Checks
		if ((player distance _ied) >= _dist) exitWith {};
		if (_ied getVariable ["SHGT_IEDDefusal",[]] isEqualTo []) then {[_ied] call IEDdefusalInteraction;}; // Temporary solution. Better used in the spawner
		if (speed player < 8) exitWith {};
		if (stance player isEqualTo "PRONE") exitWith {};
		if (_ied getVariable ["boom",false]) exitWith {};
		_ied setVariable ["boom",true];
		//[[_ied],IEDactivationScript] remoteExec ["call",2,false];
		[_ied] call IEDactivationScript;
	};
}, 0.25, []] call CBA_fnc_addPerFrameHandler;


// Handler for static VBED IEDs
_handle2 = [{
	//systemChat "CBA Handler Initialized";
	_ied = nearestObjects [player, SHGT_ied_vbedIedAmmo,8];
	if !(_ied isEqualTo []) then {
		_ied = _ied select 0; // get the first IED
		_dist = 8;

		// Checks
		//if ((_ied getVariable ["SHGT_VBED_READY",0]) isEqualTo 0) exitWith {};
		if !(alive _ied) exitWith {};
		if ((player distance _ied) >= _dist) exitWith {};
		if (speed player < 8) exitWith {};
		if (stance player isEqualTo "PRONE") exitWith {};
		if (_ied getVariable ["boom",false]) exitWith {};

		// Blow
		_ied setVariable ["boom",true,true];
		//[[_ied],IEDactivationScript] remoteExec ["call",2,false];
		[_ied] call IEDactivationScript;
	};
}, 0.25, []] call CBA_fnc_addPerFrameHandler;

// Add new PFH for non-standard IED detection

/*
IEDdefusalInteraction = {
	//[_ied] call IEDdefusalInteraction;
	params ["_ied"];
	_defusalInteraction = [
	_ied,
	"Defuse",
	"a3\ui_f\data\igui\cfg\actions\repair_ca.paa", "a3\ui_f\data\igui\cfg\actions\repair_ca.paa",
	"_this distance _target < 2", "true",
	{},
	{},
	{deleteVehicle _target},
	{[_target] call IEDactivationScript;},
	[_ied], 5, nil, true, false
	] call BIS_fnc_holdActionAdd;
	_ied setVariable ["SHGT_IEDDefusal",_defusalInteraction];
};