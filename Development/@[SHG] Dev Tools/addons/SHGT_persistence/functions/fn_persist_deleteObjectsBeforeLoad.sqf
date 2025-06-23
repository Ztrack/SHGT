
private _baseList = [];
private _radiusToSave = [];
private _baseList = (allMissionObjects SHGT_logistics_hqObjectName) + (allMissionObjects SHGT_logistics_fobObjectName);
if (count _baseList == 0) exitWith {};
private _objectId = []; // Initialize
private _objCategory = []; // Initialize
private _categoriesToSave = [];

// Delete Objects
{
	private _baseClass = typeOf _x; // get the classname of the FOB or HQ
	private _basePos = (getPosATL _x); // get the base position
	private _baseType = 'none';
	if (_baseClass isEqualTo SHGT_logistics_hqObjectName) then { _radiusToSave = SHGT_logistics_radiusToSaveHq; _baseType = 'HQ';}; // if its a HQ
	if (_baseClass isEqualTo SHGT_logistics_fobObjectName) then { _radiusToSave = SHGT_logistics_radiusToSaveFob; _baseType = 'FOB';}; // if its a FOB
	_categoriesToSave = SHGT_logistics_categories getOrDefault [_baseType, "NotFound"]; // Get categories that should be saved here
	{
		//systemChat str (_x select 2);
		_thisObjectCategory = (_x select 2);
		if (_thisObjectCategory in _categoriesToSave) then {
			private _thisClasslist = _basePos nearObjects [_x select 0, _radiusToSave];
			{
				_objectId pushBackUnique _x; // save the object ID if it is unique
				_objCategory pushBackUnique _x;
			} forEach _thisClasslist;
		};

	} forEach SHGT_logistics_list;
} forEach _baseList;





// Delete vehicles

private _vehList = [];
private _inheritList = ["car","Air","Ship","Tank"];
{
	_list = allMissionObjects _x;
	{
		if ((getNumber (configFile >> "CfgVehicles" >> typeOf _x >> "side")) in SHGT_persist_vehicleSideToSave) then {
		_vehList pushBackUnique _x;
		};
	} forEach _list;
} forEach _inheritList;