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

	_msg = format ["Civilian was killed by %1 in %2", name _killer, _area];
	//diag_log _msg;
	[_msg] remoteExec ["systemChat", 0];
}];