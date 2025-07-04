// This function should run on all civilians when created
// Server execute only

// UPDATE NOTES: split this function into server init and player init to declog JIP queue
if !(isServer) exitWith {};

["CAManBase", "init",{
private _unit = (_this select 0); // Get init object
if !(side _unit isEqualTo Civilian) exitWith {};

[{
params ["_unit"]; 
if !(alive _unit) exitWith {};

// add civ interaction
[[_unit],SHGT_fnc_civInteract_interActGUI] remoteExec ["call",0,true]; // this should not be run server-ride and then remotexec...it clogs JIP queue

// Filter
//if !(_unit isKindOf "man") exitWith {};

// Find what area(s) this civ originates and store it
private _area = [_unit] call SHGT_fnc_civInteract_getNearestTownArea;
_unit setVariable ["SHGT_area",_area,true]; // store what area this unit belongs to. will not change even if civilian moves around

// Get area reputation
private _areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ rep info not found"};

// Initialize civilian reputation
private _civReputation = _areaReputation + (round (random SHGT_civInteract_civrepSpread*2) - SHGT_civInteract_civrepSpread);
if (_civReputation>100) then {_civReputation=100};
if (_civReputation<0) then {_civReputation=0};
_unit setVariable ["SHGT_civReputation",_civReputation,true];

// Add civilian killed EH
//[[_unit],SHGT_fnc_civInteract_reputationLossKilledEventHandler] remoteExec ["call",_unit]; // this should become a entitykilled EH instead
}, [_unit], 20] call CBA_fnc_waitAndExecute;


}, true, [], true] call CBA_fnc_addClassEventHandler;