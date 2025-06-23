
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

// CHECKBOX --- extra argument: default value
["Test_Setting_1", "CHECKBOX", ["-test checkbox-", "-tooltip-"], "My Category", true] call CBA_fnc_addSetting;

// LIST --- extra arguments: [_values, _valueTitles, _defaultIndex]
["Test_Setting_2", "LIST",     ["-test list-",     "-tooltip-"], "My Category", [[1, 0], ["enabled","disabled"], 1]] call CBA_fnc_addSetting;

// SLIDER --- extra arguments: [_min, _max, _default, _trailingDecimals, _isPercentage]
["Test_Setting_3", "SLIDER",   ["-test slider-",   "-tooltip-"], "My Category", [0, 10, 5, 0]] call CBA_fnc_addSetting;

// COLOR PICKER --- extra argument: _color
["Test_Setting_4", "COLOR",    ["-test color-",    "-tooltip-"], "My Category", [1, 1, 0]] call CBA_fnc_addSetting;

// EDITBOX --- extra argument: default value
["Test_Setting_5", "EDITBOX",  ["-test editbox-", "-tooltip-"], "My Category", "defaultValue"] call CBA_fnc_addSetting;

// TIME PICKER (time in seconds) --- extra arguments: [_min, _max, _default]
["Test_Setting_6", "TIME",     ["-test time-",    "-tooltip-"], "My Category", [0, 3600, 60]] call CBA_fnc_addSetting;
*/

[
    "SHGT_garage_status", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Module Enabled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Garage"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_garage_interactObject_Setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Interaction Objects", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Garage"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["Land_RepairDepot_01_tan_F"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        SHGT_garage_interactObject = parseSimpleArray SHGT_garage_interactObject_Setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_garage_target_Setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Garage spawning targets", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Garage"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["Land_HelipadEmpty_F","Land_JumpTarget_F","Land_HelipadCircle_F", "Land_HelipadCivil_F", "Land_HelipadRescue_F", "Land_HelipadSquare_F"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        SHGT_garage_target = parseSimpleArray SHGT_garage_target_Setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_garage_vehicleStorage_Setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Vehicle List", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Garage"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '[["Common","B_MRAP_01_F",20],["Common","B_Truck_01_cargo_F",20],["viking","B_Quadbike_01_F",20]]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        if isNil "SHGT_garage_vehicleStorage" then {
            SHGT_garage_vehicleStorage = parseSimpleArray SHGT_garage_vehicleStorage_Setting;
        };
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_garage_tags_Setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Submittable Player Tags", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Garage"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["Common","Reaper","Misfit","Gambler","Viking","HQ"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        SHGT_garage_tags = parseSimpleArray SHGT_garage_tags_Setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_garage_supplies_Setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Spawnable Vehicle Supply Items", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Garage"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["Land_CanisterFuel_F","ACE_Wheel","ACE_Track"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        SHGT_garage_supplies = parseSimpleArray SHGT_garage_supplies_Setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;