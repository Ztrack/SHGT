// Call as _area = [_unit] call SHGT_fnc_civInteract_getNearestTownArea;

// Accepts position or object as parameters
params ["_unit"];

// Find what area(s) this civ is inside
_areas = [];
_area = [];
{
	if (_unit inArea _x) then {_areas pushback _x};
} forEach SHGT_civInteract_TOAR;

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
	_areas = [[SHGT_civInteract_TOAR, _unit] call BIS_fnc_nearestPosition]; // civ is not in an area, get an area for them
};
_area = _areas select 0; // convert from array

_area