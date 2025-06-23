
/* 
https://cbateam.github.io/CBA_A3/docs/files/settings/fnc_addSetting-sqf.html
Parameters
_setting	Unique setting name.  Matches resulting variable name STRING
_settingType	Type of setting.  Can be “CHECKBOX”, “EDITBOX”, “LIST”, “SLIDER”, “COLOR” or “TIME” STRING
_title	Display name or display name + tooltip (optional, default: same as setting name) <STRING, ARRAY>
_category	Category for the settings menu + optional sub-category <STRING, ARRAY>
_valueInfo	Extra properties of the setting depending of _settingType.  See examples below <ANY>
_isGlobal	1: all clients share the same setting, 2: setting can’t be overwritten (optional, default: 0) <BOOL, NUMBER>
_script	Script to execute when setting is changed.  (optional) <CODE>
_needRestart	Setting will be marked as needing mission restart after being changed.  (optional, default false) <BOOL>

[
    "SHGT_modulename_settingName", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Setting Name", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","ModuleName"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
*/

[
    "SHGT_logistics_status", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Module Enabled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_hqObjectName", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["HQ Object Classname",'This object will create a HQ base to build around'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'Flag_Blue_F', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_logistics_fobObjectName", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["FOB Object Classname",'This object will create a FOB base to build around'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "Flag_Green_F", // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_fobCost_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["FOB Build Cost","Cost in supply"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '10', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_fobCost = parseNumber SHGT_logistics_fobCost_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_pbObjectName", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["PB Object Classname","This object will create a Patrol Base base to build around"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "Land_WoodenLog_F", // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_pbCost_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Patrol Base Build Cost","Cost in supply"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '5', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_pbCost = parseNumber SHGT_logistics_pbCost_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_adminObject", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Admin Object",'Use this to save persistence and other things'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'Land_Laptop_03_black_F', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_logistics_list_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Logistics List","This list in array of arrays format holds all information for building system"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '[["Land_Cargo10_military_green_F","20","CARGO"],["Land_HBarrier_1_F","1","FOB"],["Land_HBarrier_3_F","3","FOB"]]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        // Parse logi list and create new variable [objclassname,cost,category]
        _tempList = parseSimpleArray SHGT_logistics_list_setting;
        SHGT_logistics_list = [];
        {
	        _supplyCost = _x select 1;
	        if ((typename _supplyCost) != "SCALAR") then {_supplyCost = parseNumber _supplyCost;}; // convert to number from string if needed
	        SHGT_logistics_list set [_forEachIndex,[_x select 0, _supplyCost, _x select 2]];
        } forEach _tempList;
        SHGT_logistics_list insert [-1,[[SHGT_logistics_adminObject,0,"HQ"]],true];
        SHGT_logistics_list insert [-1,[[SHGT_logistics_supplySource,0,"HQ"]],true];
        SHGT_logistics_list insert [-1,[[SHGT_logistics_hqObjectName,0,"CREATION"]],true];
        SHGT_logistics_list insert [-1,[[SHGT_logistics_fobObjectName,0,"CREATION"]],true];
        SHGT_logistics_list insert [-1,[[SHGT_logistics_pbObjectName,0,"CREATION"]],true];
        {SHGT_logistics_list insert [-1,[[_x,0,"HQ"]],true]; } forEach SHGT_garage_target;
        {SHGT_logistics_list insert [-1,[[_x,0,"HQ"]],true];} forEach SHGT_garage_interactObject;
        //publicVariable "SHGT_logistics_list";
        //publicVariable "SHGT_logistics_cargoCapable";
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_addSpawnToBases_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Bases with respawns","Choose what bases will have spawns: HQ,PB,FOB"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["FOB","HQ"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_addSpawnToBases = parseSimpleArray SHGT_logistics_addSpawnToBases_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_addPlayerSavingToBases_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Player Saving Bases","What bases can players save to: HQ,PB,FOB"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["PB","FOB","HQ"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_addPlayerSavingToBases = parseSimpleArray SHGT_logistics_addPlayerSavingToBases_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_radiusToSaveHq_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["HQ Radius","Objects in this radius will be saved"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '1000', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_radiusToSaveHq = parseNumber SHGT_logistics_radiusToSaveHq_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_radiusToSaveFob_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["FOB Radius","Objects in this radius will be saved"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '300', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_radiusToSaveFob = parseNumber SHGT_logistics_radiusToSaveFob_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_radiusToSavePb_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["PB Radius","Objects in this radius will be saved"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '100', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_radiusToSavePb = parseNumber SHGT_logistics_radiusToSavePb_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_radiusToNextBase_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Base Proximity Radius","Radius to check for how close bases/PB/FOB can be"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '200', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_radiusToNextBase = parseNumber SHGT_logistics_radiusToNextBase_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
/*
[
    "SHGT_logistics_vehicleSideToSave", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Saved Vehicles side", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    ['[1]',"[1] for only BLUFOR, [0] for REDFOR, [2] for GREENFOR, [3] for civ. [1,3] for WEST + CIV, [0,1,2,3] for ALL sides"], // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
*/
[
    "SHGT_logistics_supplySource", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Supply Source Classname","Pull supplies from this object"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "Land_Cargo40_military_green_F", // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_cargoCapable_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Supply Box Classnames","Can be any objects, will hold supply"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["Land_Cargo10_military_green_F","Land_Cargo40_military_green_F"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        SHGT_logistics_cargoCapable = parseSimpleArray SHGT_logistics_cargoCapable_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_supplyMax_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Base Proximity Radius","Max supply a container can hold"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '500', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_supplyMax = parseNumber SHGT_logistics_supplyMax_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_supplySearchRadius_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Supply Search Radius","Radius around a player to search for supply for building"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '300', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_supplySearchRadius = parseNumber SHGT_logistics_supplySearchRadius_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_buildTimeMultiplier_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Build Multiplier","Speeds up building objects"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '8', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_buildTimeMultiplier = parseNumber SHGT_logistics_buildTimeMultiplier_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_adminTag", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Admin Tag","Has special perms"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'HQ', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_boxSaverStatus", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Resupply Box Saver Module Enabled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_boxSaverInterActionObjectClass", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Resupply Box Saver",'Can save resupply boxes to this classname'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'B_supplyCrate_F', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logistics_boxSaverAdminTags_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Box Saver Admin Tags","Special permissions given"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["HQ","leadership"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logistics_boxSaverAdminTags = parseSimpleArray SHGT_logistics_boxSaverAdminTags_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_logisticsBoxEmpty_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spawnable Empty Boxes","Popups in a list"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Logistics"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "['ACE_medicalSupplyCrate','ACE_Box_82mm_Mo_HE','ACE_Box_Ammo']", // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_logisticsBoxEmpty = parseSimpleArray SHGT_logisticsBoxEmpty_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;



