// This utility function will set the nearest town rep by the called amount
// Arg 1: position or object
// Arg 2: The amount of rep to add/remove from the tied town
// Call as [_this,5] call SHGT_fnc_civInteract_changeNearestTownRep;

params ["_unit","_repAdd"];
private _area = [_unit] call SHGT_fnc_civInteract_getNearestTownArea;

private _areaReputation = SHGT_areaReputation getOrDefault [_area,0];
private _newAreaReputation = _areaReputation + _repAdd;
SHGT_areaReputation set [_area,_newAreaReputation];
publicVariable "SHGT_areaReputation";