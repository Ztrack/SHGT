params ["_dBType"];

// Define base list
private _baseList = [];
private _radiusToSave = [];
private _baseList = (allMissionObjects SHGT_logistics_hqObjectName) + (allMissionObjects SHGT_logistics_fobObjectName) + (allMissionObjects SHGT_logistics_pbObjectName);
if (count _baseList == 0) exitWith {};

// Get the category 
// if the base type is HQ then we want to save categories x,y,z
// loop through the logiList and check that the category of that object matches the baseType
// if category matches the basetype, then we search for nearbyobjects of that type, and save the object to _objList and _objCategory
// create conditionals for cargo (to save supply), weapon (to spawn last - OPTIONAL do testing first)


// Get all objects associated with bases
private _objectId = []; // Initialize
private _categoriesToSave = [];
{
	private _baseClass = typeOf _x; // get the classname of the FOB or HQ
	private _basePos = (getPosATL _x); // get the base position
	private _baseType = 'none';
	private _thisClassList = [];

	if (_baseClass isEqualTo SHGT_logistics_hqObjectName) then { _radiusToSave = SHGT_logistics_radiusToSaveHq; _baseType = 'HQ';}; // if its a HQ
	if (_baseClass isEqualTo SHGT_logistics_fobObjectName) then { _radiusToSave = SHGT_logistics_radiusToSaveFob; _baseType = 'FOB';}; // if its a FOB
	if (_baseClass isEqualTo SHGT_logistics_pbObjectName) then { _radiusToSave = SHGT_logistics_radiusToSavePb; _baseType = 'PB';}; // if its a PB
	_categoriesToSave = SHGT_logistics_categories getOrDefault [_baseType, "NotFound"]; // Get categories that should be saved here
	{
		//systemChat str (_x select 2);
		_thisObjectCategory = (_x select 2);
		if (_thisObjectCategory isEqualTo "CREATION") then { continue }; // Skip "CREATION" objects.
		if (_thisObjectCategory in _categoriesToSave) then {
			_thisClassList = _basePos nearObjects [(_x select 0), _radiusToSave];
			{
				if (alive _x) then {
				_objectId pushBackUnique _x; // save the object ID if it is unique
				};
			} forEach _thisClassList;
		};

	} forEach SHGT_logistics_list;
} forEach _baseList;

// Get base object details
private _objectClass = [];
private _objectPosition = [];
private _objectVectorDir = [];
private _objectVectorUp = [];
private _objectInventory = [];
private _objectSupply = [];
{
	if ((_x getVariable ["SHGT_persist_ignore",false]) isEqualTo true) then {continue}; // If obj is set to "Dont save, then dont save it.
	_objectClass pushBack (typeOf _x);
	_objectPosition pushback (getPosWorld _x);
	_objectVectorDir pushback (vectorDir _x); // or vectorDir
	_objectVectorUp pushback (vectorUp _x); // or vectorDir
	_objectInventory pushback [getItemCargo _x, getMagazineCargo _x, getWeaponCargo _x, getBackpackCargo _x];
	_objectSupply pushback (_x getVariable ["supplyCount",0]);
} forEach _objectId;

// Get all global objects and save their details
private _objectIdGlobal = [];
_categoriesToSave = SHGT_logistics_categories getOrDefault ["GLOBAL", "GLOBAL"]; // Get categories that should be saved here
{
	_thisCategory = (_x select 2);
	if (_thisCategory isEqualTo "CREATION") then { continue }; // Skip "CREATION" objects.
	if (_thisCategory in _categoriesToSave) then {
		_objectIdGlobal = allMissionObjects (_x select 0);
		{
			if ((_x getVariable ["SHGT_persist_ignore",false]) isEqualTo true) then {continue}; // If obj is set to "Dont save, then dont save it.
			_objectClass pushBack (typeOf _x);
			_objectPosition pushback (getPosWorld _x);
			_objectVectorDir pushback (vectorDir _x); // or vectorDir
			_objectVectorUp pushback (vectorUp _x); // or vectorDir
			_objectInventory pushback [getItemCargo _x, getMagazineCargo _x, getWeaponCargo _x, getBackpackCargo _x]; // could use everyContainer to get all items within backpacks etc
			_objectSupply pushback (_x getVariable ["supplyCount",0]);
		} forEach _objectIdGlobal;
	};
} forEach SHGT_logistics_list;

// Save to objects database
{
	_name = format ['%1#%2', _dBType, _forEachIndex];
	["write", [_name,"class", _objectClass select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"pos", _objectPosition select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"vectordir", _objectVectorDir select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"vectorup", _objectVectorUp select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"inventory", _objectInventory select _forEachIndex]] call SHGT_persist_inidbi;
	["write", [_name,"supply", _objectSupply select _forEachIndex]] call SHGT_persist_inidbi;
} forEach _objectClass;

// count saved objects
["write", ["count",_dBType, count _objectClass]] call SHGT_persist_inidbi; // Save number of objects

//systemChat format ["%1 saved",_dBType];