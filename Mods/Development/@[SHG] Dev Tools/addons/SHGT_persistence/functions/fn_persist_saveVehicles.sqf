params ["_dBType"];

// SAVE VEHICLES
//(getNumber (configFile >> "CfgVehicles" >> _type >> "side"))
//if ((getNumber (configFile >> "CfgVehicles" >> _type >> "side")) != 1) exitWith {}; // only get "WEST" vehicles

//BUILD List to save
private _vehList = [];
private _inheritList = ["car","Air","Ship","Tank"]; // "car","Air","Ship","Tank"
{
	_list = allMissionObjects _x;
	{
		if ((getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "side")) in SHGT_persist_vehicleSideToSave) then {
		_vehList pushBackUnique _x;
		};
	} forEach _list;
} forEach _inheritList;



private _objectClass = [];
private _objectPosition = [];
private _objectVectorDir = [];
private _objectVectorUp = [];
private _objectInventory = [];
private _objectFuel = [];
private _objectFuelCargo = [];
private _objectDamage = [];
private _objectTurrets = [];
private _objectAmmo = [];
private _objectPylons = [];

{
	if ((_x getVariable ["SHGT_persist_ignore",false]) isEqualTo true) then {continue}; // If obj is set to "Dont save, then dont save it.
	_objectClass pushBack (typeOf _x);
	_objectPosition pushback (getPosWorld _x);
	_objectVectorDir pushback (vectorDir _x); // or vectorDir
	_objectVectorUp pushback (vectorUp _x); // or vectorDir
	_objectInventory pushback [getItemCargo _x, getMagazineCargo _x, getWeaponCargo _x, getBackpackCargo _x]; // could use everyContainer to get all items within backpacks etc
	_objectFuel pushback (fuel _x);
	_objectFuelCargo pushback (_x call ace_refuel_fnc_getFuel);
	_objectDamage pushback (getAllHitPointsDamage _x);
	_objectTurrets pushback (magazinesAllTurrets _x);
	_objectAmmo pushback (_x call ace_rearm_fnc_getSupplyCount);
	_objectPylons pushback (getAllPylonsInfo _x);
} forEach _vehList;


// save to vehicles database
{
	_name = format ['%1#%2', _dBType, _forEachIndex];
	["write", [_name,"class", _objectClass select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"pos", _objectPosition select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"vectordir", _objectVectorDir select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"vectorup", _objectVectorUp select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"inventory", _objectInventory select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"fuel", _objectFuel select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"fuelCargo", _objectFuelCargo select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"damage", _objectDamage select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"turrets", _objectTurrets select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"ammo", _objectAmmo select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"pylons", _objectPylons select _forEachIndex]] call SHGT_persist_inidbi;
} forEach _objectClass;
_count = count _objectClass;
["write", ["count",_dBType, count _objectClass]] call SHGT_persist_inidbi; // Save number of veh


//systemChat format ["%1 saved",_dBType];