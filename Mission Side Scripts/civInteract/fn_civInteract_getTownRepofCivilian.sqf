// This utility function will get the town rep of the tied civilian from the server and return
// Arg 1: the unit
// Call as _reputation = [_this] call SHGT_fnc_civInteract_getTownRepofCivilian;



params ["_unit"];

_area = _unit getVariable ["SHGT_area",'not found'];
if (_area isEqualTo 'not found') exitWith {systemChat "ERROR: civ area info not found"};
_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ rep info not found"};
_areaReputation