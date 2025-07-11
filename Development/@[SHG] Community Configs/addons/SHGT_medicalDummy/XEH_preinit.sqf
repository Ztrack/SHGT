
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
    "SHGT_medicalDummy_status", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Module Enabled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","medicalDummy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_medicalDummy_spawner_object", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spawner Object Class",'This object will create the interactions'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","medicalDummy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'Land_DataTerminal_01_F', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

// SHGT_medicalDummy_stretcher_object = "kat_stretcher";
[
    "SHGT_medicalDummy_stretcher_object", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Stretcher Object Class",'This object will create the interactions'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","medicalDummy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'kat_stretcher', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_medicalDummy_target_object", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Target Object Class",'This object will spawn stretchers'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","medicalDummy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'Land_JumpTarget_F', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

//SHGT_medicalDummy_spawner_radius = 5;
[
    "SHGT_medicalDummy_spawner_radius_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Spawner Radius","From center of helipad Target"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","medicalDummy"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '5', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_medicalDummy_spawner_radius = parseNumber SHGT_medicalDummy_spawner_radius_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_medicalDummy_spawner_settings_GSW_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Gun Shot Wound Settings", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Garage"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '[
	[5, 0.3, 0.7, "bullet"],
	[10, 0.3, 0.9, "bullet"],
	[20, 0.6, 1.0, "bullet"],
	[30, 0.6, 1.0, "bullet"]
]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        SHGT_medicalDummy_spawner_settings_GSW = parseSimpleArray SHGT_medicalDummy_spawner_settings_GSW_Setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_medicalDummy_spawner_settings_IED_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    "Gun Shot Wound Settings", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Garage"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '[
	[5, 0.3, 0.7, "explosive"],
	[10, 0.5, 0.7, "explosive"],
	[15, 0.6, 0.8, "explosive"],
	[20, 0.8, 1.0, "explosive"]
]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        SHGT_medicalDummy_spawner_settings_IED = parseSimpleArray SHGT_medicalDummy_spawner_settings_IED_Setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

SHGT_medicalDummySettingsInitialized = true;
