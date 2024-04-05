params ["_unit"];


_unit addEventHandler ["Killed", {
	params ["_unit", "_killer", "_instigator", "_useEffects"];
	if !(isPlayer _killer) exitWith {};
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

	// Store msg
	if (isNil "SHGT_civInteraction_repLog") then {SHGT_civInteraction_repLog = []};
	SHGT_civInteraction_repLog pushback _msg;
	publicVariable "SHGT_civInteraction_repLog";

}];