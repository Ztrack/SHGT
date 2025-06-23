
// Check mod is loaded
if ((isnil "OO_INIDBI")) exitWith {systemChat "inidbi2 mod not loaded, local save/load not possible"};

// Object persistence dB
["Persistence save starting..."] remoteExec ["systemChat"];

// Create dB handle
_timeStamp = format ["%1_%2_%3_%4_%5_%6",systemTime#0,systemTime#1,systemTime#2,systemTime#3,systemTime#4,systemTime#5];
_saveName = format ["%1_%2_%3",SHGT_persist_dBNamePrefix,SHGT_persist_dBNamePostfix,_timeStamp];
SHGT_persist_inidbi = ["new", _saveName] call OO_INIDBI;

// Delete old db
//"delete" call SHGT_persist_inidbi; // Delete the old save

// Save Garage
["Saving Garage..."] remoteExec ["systemChat"];
["write", ["Garage","array", SHGT_garage_vehicleStorage]] call SHGT_persist_inidbi;

// Save player data
["Saving Player Data..."] remoteExec ["systemChat"];
_playerArray = [];
{
	_playerArray pushBack [_x,_y];
} forEach SHGT_logistics_playerData;
["write", ["playerData","array", _playerArray]] call SHGT_persist_inidbi;

// Save bases
["Saving Logi builds..."] remoteExec ["systemChat"];
["base"] call SHGT_fnc_persist_saveBases;

// Save objects associated with HQs that are set to persist
["obj"] call SHGT_fnc_persist_saveObjects;

// Save vehicles on the map to list
["Saving Vehicles..."] remoteExec ["systemChat"];
["veh"] call SHGT_fnc_persist_saveVehicles;

// Save civ interaction/reputation system data
["Saving Reputation..."] remoteExec ["systemChat"];
if (SHGT_civInteraction_status isEqualTo true) then {[] call SHGT_fnc_persist_saveCivInteract; };

// Save metadata
_saveNameMeta = format ["%1_%2",SHGT_persist_dbName,"meta"];
SHGT_persist_inidbi_meta = ["new", _saveNameMeta] call OO_INIDBI;
_saveList = ["read", ["names", "list", []]] call SHGT_persist_inidbi_meta;
_saveList pushback _saveName;
if (count _saveList > 10) then {_saveList deleteAt 0}; // Store x saves in meta file
["write", ["names","list", _saveList]] call SHGT_persist_inidbi_meta;

// Print complete
["Persistent save complete"] remoteExec ["systemChat"];