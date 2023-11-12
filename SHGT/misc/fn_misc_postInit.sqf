publicVariable "SHGT_callToPrayer";
publicVariable "SHGT_deleteAllMapLocations";
publicVariable "SHGT_removeAICollisionDamage";
publicVariable "SHGT_addVehicleReloadingAction";
publicVariable "SHGT_kickPlayerFromVehicleOnDeath";
publicVariable "SHGT_removeGPSfromVehicles";

[[],SHGT_fnc_misc_addActions] remoteExec ["call",-2,true];
if (SHGT_checkMods isEqualTo true) then { [[],SHGT_fnc_misc_modChecker] remoteExec ["call",0,true]; };
if (SHGT_deleteAllMapLocations isEqualTo true) then {[] call SHGT_fnc_misc_deleteLocations};
if (SHGT_removeAICollisionDamage isEqualTo true) then {[[],SHGT_fnc_misc_removeAICollisionDamage] remoteExec ["call",0,true]};
if (SHGT_callToPrayer isEqualTo true) then {[[],SHGT_fnc_misc_callToPrayer] remoteExec ["call",-2,true];};
if (SHGT_addVehicleReloadingAction isEqualTo true) then {[[],SHGT_fnc_misc_vehicleReloadingaddAction] remoteExec ["call",-2,true];};
[[],SHGT_fnc_misc_medicalDummy] remoteExec ["call",0,true];
[[],SHGT_fnc_misc_soccerInit] remoteExec ["call",0,true];
[[],SHGT_fnc_misc_quickDropBackpack] remoteExec ["call",0,true];

if (SHGT_kickPlayerOnVehicleDeath isEqualTo true) then {[] call SHGT_fnc_misc_kickPlayerOnVehicleDeath};
if (SHGT_kickPlayerFromVehicleOnDeath isEqualTo true) then {[[],SHGT_fnc_misc_kickdeadPlayerFromVehicleOnDeath] remoteExec ["call",-2,true];};
if (SHGT_removeItemsFromAI isEqualTo true) then {[] call SHGT_fnc_misc_removeItemsFromAI};
[[],SHGT_fnc_misc_removeGPSfromVehicles] remoteExec ["call",-2,true];