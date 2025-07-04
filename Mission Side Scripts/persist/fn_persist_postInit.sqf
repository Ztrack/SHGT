// Check if logi script is done
//waitUntil{missionNameSpace getVariable ["SHGT_logisticsPostInitCheck",false];};
if !(isServer) exitWith {};

// Modify dB name to include the mission name
if (SHGT_persist_dBNamePostfix isEqualTo '') then {SHGT_persist_dBNamePostfix = briefingName;};
SHGT_persist_dBName = format ["%1_%2",SHGT_persist_dBNamePrefix,SHGT_persist_dBNamePostfix];

// add class inits for manual saving/ loading
[[],SHGT_fnc_persist_addActions] remoteExec ["call",0,true];

// Set done flag
SHGT_persistPostInitCheck = true;

// Public Variables
publicVariable "SHGT_persist_dBName";
publicVariable "SHGT_persist_hqObjectName";
publicVariable "SHGT_persist_fobObjectName";
publicVariable "SHGT_persist_pbObjectName";
publicVariable "SHGT_persist_fobCost";
publicVariable "SHGT_persist_pbCost";
publicVariable "SHGT_persist_radiusToSaveFob";
publicVariable "SHGT_persist_radiusToSaveHq";
publicVariable "SHGT_persist_radiusToSavepb";
publicVariable "SHGT_persist_saveObject";
publicVariable "SHGT_persist_vehicleSideToSave";
publicVariable "SHGT_persist_autoSaveFrequency";
publicVariable "SHGT_persist_autoLoad";
publicVariable "SHGT_persist_autoSave";
publicVariable "SHGT_persist_adminTag";
publicVariable "SHGT_persist_dBNamePostfix";



if (SHGT_persist_autoLoad isEqualTo true) then {[] call SHGT_fnc_persist_load;}; // autoload if option is true
[] call SHGT_fnc_persist_autoSave; // begin autosave in unscheduled environment