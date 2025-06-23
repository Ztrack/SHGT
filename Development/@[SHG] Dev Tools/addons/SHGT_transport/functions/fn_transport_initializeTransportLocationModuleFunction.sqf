SHGT_transport_definedLocations = [];

private _initModules = allMissionObjects "SHGT_transport_initializeLocationModule";
if (_initModules isEqualTo []) exitWith {};

{
	private _logic = _x;
	private _name = (_logic getVariable "SHGT_transport_locationName");
	_obj = ([_logic, ""] call BIS_fnc_allSynchronizedObjects) select 0;
	SHGT_transport_definedLocations pushBack _obj;
	_obj setVariable ["baseName",_name,true];
} forEach _initModules;


publicVariable "SHGT_transport_definedLocations";

// cleanup
//{deleteVehicle _x} forEach _initModules;