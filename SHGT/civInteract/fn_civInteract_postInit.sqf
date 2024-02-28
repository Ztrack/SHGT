if !isServer exitWith {};

// EDITABLE SERVER SETTINGS
SHGT_civInteraction = true;
SHGT_debug = true;
SHGT_civrepSpread = 20; // Civ rep will be town rep +/- this number
SHGT_TOAR = ['ao1','ao2','ao3']; // TOARs drawn on the editor map as markers of any type. Each marker is a town/area
SHGT_civKilledReputationLoss = 5; // Triggers when civ is killed by a player





// DO NOT TOUCH PAST HERE
if !(SHGT_civInteraction isEqualTo true) exitWith {};
SHGT_areaReputation = createHashMap;
{
	_reputation = 50; // Initialize as this
	SHGT_areaReputation set [_x, _reputation];
} forEach SHGT_TOAR;

// Civilian Initialization server side
[] call SHGT_fnc_civInteract_civInit; // Server side init

// Civilian Initialization player side
[[],SHGT_fnc_civInteract_CivAddActions] remoteExec ["call",0,true];









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