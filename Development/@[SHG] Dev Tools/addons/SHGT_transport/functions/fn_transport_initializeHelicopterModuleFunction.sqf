// This function initializes the helicopter & crew for transport duty

//[] spawn {
//sleep 1; // sleep lets it wait until vehicles are initialized
private _initModules = allMissionObjects "SHGT_transport_initializeHelicopterModule";
if (_initModules isEqualTo []) exitWith {};
private _syncHelis = [];
{
	_syncHelis append ([_x, ""] call BIS_fnc_allSynchronizedObjects);
} forEach _initModules;
{
	if !(_x isKindOf "Air") then {_syncHelis deleteAt _forEachIndex};
} forEach _syncHelis;

// Run for each transport heli
{
	[_x] call SHGT_fnc_transport_initializeHelicopter;
} forEach _syncHelis;

//};
// cleanup
{deleteVehicle _x} forEach _initModules;