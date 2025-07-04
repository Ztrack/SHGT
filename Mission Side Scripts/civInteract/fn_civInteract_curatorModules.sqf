if !(hasInterface) exitWith {};
// add zeus module to get town rep

_getRepFunc = {
params ["_pos", "_obj"]; // IED obj wont be visible in zeus so _obj will be null
_area = [_pos] call SHGT_fnc_civInteract_getNearestTownArea;
_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: area rep info not found"};
systemChat format ["%1 Town Rep is: %2",_area,_areaReputation];

};
["SHGT", "Town: Get Nearest Town Rep", _getRepFunc] call zen_custom_modules_fnc_register;

// add zeus module to add town rep

_addRepFunc = {
params ["_pos", "_obj"]; // IED obj wont be visible in zeus so _obj will be null
_area = [_pos] call SHGT_fnc_civInteract_getNearestTownArea;
_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ rep info not found"};
_newAreaReputation = _areaReputation + 1;
SHGT_areaReputation set [_area,_newAreaReputation];
publicVariable "SHGT_areaReputation";
systemChat format ["%1 Town Rep is now: %2",_area,_newAreaReputation];

};
["SHGT", "Town: Add 1 Rep", _addRepFunc] call zen_custom_modules_fnc_register;

// sub zeus module to add town rep

_subRepFunc = {
params ["_pos", "_obj"]; // IED obj wont be visible in zeus so _obj will be null
_area = [_pos] call SHGT_fnc_civInteract_getNearestTownArea;
_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ rep info not found"};
_newAreaReputation = _areaReputation - 1;
SHGT_areaReputation set [_area,_newAreaReputation];
publicVariable "SHGT_areaReputation";
systemChat format ["%1 Town Rep is now: %2",_area,_newAreaReputation];

};
["SHGT", "Town: Subtract 1 Rep", _subRepFunc] call zen_custom_modules_fnc_register;