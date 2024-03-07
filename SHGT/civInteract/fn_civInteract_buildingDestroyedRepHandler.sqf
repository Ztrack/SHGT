// Two options to implement a handler that checks destroyed buildings and changes rep
// 1: BuildingChanged handler is low cost, but would mean any ARMA moments will cause rep loss
// 2: Entity killed EH is higher cost but will accurately log events if killed by a player

// Needs to be edited so only civ houses count. Not possible to automate. Need to make a 'whitelist' array so we can do if (_type in _array)

if !isServer exitWith {};

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	
	// Filtering
	if !(_unit isKindOf "house") exitWith {};
	if !(isPlayer _killer) exitWith {};
	
	// Report
	_area = [_unit] call SHGT_fnc_civInteract_getNearestTownArea;
	systemChat format ["%1 destroyed by %2 near %3",typeOf _unit,name _killer,_area];

	// set town rep
	_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
	if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ area info not found"};
	_newAreaReputation = _areaReputation + SHGT_civInteract_TownrepAddedFromDestroyedBuilding;
	SHGT_areaReputation set [_area,_newAreaReputation];
	publicVariable "SHGT_areaReputation";
	
}];


/*
addMissionEventHandler ["BuildingChanged", {
	params ["_from", "_to", "_isRuin"];
	systemChat format ["%1 destroyed",_from];

	_from addEventHandler ["Killed", {
		params ["_unit", "_killer", "_instigator", "_useEffects"];
		systemChat format ["%1 destroyed by %2",_unit,_killer];
	}];


}];