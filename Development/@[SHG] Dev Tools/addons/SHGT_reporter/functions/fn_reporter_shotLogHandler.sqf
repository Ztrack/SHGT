SHGT_reporter_status = true;
SHGT_zeus_log_UID_WhiteList = ["76561198025627975","76561197992886996","76561198044261733","76561198930843976"];

player addEventHandler ["HandleDamage", {
	params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit", "_context"];
	
	// Check if this has been reported
	//systemChat str _projectile;
	if !(SHGT_reporter_status) exitWith {};
	if (_unit getVariable ["SHGT_zeus_recentlyFiredOn",false]) exitWith {};

	// Check is source is a zeus controlling AI
	_zeusman = (_source getVariable ["BIS_fnc_moduleRemoteControl_owner", objNull]);
	if !(isPlayer _zeusman) exitWith {};

	// Send report to the players
	_msg = format ["Player %1 Shot by Zeus %2 by [%3] Direct Damage using %4 ", name _unit, name _zeusman,str _directHit, str _projectile];
	private _func = {
		params ["_msg"];
		if !(hasInterface) exitWith {};
		if !(((getPlayerUID player) in ([SHGT_zeus_log_UID_WhiteList,"_SP_PLAYER_"] call BIS_fnc_arrayPush))) exitWith {};
		player createDiaryRecord ['Diary', ["SHGT Zeus log",_msg]];
	
	}; 
	[[_msg],_func] remoteExec ["call", 0, true]; // send diary log to players
	_unit setVariable ["SHGT_zeus_recentlyFiredOn",true]; // Make it so more EHs arent triggering this

	// Reset recently fired on flag
	[_unit] spawn {
		params ["_unit"];
		sleep 5;
		_unit setVariable ["SHGT_zeus_recentlyFiredOn",false];
	};	   
	
}];
