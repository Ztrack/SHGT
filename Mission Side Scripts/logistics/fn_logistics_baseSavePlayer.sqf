
_veh = _this select 0;

(_veh) addAction ["Persistent logout", {
	params ["_target", "_caller", "_actionId", "_arguments"];
	_playerPos = getPosATL player;
	_playerLoadout = getUnitLoadout player;
	_playerUID = getPlayerUID player;
	_baseName = _target getVariable ["baseName","Last Location"];

	SHGT_logistics_playerData set [_playerUID, [_playerPos,_playerLoadout,_baseName]];
	publicVariable "SHGT_logistics_playerData";
	systemChat "Saved your character. Hope you enjoyed milsim!";
	endMission "END2";
},[],6,false,true,"","true",10];