// This function runs locally on each client and blows up the IED if a player gets too close while not crouched
if !(hasInterface) exitWith {}; 

IEDactivationScript = {
	//if !isServer exitWith {}; // redundant but for testing
	params ["_ied"];
	[_ied] spawn {
		params ["_ied"];
		[_ied,"SHGT_nokia1"] remoteExec ["say3D",0,false];
		//_ied say3D "SHGT_nokia1";
		_explodelay = random [1, 3, 8]; // random # [min, mid, max], gaussian distribution centered on mid
		sleep _explodelay;
		//detach _ied;
		_ied setDamage 1;
	};
};


// Add inits for radio activation of IEDs
["MyID", "OnTangent", {
//hint format ["%1 %2 speaking", _this select 0, if(_this select 1)then{"is"}else{"isn't"}];
	_ied = nearestObjects [player, SHGT_ied_iedAmmo,15];
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

		// dist timeMultiplier
		//if ((speed player) < 8) then {_dist = _dist/2};

		// Checks 
		if ((player distance _ied) >= _dist) exitWith {};
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
		if ((_ied getVariable ["SHGT_VBED_READY",0]) isEqualTo 0) exitWith {};
		if ((player distance _ied) >= _dist) exitWith {};
		if (speed player < 8) exitWith {};
		if (stance player isEqualTo "PRONE") exitWith {};
		if (_ied getVariable ["boom",false]) exitWith {};

		// Blow
		_ied setVariable ["boom",true];
		//[[_ied],IEDactivationScript] remoteExec ["call",2,false];
		[_ied] call IEDactivationScript;
	};
}, 0.25, []] call CBA_fnc_addPerFrameHandler;