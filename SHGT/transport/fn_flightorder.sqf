// this function will tell the support helo how to fly to its course
// USE EX: [_helo,_thisPad] call SHGT_fnc_flightorder;

params ["_helo","_origPad"];
if !(local _helo) exitWith {};
_group = group (driver _helo);
_waypointPosition = getPosATL _origPad;
{deleteWaypoint ((waypoints _group) select 0);} forEach (waypoints _group); // reset waypoints
_helo setfuel 1;
_wp1 = _group addWaypoint [_waypointPosition, 0];  
_wp1 setWaypointType "MOVE";  
_wp2 = _group addWaypoint [_waypointPosition, 0];  
_wp2 setWaypointType "SCRIPTED"; 
_wp2 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
_helo setVariable ["SHGT_transport_destination",_origPad,true];
waitUntil { sleep 5; _thisPad = _helo getVariable ["SHGT_transport_destination",_origPad]; ((isTouchingGround _helo) and (_helo distance _thisPad) < 25)};
_helo setfuel 0;