
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
    "SHGT_transport_status", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Module Enabled", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Transport"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_transport_cargoSize_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["ACE Cargo Capacity","Amount of ACE cargo space available in helicopter"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Transport"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '4', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_transport_cargoSize = parseNumber SHGT_transport_cargoSize_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_transport_recallInteractObject", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Recall Interact Classname",'This object will allow players to recall helicopter'], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Transport"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    "SHGT_transport_recallSign", // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
[
    "SHGT_transport_helipads_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Helipad Classnames","Helicopter will look for these helipads"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    ["SHGT","Transport"], // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["Land_HelipadCircle_F","Land_HelipadCivil_F","Land_HelipadRescue_F","Land_HelipadSquare_F","Land_Boxloader_Fort_Helipad_Tarp_Mini","Land_Boxloader_Fort_Helipad_Tarp","Land_Boxloader_Fort_Helipad_Tarp_Mid"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_transport_helipads = parseSimpleArray SHGT_transport_helipads_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;
