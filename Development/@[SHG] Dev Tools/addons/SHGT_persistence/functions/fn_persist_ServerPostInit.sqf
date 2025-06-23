// Check if logi script is done
//waitUntil{missionNameSpace getVariable ["SHGT_logisticsPostInitCheck",false];};
if !(isServer) exitWith {};

// Modify dB name to include the mission name
SHGT_persist_dBName = format ["%1_%2",SHGT_persist_dBNamePrefix,SHGT_persist_dBNamePostfix];

// add class inits for manual saving/ loading
[[],SHGT_fnc_persist_addActions] remoteExec ["call",0,true];

// Set done flag
SHGT_persistPostInitCheck = true;

// Public Variables
publicVariable "SHGT_persistPostInitCheck";
publicVariable "SHGT_persist_dBName";


if (SHGT_persist_autoLoad isEqualTo true) then {[] call SHGT_fnc_persist_load;}; // autoload if option is true
[] call SHGT_fnc_persist_autoSave; // begin autosave in unscheduled environment