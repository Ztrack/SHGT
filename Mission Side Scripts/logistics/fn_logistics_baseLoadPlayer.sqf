
// Runs on player after respawn

//allPlayers select (allPlayers findIf { getPlayerUID _x == _uid })
// _unitPlayedByUID550055 = "550055" call BIS_fnc_getUnitByUID;

//_baseRespawn = [player,_pos,_baseName] call BIS_fnc_addRespawnPosition;
if !(hasInterface) exitWith {};

player addEventHandler ["Respawn",
{ 
	params ["_unit", "_corpse"];
		_playerUID = getPlayerUID player;
	private _playerData = SHGT_logistics_playerData getOrDefault [_playerUID, []]; // [_playerUID, [_playerPos,_playerLoadout]
	if (_playerData isEqualTo []) exitWith {};
	_playerPos = _playerData select 0;
	_playerLoadout = _playerData select 1;
	_unit = player;

	// Detect PB
	_list = [_playerPos select 0,_playerPos select 1,_playerPos select 2] nearObjects [SHGT_persist_pbObjectName, 50];
	if (_list isEqualTo []) exitWith {systemChat "Your last PB is no longer there"};
	
	[_unit,_playerPos,_playerLoadout] spawn {
		params ["_unit","_playerPos","_playerLoadout"];
		sleep 3;
		removeAllWeapons player;
		removeGoggles player;
		removeHeadgear player;
		removeVest player;
		removeUniform player;
		removeAllAssignedItems player;
		clearAllItemsFromBackpack player;
		removeBackpack player;
		
		_unit setUnitLoadout _playerLoadout;
		_unit setPosATL _playerPos;

	};
	SHGT_logistics_playerData deleteAt _playerUID;
	publicVariable "SHGT_logistics_playerData";
}];

/*
player addEventHandler ["Respawn", {
	params ["_unit", "_corpse"];
	systemChat "Dong";

	_playerUID = getPlayerUID player;
	private _playerData = SHGT_logistics_playerData getOrDefault [_playerUID, []]; // [_playerUID, [_playerPos,_playerLoadout]
	if (_playerData isEqualTo []) exitWith {};
	_playerPos = _playerData select 0;
	_playerLoadout = _playerData select 1;

	_baseRespawn = [player,_playerPos,_baseName] call BIS_fnc_addRespawnPosition;
	player setPosATL _playerPos;
	player setUnitLoadout _playerLoadout;

	// Delete Save
	//SHGT_logistics_playerData deleteAt _playerUID;
}];