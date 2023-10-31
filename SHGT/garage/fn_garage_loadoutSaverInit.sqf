//if !isServer exitWith {};

private _loadOutModules = allMissionObjects "SHGT_garage_loadoutSaver";
SHGT_garageLoadouts = createHashMap;

{
	private _logic = _x;
	private _syncVehicles = [_logic,""] call BIS_fnc_allSynchronizedObjects; // Get synchronized vehicles
	_syncVehicles deleteAt (_syncVehicles find _logic);
	{
		private _class = typeOf _x;
		private _code = [_x,""] call BIS_fnc_exportVehicle;
		_pos = _code find "_this";
		_code = _code insert [_pos+5, " select 0"];

		// Save vehicle to list
		SHGT_garageLoadouts set [_class,_code];

		// clear vehicle
		deleteVehicle _x;

	} forEach _syncVehicles;
	deleteVehicle _x;
} forEach _loadOutModules;
publicVariable "SHGT_garageLoadouts";

// Initialize code to apply skins to all players since the function is local...
[[],{
{
	_class = _x;
	//_code = _y;

	[_class, "init", {
		_veh = (_this select 0);

		[_veh] spawn {
			sleep 3;
			params ["_veh"];
			_class = typeOf _veh;
			_code = SHGT_garageLoadouts getOrDefault [_class, {}];
			//_pos = _code find "_this";
			//_code = _code insert [9, " select 0"];
			//systemChat str _code;
			_compiled = _code;
			if (typeName _compiled == "STRING") then {_compiled = compile _code;};
			[_veh] call _compiled;
		};
	}, true, [], true] call CBA_fnc_addClassEventHandler;

} forEach SHGT_garageLoadouts;

}] remoteExec ["call",0,true];