if !isServer exitWith {};


if !(SHGT_civInteraction_status isEqualTo true) exitWith {};
if (isNil "SHGT_areaReputation") then {
	SHGT_areaReputation = createHashMap;
	{
		_reputation = 0; // Initialize as this
		SHGT_areaReputation set [_x, _reputation];
		if (SHGT_civInteraction_debug isEqualTo true) then {
			_x setMarkerColor "ColorCIV";
			_x setmarkerAlpha 0.5;
		} else {
			_x setmarkerAlpha 0;
		};
	} forEach SHGT_civInteract_TOAR;
};
// SHGT_areaReputation set ['DharGhaffari', 8]; // Setting rep for a region example
publicVariable "SHGT_areaReputation"; // update Hashmap for JIP

// Civilian Initialization server side
[] call SHGT_fnc_civInteract_civInit;

// Civilian killed EH
//[[],SHGT_fnc_civInteract_reputationLossKilledEventHandler] remoteExec ["call",0,true];
call SHGT_fnc_civInteract_reputationLossKilledEventHandler;

// Add building changed EH server side
[] call SHGT_fnc_civInteract_buildingDestroyedRepHandler; // Server side init

// Start IED generation dependent on rep
[] call SHGT_fnc_civInteract_IEDInit; // Server side init



// public Variable declarations
publicVariable "SHGT_civInteraction_status";
publicVariable "SHGT_civInteract_civrepaddedfromHumrat";
publicVariable "SHGT_civInteract_TownrepAddedfromHumrat";
publicVariable "SHGT_civInteract_maxHumratRepGainPerDay";
publicVariable "SHGT_civInteract_TownrepAddedFromDestroyedBuilding";
publicVariable "SHGT_civInteract_TownrepAddedFromcivKilled";
publicVariable "SHGT_civInteract_TOAR";
publicVariable "SHGT_civInteract_TOARActive";
publicVariable "SHGT_civInteract_DefineCivHouses";
publicVariable "SHGT_civInteract_maxHumratRepGainPerDay";
publicVariable "SHGT_civInteraction_RoadIEDList";
publicVariable "SHGT_civInteraction_BuildingIEDList";
publicVariable "SHGT_civInteract_civrepSpread";
publicVariable "SHGT_civInteract_responseSounds";
publicVariable "SHGT_civInteract_iedDefusalTownRepAdd";

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
