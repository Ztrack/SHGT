private _dBType = _this select 0; // "objects","vehicles",etc
private _spacing = _this select 1; // Distance to check for center of objects of the same class. Should be higher for vehicles
private _numObj = ["read", ["count", _dBType, 0]] call SHGT_persist_inidbi;

private _objList = [];
for "_i" from 0 to _numObj-1 do {
	// Step 1: Check if object already exists. If it does, don't spawn it
	// Step 2: createVehicle at 0,0,0
	// Step 3: setPosWorld at desired location 
	// Step 4: setDir
	private _name = format ['%1#%2', _dBType, _i];
	private _objType = ["read", [_name, "class", []]] call SHGT_persist_inidbi;
	private _pos = ["read", [_name, "pos", []]] call SHGT_persist_inidbi;
	private _Vectordir = ["read", [_name, "vectordir", []]] call SHGT_persist_inidbi;
	private _VectorUp = ["read", [_name, "vectorup", []]] call SHGT_persist_inidbi;
	private _baseName = ["read", [_name, "baseName", []]] call SHGT_persist_inidbi;
	// Detect if object of this type currently exists at this location & direction
	private _objectDet = _pos nearObjects [_objType,10];
	if (count _objectDet >0) then {
	{
		private _cond1 = (((getPosATL _x ) distance _pos) < _spacing);
		if (_cond1) then {
			deleteVehicle _x;
		};
	} forEach _objectDet;
	} else {};

	// Create Object
	private _obj = [];
	_obj = _objType createVehicle [0,0,0];
	_obj setVectorDirAndUp [_Vectordir, _VectorUp];
	private _safePos = _pos;
	_obj setPosWorld _safePos;
	_objList pushBack _obj;

	// Clear cargo
	clearItemCargoGlobal _obj;
	clearMagazineCargoGlobal _obj;
	clearWeaponCargoGlobal _obj;
	clearBackpackCargoGlobal _obj;

	// Create marker
	_pos = getPosATL _obj;
	private _baseMarker = createMarker [_baseName, _pos];  
	_baseMarker setMarkerType "hd_flag"; 
	_baseMarker setMarkerText _baseName;
	_obj setVariable ["baseName",_baseName,true];

	// Create respawn
	_baseRespawn = [];
	if !(_objType isEqualTo SHGT_persist_pbObjectName) then {
		_baseRespawn = [missionNamespace, _pos,_baseName] call BIS_fnc_addRespawnPosition;
	};
	_obj setVariable ["baseRespawn",_baseRespawn,true];

	// Set player saving/loading at PB
	if (_objType isEqualTo SHGT_persist_pbObjectName) then {
			[[_obj],SHGT_fnc_logistics_baseSavePlayer] remoteExec ["call",0,true];
	};
};


{
	_x addEventHandler ["Deleted", {
		params ["_entity"];
		_baseMarker = _entity getVariable ["baseName",[]];
		if !(_baseMarker isEqualTo []) then {
		deleteMarker _baseMarker;};
		_baseRespawn = _entity getVariable ["baseRespawn",[]];
		if !(_baseRespawn isEqualTo []) then {
		_baseRespawn call BIS_fnc_removeRespawnPosition;};
	}];
} forEach _objList;



















