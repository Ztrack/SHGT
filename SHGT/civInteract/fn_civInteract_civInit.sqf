// This function should run on all civilians when created
// Server execute only

["Civilian", "init",{
_unit = (_this select 0); // Get init object

// Find what area(s) this civ is inside
_areas = [];
_area = [];
{
	if (_unit inArea _x) then {_areas pushback _x};
} forEach SHGT_TOAR;

// Conditionals: what happens if civ is in no area or more than one area
if (count _areas > 1) then {
	// Find the closest area
	_dist = [];
	{
	_dist pushBack (_unit distance getMarkerPos _x);
	} forEach _areas;
	_min = selectMin _dist;
	_idx = _dist findIf { _x == _min };
	_areas = [_areas select _idx];
};
if (count _areas == 0) then {
	_areas = [[SHGT_TOAR, _unit] call BIS_fnc_nearestPosition]; // civ is not in an area, get an area for them
};
_area = _areas select 0; // convert from array
_unit setVariable ["SHGT_area",_area,true]; // store what area this unit belongs to. will not change even if civilian moves around

// Get area reputation
_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ area info not found"};

// Set civilian reputation
_civReputation = _areaReputation + (round (random SHGT_civrepSpread*2) - SHGT_civrepSpread);
if (_civReputation>100) then {_civReputation=100};
if (_civReputation<0) then {_civReputation=0};
_unit setVariable ["SHGT_civReputation",_civReputation,true];

// Add civilian killed EH
[_unit] call SHGT_fnc_civInteract_reputationLossKilledEventHandler;

}, true, [], true] call CBA_fnc_addClassEventHandler;