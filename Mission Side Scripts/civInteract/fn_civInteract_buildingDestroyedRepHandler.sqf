// Two options to implement a handler that checks destroyed buildings and changes rep
// 1: BuildingChanged handler is low cost, but would mean any ARMA moments will cause rep loss
// 2: Entity killed EH is higher cost but will accurately log events if killed by a player

// Needs to be edited so only civ houses count. Not possible to automate. Need to make a 'whitelist' array so we can do if (_type in _array)

if !isServer exitWith {};

addMissionEventHandler ["EntityKilled", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	
	// Filtering
	if !(isPlayer _killer) exitWith {};
	if !((typeOf _unit) in SHGT_civInteract_DefineCivHouses) exitWith {}; // Add filter here isKindOf
	
	// Report
	_area = [_unit] call SHGT_fnc_civInteract_getNearestTownArea;

	// set town rep
	[_unit,SHGT_civInteract_TownrepAddedFromcivKilled] call SHGT_fnc_civInteract_changeNearestTownRep;
	private _areaReputation = SHGT_areaReputation getOrDefault [_area,0];
	private _newAreaReputation = _areaReputation + SHGT_civInteract_TownrepAddedFromDestroyedBuilding;
	SHGT_areaReputation set [_area,_newAreaReputation];
	publicVariable "SHGT_areaReputation";

	// Get server time
	systemTime params ["_year", "_month", "_day", "_hour", "_minute", "_second", "_millisecond"];
	_time = format ["%1 %2 %3, %4:%5",_year,_month,_day,_hour,_minute];
	_msg = format ["%1 Building was destroyed by %2 in %3", _time, name _killer, _area];

	// send msg to diary
	_func = {params ["_msg"]; player createDiaryRecord ['Diary', ["SHGT Reputation Log",_msg]]};
	[[_msg],_func] remoteExec ["call", 0, true];
	diag_log _msg;

	// Store msg
	if (isNil "SHGT_civInteraction_repLog") then {SHGT_civInteraction_repLog = []};
	SHGT_civInteraction_repLog pushback _msg;
	publicVariable "SHGT_civInteraction_repLog";
	//systemChat "Report complete";
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