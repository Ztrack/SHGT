
/*
Run this code in init of object for attached objs, relative to a vehicle named 'car1' as an example:
this attachTo [car1]; 

or alternatively for automatic attachment:
this attachTo [(nearestObjects [this, ["Car", "Tank","Plane","Helicopter","Ship"], 30] select 0)]; 
*/

[] spawn {
sleep .01;
private _loadOutModules = allMissionObjects "SHGT_garage_loadoutSaver";
SHGT_garageLoadouts = createHashMap; // Initialize hashmap
SHGT_garageAttachments = createHashMap; // Initialize hashmap

// Get vehicle info and store in hashmap
{
	private _logic = _x;
	private _syncVehicles = [_logic,""] call BIS_fnc_allSynchronizedObjects; // Get synchronized vehicles
	_syncVehicles deleteAt (_syncVehicles find _logic);
	{
		private _veh = _x;
		private _class = typeOf _x;
		private _exportVehicleCode = [_x,""] call BIS_fnc_exportVehicle;
		_pos = _exportVehicleCode find "_this";
		_exportVehicleCode = _exportVehicleCode insert [_pos+5, " select 0"];

		// Get all items in cargo
		private _contents = [];
		_contents pushback [getItemCargo _x, getMagazineCargo _x, getWeaponCargo _x, getBackpackCargo _x]; // could use everyContainer to get all items within backpacks etc

		// Get all attachTo objects and save relative positions to _attachments
		private _attachments = [];
		{
			private _class = typeOf _x;
			private _pos = _veh getRelPos _x;
			private _dir = (getDir _veh) + ((getDir _x)-(getDir _veh));

			_attachments pushBack [_class,_pos,_dir];
		} forEach attachedObjects _veh;
		//systemChat str _attachments;

		// Save vehicle to hashmap
		SHGT_garageLoadouts set [_class,[_contents,_exportVehicleCode,_attachments]];

		// clear vehicle
		{ deleteVehicle _x } forEach attachedObjects _veh;
		deleteVehicle _veh;

	} forEach _syncVehicles;
	deleteVehicle _logic;
} forEach _loadOutModules;
publicVariable "SHGT_garageLoadouts";


// Add class event handlers 
// Initialize code to apply skins to all players since the function is local...

{
	[_x, "init", {
		private _veh = (_this select 0);

		// We need to run this with a delay
		[_veh] spawn {
		uiSleep 3;
		params ["_veh"];

		// Get vehicle info
		private _class = typeOf _veh;
		private _value = SHGT_garageLoadouts getOrDefault [_class, []];
		if (_value isEqualTo []) exitWith {};
		private _contents = _value select 0;
		private _exportVehicleCode = _value select 1;
		if (typeName _exportVehicleCode == "STRING") then {_exportVehicleCode = compile _exportVehicleCode;};
		private _attachments = _value select 2;
		
		// GLOBAL ADD ITEMS TO VEHICLE
		clearItemCargoGlobal _veh;
		clearMagazineCargoGlobal _veh;
		clearWeaponCargoGlobal _veh;
		clearBackpackCargoGlobal _veh;
		private _items = (_contents select 0) select 0;
		if ((count (_items select 0)) >0) then {
			{ _veh addItemCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];} forEach (_items select 0); 
		};
		private _items = (_contents select 0) select 1;
		if ((count (_items select 0)) >0) then {
			{ _veh addMagazineCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];} forEach (_items select 0); 
		};
		private _items = (_contents select 0) select 2;
		if ((count (_items select 0)) >0) then {
			{ _veh addWeaponCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];} forEach (_items select 0); 
		};
		private _items = (_contents select 0) select 3;
		if ((count (_items select 0)) >0) then {
			{ _veh addBackpackCargoGlobal [((_items select 0) select _forEachIndex),((_items select 1) select _forEachIndex)];} forEach (_items select 0); 
		};

		// attach objects (global)
		// Use _attachedObj setPosWorld getPosWorld _attachedObj after setDir to synchronise direction properly over the network (see setDir's page for its MP behaviour).
		{
			private _class = _x select 0;
			private _pos = _x select 1;
			private _dir = _x select 2;
			private _obj = createVehicle [_class,[0,0,0]];
			//_obj setDir _dir; // _child setDir (_parentDir + (_childDir - _parentDir))
			_obj attachTo [_veh,_pos];
			_newDir = (getDir _veh) + (_dir-(getDir _veh));
			_obj setDir _newDir;
		} forEach _attachments;

		// Set loadout locally on every player
		[[_veh],_exportVehicleCode] remoteExec ["call",0,true];

		// EH for deleting objects when vehicle destroyed
		_veh addEventHandler ["Killed", {
			params ["_entity"];
			{ deleteVehicle _x } forEach attachedObjects _entity;
		}];
		// EH for deleting objects when veh deleted
		_veh addEventHandler ["Deleted", {
			params ["_entity"];
			if !(local _entity) exitWith {};
			{ deleteVehicle _x } forEach attachedObjects _entity;
		}];

		}; // Close spawn function
	}, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach SHGT_garageLoadouts;

};