// load meta data
private _saveNameMeta = format ["%1_%2",SHGT_persist_dbName,"meta"];
if ((isnil "OO_INIDBI")) exitWith {systemChat "inidbi2 mod not loaded, local save/load not possible"};
SHGT_persist_inidbi_meta = ["new", _saveNameMeta] call OO_INIDBI;

// Check if meta data exists
_fileExist = "exists" call SHGT_persist_inidbi_meta;
if !(_fileExist) exitWith{["No metaData file found"] remoteExec ["systemChat"];};

// Read meta data
private _saveList = ["read", ["names", "list", []]] call SHGT_persist_inidbi_meta;
reverse _saveList;
if (_saveList isEqualTo []) exitWith{["No metaData file found"] remoteExec ["systemChat"];};

// Get dB name
private _saveName = [];
private _fileExist = false; // returns true if file exists
{
	SHGT_persist_inidbi = ["new", _x] call OO_INIDBI; 
	_fileExist = "exists" call SHGT_persist_inidbi;
	if _fileExist then {_saveName = _x; breakWith "END";}; 
} forEach _saveList;
if (_fileExist isEqualTo false) then {SHGT_persist_inidbi = ["new", SHGT_persist_dbName] call OO_INIDBI; _saveName = SHGT_persist_dbName;}; // backup option

// Send Msg
[format ["LOADING DATABASE %1",_saveName]] remoteExec ["systemChat"];

// Load Garage
_temp = ["read", ["Garage","array", []]] call SHGT_persist_inidbi;
if !(_temp isEqualTo []) then {SHGT_garage_vehicleStorage = _temp; publicVariable "SHGT_garage_vehicleStorage";};

// Load player Data
_temp = ["read", ["playerData","array", []]] call SHGT_persist_inidbi;
if !(_temp isEqualTo []) then {SHGT_logistics_playerData = createHashMapFromArray _temp; publicVariable "SHGT_logistics_playerData";};

// LOAD bases
["base",.5] call SHGT_fnc_persist_loadBases; 

// LOAD Objects DB
["obj",.5] call SHGT_fnc_persist_spawnObjects; 

// LOAD Vehicles DB
["veh",1] call SHGT_fnc_persist_spawnObjects; 

// Load civ interact stats
if (SHGT_civInteraction_status isEqualTo true) then {[] call SHGT_fnc_persist_loadCivInteract; };

["Persistence Loading Complete"] remoteExec ["systemChat"];