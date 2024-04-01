if !isServer exitWith {};

// EDITABLE SERVER SETTINGS
SHGT_civInteraction_status = true; // If set to false, the module turns off
SHGT_civInteraction_debug = false;
SHGT_civInteract_civrepSpread = 20; // Civ rep will be town rep +/- this number
SHGT_civInteract_TOAR = ['ao1','ao2','ao3']; // TOARs drawn on the editor map as markers of any type. Each marker is a town/area
SHGT_civInteract_civrepaddedfromHumrat = 20;
SHGT_civInteract_TownrepAddedfromHumrat = 1;
SHGT_civInteract_TownrepAddedFromDestroyedBuilding = -2;
SHGT_civInteract_TownrepAddedFromcivKilled = -2; // Triggers when civ is killed by a player
SHGT_civInteract_DefineCivHouses = ["Land_House_L_1_EP1","Land_House_C_3_EP1","Land_House_L_3_EP1","Land_House_L_3_dam_EP1","Land_House_L_3_H_EP1","Land_House_L_4_EP1","Land_House_L_4_dam_EP1","Land_House_L_6_EP1","Land_House_L_6_dam_EP1","Land_House_L_7_EP1","Land_House_L_7_dam_EP1","Land_House_L_8_EP1","Land_House_L_8_dam_EP1","Land_House_L_9_EP1","Land_House_K_1_EP1","Land_House_K_5_EP1","Land_House_K_5_dam_EP1","Land_House_K_8_EP1","Land_House_K_8_dam_EP1","Land_House_K_1_EP1","Land_House_K_5_EP1","Land_House_K_5_dam_EP1","Land_House_K_8_EP1","Land_House_K_8_dam_EP1","Land_House_K_6_EP1","Land_House_K_6_dam_EP1","Land_House_K_3_EP1","Land_House_K_3_dam_EP1","Land_House_K_3_EP1","Land_House_K_3_dam_EP1","Land_House_K_7_EP1","Land_House_K_7_dam_EP1","Land_House_K_2_basehide_EP1","Land_A_Minaret_EP1","Land_A_Minaret_dam_EP1","Land_A_Minaret_Porto_EP1","Land_A_Minaret_porto_dam_EP1","Land_A_Mosque_big_addon_EP1","Land_A_Mosque_big_hq_EP1","Land_A_Mosque_big_minaret_1_EP1","Land_A_Mosque_big_minaret_1_dam_EP1","Land_A_Mosque_big_minaret_2_EP1","Land_A_Mosque_big_minaret_2_dam_EP1","Land_A_Mosque_small_1_EP1","Land_A_Mosque_small_1_dam_EP1","Land_A_Mosque_small_2_dam_EP1","Land_A_Mosque_small_2_EP1","Land_House_C_12_EP1", "Land_House_C_12_dam_EP1", "Land_A_Stationhouse_ep1", "Land_Dum_istan4", "Land_Dum_istan4_big", "Land_Dum_istan2_01", "Land_Dum_istan2_02", "Land_Dum_istan2_04a", "Land_Dum_istan2_03", "Land_Dum_istan2_03a", "Land_Dum_istan4_detaily1", "Land_Dum_istan4_inverse", "Land_Dum_istan4_big_inverse", "Land_Dum_istan3_hromada", "Land_House_C_10_EP1", "Land_House_C_10_dam_EP1", "Land_House_C_11_EP1", "Land_House_C_11_dam_EP1", "Land_Dum_istan3_pumpa", "Land_House_C_5_EP1", "Land_House_C_5_dam_EP1", "Land_House_C_5_V1_EP1", "Land_House_C_5_V1_dam_EP1", "Land_House_C_5_V2_EP1", "Land_House_C_5_V2_dam_EP1", "Land_House_C_5_V3_EP1","Land_House_C_5_V3_dam_EP1", "Land_Dum_istan2", "Land_Dum_istan2b", "Land_Dum_mesto3_istan", "Land_Dum_istan3", "Land_Dum_istan3_hromada2", "Land_A_Villa_EP1", "Land_A_Villa_dam_EP1", "Land_House_C_4_EP1", "Land_House_C_4_dam_EP1", "Land_A_Office01_EP1","Land_House_C_9_EP1", "Land_House_C_9_dam_EP1", "Land_House_C_3_EP1", "Land_House_C_3_dam_EP1", "Land_House_C_2_EP1", "Land_House_C_2_DAM_EP1", "Land_House_C_1_EP1", "Land_House_C_1_dam_EP1", "Land_House_C_1_v2_EP1", "Land_House_C_1_v2_dam_EP1", "Land_Ind_PowerStation_EP1"];
SHGT_civInteract_maxHumratRepGainPerDay = 10;



// DO NOT TOUCH PAST HERE
if !(SHGT_civInteraction_status isEqualTo true) exitWith {};
SHGT_areaReputation = createHashMap;
{
	_reputation = 50; // Initialize as this
	SHGT_areaReputation set [_x, _reputation];
	if (SHGT_civInteraction_debug isEqualTo true) then {
		_x setMarkerColor "ColorCIV";
		_x setmarkerAlpha 0.5;
	} else {
		_x setmarkerAlpha 0;
	};
} forEach SHGT_civInteract_TOAR;
publicVariable "SHGT_areaReputation"; // update Hashmap for JIP

// Civilian Initialization server side
[] call SHGT_fnc_civInteract_civInit; // Server side init

// Civilian Initialization player side
[[],SHGT_fnc_civInteract_CivAddActions] remoteExec ["call",0,true];

// Add building changed EH server side
[] call SHGT_fnc_civInteract_buildingDestroyedRepHandler; // Server side init

// Start IED generation dependent on rep
[] call SHGT_fnc_civInteract_IEDInit; // Server side init



// public Variable declarations
publicVariable "SHGT_civInteract_maxHumratRepGainPerDay";


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
