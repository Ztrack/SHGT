// This function runs on mission start when the medicalDummy_initModule.hpp module is placed.

params ["_logic"];

_isCCP = (_logic getVariable ["SHGT_medicalDummy_isCCP",false]);

// add a spawn delay so settings initialize, etc. Ideally we predefine functions / Call a CBA event to wait for settings to initialize. Too lazy to make this better atm
[_logic,_isCCP] spawn {
	params ["_logic","_isCCP"];
	sleep 5;
	private _spawner = [_logic,SHGT_medicalDummy_spawner_object] call BIS_fnc_synchronizedObjects; // Get synchronized list creator modules
	private _target = [_logic,SHGT_medicalDummy_target_object] call BIS_fnc_synchronizedObjects; // Get synchronized list creator modules

	//[_spawner select 0,_target select 0,_isCCP] call SHGT_medicalDummy_init; // Initialize spawner
	[[_spawner select 0,_target select 0,_isCCP],SHGT_medicalDummy_init] remoteExec ["call", 0, true]; // Call function for JIP

	deleteVehicle _logic; // Clean up logic
};
