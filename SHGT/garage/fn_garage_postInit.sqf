if !(isServer) exitWith {};
if !(SHGT_garage_status isEqualTo true) exitWith {}; 

_tempList = [];
if ((typename SHGT_garage_vehicleStorage) isEqualTo "STRING" ) then {_tempList = parseSimpleArray SHGT_garage_vehicleStorage} else {_tempList = SHGT_garage_vehicleStorage;};

SHGT_garage_vehicleStorage = [];
{
	
	_tag = _x select 0;
	_class = _x select 1;
	_numLeft = _x select 2;
	if ((typename _numLeft) != "SCALAR") then {_numLeft = parseNumber _numLeft;}; // convert to number from string if needed

	SHGT_garage_vehicleStorage pushBack [_tag,_class,_numleft];
} forEach _tempList;







// Broadcast public variables
publicVariable "SHGT_garage_status";
publicVariable "SHGT_garage_vehicleStorage";
publicVariable "SHGT_garage_object";
publicVariable "SHGT_garage_target";
publicVariable "SHGT_garage_tags";
// add actions
[[],SHGT_fnc_garage_addActions] remoteExec ["call",0,true]; // add actions to all garage objects