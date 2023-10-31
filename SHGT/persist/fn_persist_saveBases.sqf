
params ["_dBType"];

// Define base list
private _baseList = [];
private _baseList = (allMissionObjects SHGT_persist_hqObjectName) + (allMissionObjects SHGT_persist_fobObjectName) + (allMissionObjects SHGT_persist_pbObjectName);
if (count _baseList == 0) exitWith {};

// Initialize
private _objectClass = [];
private _objectPosition = [];
private _objectVectorDir = [];
private _objectVectorUp = [];
private _objectInventory = [];
private _objectSupply = [];
private _baseNameList = [];

{
	_objectClass pushBack (typeOf _x);
	_objectPosition pushback (getPosWorld _x);
	_objectVectorDir pushback (vectorDir _x); // or vectorDir
	_objectVectorUp pushback (vectorUp _x); // or vectorDir
	_objectInventory pushback [getItemCargo _x, getMagazineCargo _x, getWeaponCargo _x, getBackpackCargo _x]; // could use everyContainer to get all items within backpacks etc
	_objectSupply pushback (_x getVariable ["supplyCount",0]);
	_baseNameList pushback (_x getVariable ["baseName",""]); // get baseName variable

} forEach _baseList;

{
	_name = format ['%1#%2', _dBType, _forEachIndex];
	["write", [_name,"class", _objectClass select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"pos", _objectPosition select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"vectordir", _objectVectorDir select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"vectorup", _objectVectorUp select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"inventory", _objectInventory select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"supply", _objectSupply select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"baseName", _baseNameList select _forEachIndex]] call SHGT_persist_inidbi;
} forEach _objectClass;

// count saved objects
["write", ["count",_dBType, count _objectClass]] call SHGT_persist_inidbi; // Save number of objects