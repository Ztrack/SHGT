
private _dBType = _this select 0; // "objects","vehicles",etc
private _spacing = _this select 1; // Distance to check for center of objects of the same class. Should be higher for vehicles
private _numObj = ["read", ["count", _dBType, 0]] call SHGT_persist_inidbi;

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
	private _contents = ["read", [_name, "inventory", []]] call SHGT_persist_inidbi;
	private _supplyCount = ["read", [_name, "supply", []]] call SHGT_persist_inidbi;
	
	// Detect if object of this type currently exists at this location & direction
	private _objectDet = _pos nearObjects [_objType,10];
	if (count _objectDet >0) then {
	{
		
		private _cond1 = (((getPosWorld _x ) distance _pos) < _spacing);
		//_cond1 = (getPosWorld _x ) isEqualTo _pos;
		//_cond2 = (vectorDir _x) isEqualTo _Vectordir;
		//_cond3 = (vectorUp _x) isEqualTo _VectorUp;

		if (_cond1) then {
			deleteVehicle _x;
		};

	} forEach _objectDet;
	} else {};

	// Create Object
	_obj = createVehicle [_objType,[0,0,0]];
	_obj setVectorDirAndUp [_Vectordir, _VectorUp];
	_obj setPosWorld _pos;

	//_obj setDir 0; [_obj, 0, 0] call BIS_fnc_setPitchBank;
	//if (_obj isKindOf "Tank") then {_safePos = _pos findEmptyPosition [0,10,_objType];};
	//if (_obj isKindOf "Car") then {_safePos = _pos findEmptyPosition [0,10,_objType];};
	//if (_obj isKindOf "Air") then {_safePos = _pos findEmptyPosition [0,10,_objType];};
	//_obj setPosWorld _pos;
	//_obj setVectorDirAndUp [[0,1,0], [0,0,1]];

	// Clear cargo
	clearItemCargoGlobal _obj;
	clearMagazineCargoGlobal _obj;
	clearWeaponCargoGlobal _obj;
	clearBackpackCargoGlobal _obj;

	// Add cargo
	private _items = (_contents select 0);
	if ((count (_items select 0)) >0) then {
	{ 
		_obj addItemCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];
	} forEach (_items select 0); };

	private _items = (_contents select 1);
	if ((count (_items select 0)) >0) then {
	{ _obj addMagazineCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];
	} forEach (_items select 0); };

	private _items = (_contents select 2);
	if ((count (_items select 0)) >0) then {
	{ _obj addWeaponCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];
	} forEach (_items select 0); };

	private _items = (_contents select 3);
	if ((count (_items select 0)) >0) then {
	{ _obj addBackpackCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];
	} forEach (_items select 0); };

	if (_objType in SHGT_logistics_cargoCapable) then {_obj setVariable ["supplyCount",_supplyCount,true]};
	if (_obj isKindOf "house") then {_obj allowDamage false}; // remove damage from house sim objects

	if (_dBType isEqualTo "veh") then {
		private _objectFuel = ["read", [_name, "fuel", []]] call SHGT_persist_inidbi;
		private _objectFuelCargo = ["read", [_name, "fuelCargo", []]] call SHGT_persist_inidbi;
		private _objectDamage = ["read", [_name, "damage", []]] call SHGT_persist_inidbi;
		private _objectTurrets = ["read", [_name, "turrets", []]] call SHGT_persist_inidbi;
		private _objectAmmo = ["read", [_name, "ammo", []]] call SHGT_persist_inidbi;
		private _objectPylons = ["read", [_name, "pylons", []]] call SHGT_persist_inidbi;

		_obj setFuel _objectFuel;
		[_obj, _objectFuelCargo] call ace_refuel_fnc_setFuel;
		{_obj setHitPointDamage [_x,(_objectDamage select 2) select _forEachIndex]} forEach (_objectDamage select 0);
		//addMagazineTurret
		//[this, %1] call ace_rearm_fnc_setSupplyCount
		//setPylonLoadout
		//setAmmoOnPylon
		
		// Determine if its a drone, if so we want to spawn crew
		_isDrone = _objType isKindOf "UAV";
		if (_isDrone) then {
			createVehicleCrew _obj; 
		};
	};

	//sleep 0.1; // small sleep for stability
};