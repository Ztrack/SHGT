// this function will initialize the helicopter with the sripts to begin transport
// use this to initialize the helo:
// [this,[pad1,pad2,pad3]] call SHGT_fnc_transportInit;
// INPUT 1: Helicopter object with crew inside (just "this" in editor)
// INPUT 2: variable names for helipads or another object that will act as landing points


params ["_helo","_pads"];

// step 1: If no crew exists, add them

if (count (crew _helo) == 0) then {
	createVehicleCrew _helo;
};

// step 2: Ensure helo & crew are safe from damage
_helo allowDamage false;
{_x allowDamage false} forEach (crew _helo);

// Step 3: remove fuel at start
if (isTouchingGround _helo) then { _helo setfuel 0 };

// Step 4: Store configuration of helo and pads
if (isNull SHGT_transport_storage) then {SHGT_transport_storage = []};
SHGT_transport_storage pushBack [_helo,_pads];
publicVariable "SHGT_transport_storage";

// Step 5 (temp solution probably): Add addaction for each pad (must be executed locally)
{
	_thisPad = _x;
_helo addAction [
	format ["<t color='#FFFF00'>Request Transport to %1</t>",_thisPad],    
    { 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_helo = _arguments select 0;
		_thisPad = _arguments select 1;
		_group = group (driver _helo);   
		_waypointPosition = getPosATL _thisPad;
		systemChat "Order received, beginning transport";
		{deleteWaypoint ((waypoints _group) select 0);} forEach (waypoints _group); // reset waypoints
		_helo setfuel 1;
		_wp1 = _group addWaypoint [_waypointPosition, 0];  
		_wp1 setWaypointType "MOVE";  
		_wp2 = _group addWaypoint [_waypointPosition, 0];  
		_wp2 setWaypointType "SCRIPTED"; 
		_wp2 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
		[_helo,_thisPad] spawn {
			params ["_helo","_thisPad"];
			//systemChat "spawn started";
			waitUntil { sleep 1; ((isTouchingGround _helo) and (_helo distance _thisPad) < 25)};
			//systemChat "helo has landed";
			_helo setfuel 0;
		}
	},    
    [_helo,_thisPad],    
    8,    
    false,    
    true,    
    "",    
    ""   
];

_interactObject = nearestObjects [_thisPad, ["Windsock_01_F"], 50];
_interactObject = _interactObject select 0;
_interactObject addAction ["<t color='#FFFF00'>Recall helicopter here</t>",    
    { 
		params ["_target", "_caller", "_actionId", "_arguments"];
		_helo = _arguments select 0;
		_thisPad = _arguments select 1;
		_group = group (driver _helo);   
		_waypointPosition = getPosATL _thisPad;
		
		// disallow recall if helo is in the air
		if !(isTouchingGround _helo) exitWith {systemChat "Negative, we're currently on tasking"};
		systemChat "Order received, Oscar Mike";
		{deleteWaypoint ((waypoints _group) select 0);} forEach (waypoints _group); // reset waypoints
		_helo setfuel 1;
		_wp1 = _group addWaypoint [_waypointPosition, 0];  
		_wp1 setWaypointType "MOVE";  
		_wp2 = _group addWaypoint [_waypointPosition, 0];  
		_wp2 setWaypointType "SCRIPTED"; 
		_wp2 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
		[_helo,_thisPad] spawn {
			params ["_helo","_thisPad"];
			waitUntil { sleep 1; ((isTouchingGround _helo) and (_helo distance _thisPad) < 25)};
			_helo setfuel 0;
		}
	},    
    [_helo,_thisPad],    
    8,    
    false,    
    true,    
    "",    
    ""   
];

} forEach _pads;