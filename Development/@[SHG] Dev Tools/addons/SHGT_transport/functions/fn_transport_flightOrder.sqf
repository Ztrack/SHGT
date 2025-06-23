// this function will tell the support helo how to fly to its course - Server only
// USE EX: [_helo,_thisPad] call SHGT_fnc_flightorder;
// INPUT 1: Helicopter object
// INPUT 2: Location in getPosATL/getPosASL
// INPUT 3: Priority. If this is true, it will override any active destination

params ["_helo","_loc","_isPriority","_requestor"];

// Check if helo is inflight
_destination = _helo getVariable ["SHGT_transport_destination",[]];
_hasDestination = !(_destination isEqualTo []);
if (_hasDestination and !_isPriority) exitWith {
	//["Pilot: Negative, we're currently on tasking"] remoteExec ["systemChat", _requestor];
	[_requestor, ["SHGT_transport_line2",50]] remoteExec ["say3D",0];
	};

// Get landing location
_padObjects = nearestObjects [_loc, SHGT_transport_helipads,250];
_landingLoc = [];
if (_padObjects isEqualTo []) then {_landingLoc = _loc} else {_landingLoc = getPosATL (_padObjects select 0)};
if (_hasDestination and _isPriority) exitWith {
	_helo setVariable ["SHGT_transport_destination",_landingLoc,true];
	[(driver _helo), ["SHGT_transport_line4",50]] remoteExec ["say3D",0];
	_group = group (driver _helo);
	{deleteWaypoint ((waypoints _group) select 0);} forEach (waypoints _group);
	_helo setfuel 1;
	_wp1 = _group addWaypoint [_landingLoc, 0];  
	_wp1 setWaypointType "MOVE";  
	_wp2 = _group addWaypoint [_landingLoc, 0];  
	_wp2 setWaypointType "SCRIPTED"; 
	_wp2 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
};

// create waypoint
_group = group (driver _helo);
{deleteWaypoint ((waypoints _group) select 0);} forEach (waypoints _group); // reset waypoints
_helo setfuel 1;
_wp1 = _group addWaypoint [_landingLoc, 0];  
_wp1 setWaypointType "MOVE";  
_wp2 = _group addWaypoint [_landingLoc, 0];  
_wp2 setWaypointType "SCRIPTED"; 
_wp2 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
_helo setVariable ["SHGT_transport_destination",_landingLoc,true];
if (isPlayer _requestor) then {[driver _helo, ["SHGT_transport_line1",50]] remoteExec ["say3D",0]} else {[_requestor, ["SHGT_transport_line1",50]] remoteExec ["say3D",0]};

// wait loop 
_lastLoc = getPosATL _helo;
sleep 15;
waitUntil {
	
	sleep 5;

	// get condition for waitUntil
	_cond = ((isTouchingGround _helo) and (((getPosATL _helo) distance _lastLoc) < 10));

	// create autocorrect check
	_destination = _helo getVariable ["SHGT_transport_destination",[]];
	if ((_lastLoc distance _helo) < 2) then {
		{deleteWaypoint ((waypoints _group) select 0);} forEach (waypoints _group);
		_wp1 = _group addWaypoint [_destination, 0];
		_wp1 setWaypointType "MOVE";  
		_wp2 = _group addWaypoint [_destination, 0];  
		_wp2 setWaypointType "SCRIPTED"; 
		_wp2 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
	};
	_lastLoc = getPosATL _helo; // update last location

	// return final true/false
	_cond
};

// Complete transport request
//if (typeOf _pad isEqualTo "Land_HelipadEmpty_F") then {deleteVehicle _pad};
_helo setVariable ["SHGT_transport_destination",[],true];
_helo setfuel 0;