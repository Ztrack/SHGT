
if !(isServer) exitWith {};

["MFR_Dog_Base", "init", {
	_unit = (_this select 0);
	// Handler
	_handle = [{
		params ["_unit"];
		_unit = _unit select 0;
		_list = nearestObjects [_unit, SHGT_ied_iedListAmmo, 30];
		if !(_list isEqualTo []) then {
			// An IED exists
			[_unit, ["dog_barking",50]] remoteExec ["say3D",0];
		};

	}, 1, [_unit]] call CBA_fnc_addPerFrameHandler;
}, true, [], true] call CBA_fnc_addClassEventHandler;