if !(isServer) exitWith {};

// Define categories for lists
SHGT_logistics_categories = createHashMap;
SHGT_logistics_categories set ['HQ',['HQ','FOB','PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['FOB',['FOB','PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['PB',['PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['GLOBAL',['GLOBAL','CREATION']];

// Parse logi list and create new variable [objclassname,cost,category]
_tempList = parseSimpleArray SHGT_logistics_list; // parse list from module or from above default
SHGT_logistics_list = [];
SHGT_logistics_cargoCapable = [];
{
	_supplyCost = _x select 1;
	if ((typename _supplyCost) != "SCALAR") then {_supplyCost = parseNumber _supplyCost;}; // convert to number from string if needed
	SHGT_logistics_list set [_forEachIndex,[_x select 0, _supplyCost, _x select 2]];

	if ((_x select 2) isEqualTo "CARGO") then {SHGT_logistics_cargoCapable pushBackUnique (_x select 0)};
} forEach _tempList;
SHGT_logistics_cargoCapable pushBackUnique SHGT_logistics_supplySource; // add supply source to considerations

// Apply special objects to the list
SHGT_logistics_list insert [-1,[[SHGT_persist_saveObject,0,"HQ"]],true];
SHGT_logistics_list insert [-1,[[SHGT_logistics_supplySource,0,"HQ"]],true];
SHGT_logistics_list insert [-1,[[SHGT_persist_hqObjectName,0,"CREATION"]],true];
SHGT_logistics_list insert [-1,[[SHGT_persist_fobObjectName,SHGT_persist_fobCost,"CREATION"]],true];
SHGT_logistics_list insert [-1,[[SHGT_persist_pbObjectName,SHGT_persist_pbCost,"CREATION"]],true];
{SHGT_logistics_list insert [-1,[[_x,0,"HQ"]],true]; } forEach SHGT_garage_target;
{SHGT_logistics_list insert [-1,[[_x,0,"HQ"]],true];} forEach SHGT_garage_object;
//SHGT_logistics_list insert [-1,[[SHGT_persist_pbObjectName,SHGT_persist_pbCost,"CREATION"]],true]; // implemented in guiUserSelectObject

// add keybind for menu
[[],SHGT_fnc_logistics_addKeybinds] remoteExec ["call",0,true];

// add class inits for CARGO
[[],SHGT_fnc_logistics_addActions] remoteExec ["call",0,true];

// Initialize player saving/loading
SHGT_logistics_playerData = createHashMap;
[[],SHGT_fnc_logistics_baseLoadPlayer] remoteExec ["call",0,true];

// Initialize box saving 
SHGT_logisticsBoxDatabase = profileNamespace getVariable ["SHGT_logisticsBoxDatabase", createHashMap];
if (typeName SHGT_logisticsBoxDatabase != "HASHMAP") exitWith { SHGT_logisticsBoxDatabase = createHashMap};
publicVariable "SHGT_logisticsBoxDatabase";


// Set done flag
SHGT_logisticsPostInitCheck = true;


// public variables
publicVariable "SHGT_logistics_list";
publicVariable "SHGT_logistics_list";
publicVariable "SHGT_logisticsPostInitCheck";
publicVariable "SHGT_logistics_cargoCapable";
publicVariable "SHGT_logistics_supplySource";
publicVariable "SHGT_logistics_supplyMax";
publicVariable "SHGT_logistics_supplySearchRadius";
publicVariable "SHGT_logistics_categories";
publicVariable "SHGT_logistics_buildTimeMultiplier";
publicVariable "SHGT_logistics_playerData";
publicVariable "SHGT_persist_radiusToNextBase";
publicVariable "SHGT_persist_addSpawnToBases";
publicVariable "SHGT_persist_addPlayerSavingToBases";
publicVariable "SHGT_transport_cargoSize";
publicVariable "SHGT_logistics_boxSaverStatus";
publicVariable "SHGT_logistics_boxSaverInterActionObjectClass";
publicVariable "SHGT_logistics_boxSaverAdminTags";
publicVariable "SHGT_logisticsBoxEmpty";