

if !(isServer) exitWith {};

addMissionEventHandler ["EntityKilled", {
	// init
	params ["_unit", "_killer", "_instigator", "_useEffects"];

	// filters
	if !(_unit iskindOf "man") exitWith {};
	if !(side _unit isEqualTo Civilian) exitWith {}; // checks in-game faction of unit
	if !(side (group _unit) isEqualTo Civilian) exitWith {}; // checks in-game faction of group
	//if !(getNumber(configfile >> "CfgVehicles" >> typeOf _unit >> "side") isEqualTo 3) exitWith {}; // checks config value
	if !(isPlayer _killer) exitWith {};

	// Get & set rep
	private _area = _unit getVariable ["SHGT_area",'not found'];
	if (_area isEqualTo 'not found') exitWith {_area = [_unit] call SHGT_fnc_civInteract_getNearestTownArea};
	private _areaReputation = SHGT_areaReputation getOrDefault [_area,0];
	SHGT_areaReputation set [_area, _areaReputation+SHGT_civInteract_TownrepAddedFromcivKilled];
	publicVariable "SHGT_areaReputation";
	//systemChat "rep set";

	// Remove Interaction
	private _id = _unit getVariable ["_SHGT_civInteractionID",'not found']; 
	if !(_id isEqualTo 'not found') then {_unit removeAction _id;};

	// Get server time
	systemTime params ["_year", "_month", "_day", "_hour", "_minute", "_second", "_millisecond"];
	private _time = format ["%1 %2 %3, %4:%5",_year,_month,_day,_hour,_minute];

	// Create Message
	private _isVeh = false;
	private _msg = '';
	if (vehicle player != player) then {
		// If player is in a vehicle, it was a roadkill
		_msg = format ["%1 Civilian roadkilled by %2 in %3", _time, name _killer, _area];
	} else {
		// It was not a roadkill
		_msg = format ["%1 Civilian shot by %2 in %3", _time, name _killer, _area];
	};

	// send msg to diary
	private _func = {params ["_msg"]; player createDiaryRecord ['Diary', ["SHGT Reputation Log",_msg]]};
	[[_msg],_func] remoteExec ["call", 0, true]; // send diary log to players
	diag_log _msg; // send diag log to server log
	//systemChat "diary set";

	// Store msg
	if (isNil "SHGT_civInteraction_repLog") then {SHGT_civInteraction_repLog = []};
	SHGT_civInteraction_repLog pushback _msg;
	publicVariable "SHGT_civInteraction_repLog";
	//systemChat "report complete";
}];

/*

params ["_unit"];


_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if !(isPlayer _killer) exitWith {};
	if !(side _unit isEqualTo civilian) exitWith {};
	_area = _unit getVariable ["SHGT_area",'not found'];
	if (_area isEqualTo 'not found') exitWith {systemChat "ERROR: civ area info not found"};
	_areaReputation = SHGT_areaReputation getOrDefault [_area,'not found'];
	if (_areaReputation isEqualTo 'not found') exitWith {systemChat "ERROR: civ area info not found"};
	SHGT_areaReputation set [_area, _areaReputation+SHGT_civInteract_TownrepAddedFromcivKilled];
	publicVariable "SHGT_areaReputation"; // this probably wont work in MP? Needs to run ONLY on server

	// Get server time
	systemTime params ["_year", "_month", "_day", "_hour", "_minute", "_second", "_millisecond"];
	_time = format ["%1 %2 %3, %4:%5",_year,_month,_day,_hour,_minute];
	_msg = format ["%1 Civilian was killed by %2 in %3", _time, name _killer, _area];

	// send msg to diary
	_func = {params ["_msg"]; player createDiaryRecord ['Diary', ["SHGT Reputation Log",_msg]]};
	[[_msg],_func] remoteExec ["call", 0, true];
	diag_log _msg;

	// Store msg
	if (isNil "SHGT_civInteraction_repLog") then {SHGT_civInteraction_repLog = []};
	SHGT_civInteraction_repLog pushback _msg;
	publicVariable "SHGT_civInteraction_repLog";

}];