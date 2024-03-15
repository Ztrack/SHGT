// This function should run on all civilians when created
// Server execute only

["Civilian", "init",{
_unit = (_this select 0); // Get init object

// Filter
//if !(_unit isKindOf "man") exitWith {};

// Find what area(s) this civ originates and store it
_area = [_unit] call SHGT_fnc_civInteract_getNearestTownArea;
_unit setVariable ["SHGT_area",_area,true]; // store what area this unit belongs to. will not change even if civilian moves around

// Get area reputation
_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ rep info not found"};

// Initialize civilian reputation
_civReputation = _areaReputation + (round (random SHGT_civInteract_civrepSpread*2) - SHGT_civInteract_civrepSpread);
if (_civReputation>100) then {_civReputation=100};
if (_civReputation<0) then {_civReputation=0};
_unit setVariable ["SHGT_civReputation",_civReputation,true];

// Add civilian killed EH
[_unit] call SHGT_fnc_civInteract_reputationLossKilledEventHandler;

}, true, [], true] call CBA_fnc_addClassEventHandler;

