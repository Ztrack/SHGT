
// Settings needed: types, damage thresh, multiplier

[
    "SHGT_SW_VehTypes_Heli", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enabled for Helicopters", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_VehTypes_Plane", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    "Enabled for Planes", // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_VehTypes_Drone", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Enabled for Drones","Doesn't work if drone is incorrectly configured"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_VehTypes_Ground", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Enabled for Ground Vehicles","Highly experimental"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_VehTypes_ClassIgnore_setting", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "EDITBOX", // setting type
    ["Classname Ignore List","Any vehicles with these classnames are ignored"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    '["classname1","classname2"]', // value
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
        SHGT_SW_VehTypes_ClassIgnore = parseSimpleArray SHGT_SW_VehTypes_ClassIgnore_setting;
    }, // function that will be executed once on mission start and every time the setting is changed.
    true //Setting will be marked as needing mission restart after being changed
] call CBA_fnc_addSetting;

[
    "SHGT_SW_damageTreshold", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Damage Treshold","When the body or main rotor hits this damage, script engages. Higher is more damaged."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 1, .88, 3], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "SHGT_SW_damageMultiplier", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "SLIDER", // setting type
    ["Unit Damage Multiplier","Increases damage done to players at crash"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    [0, 10, 2, 2], // data for this setting: [min, max, default, number of shown trailing decimals]
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_ignore_AI_vehicles", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Ignore AI Vehicles","If driven by AI, ignore the vehicle"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_ignore_AI_Units", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Ignore AI In Vehicles","If checked, will not apply damage to AI units"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;

[
    "SHGT_SW_unconscious", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Set Crew Unconscious","Sets the crew of vehicle unconcious during crash sequence"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_immune_damage", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Ignore Damage During Crash","During crash sequence, players won't take additional damage from things hitting them until they hit the ground"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_eject_crew", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Eject Crew After Crash","Ejects the crew after helo/plane hits the ground"], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_vehicle_destruction_enabled", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Destroy Vehicle After Crash","Destroys vehicle 30s after helo/plane hits the ground. Cannot be stopped."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    true, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;
[
    "SHGT_SW_ignore_grounded_vehicles", // Internal setting name, should always contain a tag! This will be the global variable which takes the value of the setting.
    "CHECKBOX", // setting type
    ["Ignore grounded vehicles","Crash Script will not apply to vehicles near the ground, (under 10-meters) if this is enabled. To prevent vehicles from never being destroyed if vehicle destruction setting is off. If vehicle has crashed, 30-second timer must pass before it can be destroyed."], // Pretty name shown inside the ingame settings menu. Can be stringtable entry.
    "SHGT Survivable Wrecks", // Pretty name of the category where the setting can be found. Can be stringtable entry.
    false, //true/false
    true, // "_isGlobal" flag. Set this to true to always have this setting synchronized between all clients in multiplayer
    {  
        params ["_value"];
    } // function that will be executed once on mission start and every time the setting is changed.
] call CBA_fnc_addSetting;