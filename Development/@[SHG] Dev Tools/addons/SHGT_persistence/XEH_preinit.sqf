
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
    "SHGT_persist_status", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Module Enabled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_persist_autoSave", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Module Enabled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_persist_autoLoad", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Module Enabled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_persist_autoSaveFrequency_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Autosave Interval",'Time in Minutes'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '360', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        SHGT_persist_autoSaveFrequency = parseNumber SHGT_persist_autoSaveFrequency_setting;
    }, // function that will be executed once on mission start and every time the setting is changed
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_persist_dBNamePrefix", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["db Name Prefix",'pretty name'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'SHGT_dB', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_persist_dBNamePostfix_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["db Name Postfix",'pretty name'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'save001', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        if (SHGT_persist_dBNamePostfix_setting isEqualTo '') then {SHGT_persist_dBNamePostfix = briefingName;} else {SHGT_persist_dBNamePostfix =SHGT_persist_dBNamePostfix_setting};
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_persist_saveObject", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Saving Object",'pretty name'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'Land_Laptop_03_black_F', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_persist_saveVehiclesCheck", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Save Vehicles", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_persist_vehicleSideToSave_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Vehicle sides to save",'[1] for BLUFOR, [0] for REDFOR, [2] for GREENFOR, [3] for civ. [1,3] for WEST + CIV, [0,1,2,3] for ALL '], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '[1]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
        SHGT_persist_vehicleSideToSave = parseSimpleArray SHGT_persist_vehicleSideToSave_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_persist_saveEditorObjectsCheck", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Save Editor Placed Objects", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;












[
    "SHGT_persist_adminTag", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Admin Tag",'This player variable allows system management'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Persistence"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    'HQ', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;