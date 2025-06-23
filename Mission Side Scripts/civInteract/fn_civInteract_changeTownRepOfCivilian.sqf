// This utility function will set the town rep of the tied civilian by the called amount
// Arg 1: the unit
// Arg 2: The amount of rep to add/remove from the tied town
// Call as [_this,5] call SHGT_fnc_civInteract_changeTownRepofCivilian;

params ["_unit","_repAdd"];

_area = _unit getVariable ["SHGT_area",'not found'];
if (_area isEqualTo 'not found') exitWith {systemChat "ERROR: civ area info not found"};
_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ rep info not found"};

_newAreaReputation = _areaReputation + _repAdd;
SHGT_areaReputation set [_area,_newAreaReputation];
publicVariable "SHGT_areaReputation";






/*
// This utility function will set the town rep of the tied civilian by the called amount ON THE SERVER
// Arg 1: the unit
// Arg 2: The amount of rep to add/remove from the tied town
// Call as [_this,5] call SHGT_fnc_civInteract_changeTownRepofCivilian;

params ["_unit","_repAdd"];

_setRepFunc = {

params ["_unit","_repAdd"];
_area = _unit getVariable ["SHGT_area",'not found'];
if (_area isEqualTo 'not found') exitWith {systemChat "ERROR: civ area info not found"};
_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ rep info not found"};

_newAreaReputation = _areaReputation + _repAdd;
SHGT_areaReputation set [_area,_newAreaReputation];
};


[[_unit,_repAdd],_setRepFunc] remoteExec ["call",2]; // Call on server, JIP not needed