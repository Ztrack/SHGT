if !isServer exitWith {};

// EDITABLE SERVER SETTINGS
SHGT_civInteraction_status = true; // If set to false, the module turns off
SHGT_civInteraction_debug = true;
SHGT_civInteract_civrepSpread = 20; // Civ rep will be town rep +/- this number
SHGT_civInteract_TOAR = ['ao1','ao2','ao3']; // TOARs drawn on the editor map as markers of any type. Each marker is a town/area
SHGT_civInteract_civrepaddedfromHumrat = 10;
SHGT_civInteract_TownrepAddedfromHumrat = .25;
SHGT_civInteract_TownrepAddedFromDestroyedBuilding = -2;
SHGT_civInteract_TownrepAddedFromcivKilled = -2; // Triggers when civ is killed by a player



// DO NOT TOUCH PAST HERE
if !(SHGT_civInteraction_status isEqualTo true) exitWith {};
SHGT_areaReputation = createHashMap;
{
	_reputation = 50; // Initialize as this
	SHGT_areaReputation set [_x, _reputation];
} forEach SHGT_civInteract_TOAR;
publicVariable "SHGT_areaReputation"; // update Hashmap for JIP

// Civilian Initialization server side
[] call SHGT_fnc_civInteract_civInit; // Server side init

// Civilian Initialization player side
[[],SHGT_fnc_civInteract_CivAddActions] remoteExec ["call",0,true];

// Add building changed EH server side
[] call SHGT_fnc_civInteract_buildingDestroyedRepHandler; // Server side init







/*
[[],SHGT_fnc_misc_addActions] remoteExec ["call",-2,true];
if (SHGT_checkMods isEqualTo true) then { [[],SHGT_fnc_misc_modChecker] remoteExec ["call",0,true]; };
[] call SHGT_fnc_misc_kickPlayerOnVehicleDeath



Civ interactions:
1- Do you support us?
2- where are we?
3- give humrat
4- get intel on insurgents
5- get intel of IEDS