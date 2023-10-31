
// Object persistence dB
["Persistence save starting..."] remoteExec ["systemChat"];

// Create dB handle
_timeStamp = format ["%1_%2_%3_%4_%5_%6",systemTime#0,systemTime#1,systemTime#2,systemTime#3,systemTime#4,systemTime#5];
_saveName = format ["%1_%2_%3",SHGT_persist_dBNamePrefix,SHGT_persist_dBNamePostfix,_timeStamp];
SHGT_persist_inidbi = ["new", _saveName] call OO_INIDBI;

// Delete old db
//"delete" call SHGT_persist_inidbi; // Delete the old save

// Save Garage
["write", ["Garage","array", SHGT_garage_vehicleStorage]] call SHGT_persist_inidbi; // Garage

// Save player data
_playerArray = [];
{
	_playerArray pushBack [_x,_y];
} forEach SHGT_logistics_playerData;
["write", ["playerData","array", _playerArray]] call SHGT_persist_inidbi; // Garage

// Save bases
["base"] call SHGT_fnc_persist_saveBases;

// Save objects associated with HQs that are set to persist
["obj"] call SHGT_fnc_persist_saveObjects;

// Save vehicles on the map to list
["veh",SHGT_persist_vehicleToSave] call SHGT_fnc_persist_saveVehicles;

// Save metadata
_saveNameMeta = format ["%1_%2",SHGT_persist_dbName,"meta"];
SHGT_persist_inidbi_meta = ["new", _saveNameMeta] call OO_INIDBI;
_saveList = ["read", ["names", "list", []]] call SHGT_persist_inidbi_meta;
_saveList pushback _saveName;
["write", ["names","list", _saveList]] call SHGT_persist_inidbi_meta;

// Print complete
["Persistent save complete"] remoteExec ["systemChat"];