if !(isServer) exitWith {}; 
if !(SHGT_IEDs isEqualTo true) exitWith {}; 

// Init
SHGT_ied_iedList = ["IEDLandBig_F","IEDUrbanBig_F","IEDLandSmall_F","IEDUrbanSmall_F","Land_BarrelTrash_F"];
SHGT_ied_armingDistance = 10;
SHGT_ied_vbedIed = ["SatchelCharge_F"]; // Single IED only
SHGT_ied_vbedVehicles = [["UK3CB_TKC_C_Datsun_Civ_Closed",[0,2,-1.15]],["UK3CB_TKC_C_Datsun_Civ_Open",[.7,-.5,-1.1]],["UK3CB_TKC_C_Lada",[0.55,-0,-1.25]],["UK3CB_TKC_C_Ikarus", [.8,-1.7,-1.55]],["UK3CB_TKC_C_Gaz24", [0,-2,-.25]],["UK3CB_TKC_C_Kamaz_Covered", [0,0,-1.2]],["UK3CB_TKC_C_V3S_Refuel", [0,0,-1]],["UK3CB_TKC_C_S1203", [.8,-1.3,-1.05]],["UK3CB_TKC_C_S1203_Amb", [.8,-1.3,-1.05]]]; // [Vehiclename,[xyz offset]]
SHGT_ied_vbedChance = 100; // Chance an IED will be created in this vehicle
SHGT_ied_radioActivationChance = 50;

// Find Ammo types
SHGT_ied_iedListAmmo = [];
{
	_ammo = ([getText(configFile >> "CfgVehicles" >> _x >> "ammo")] select 0);
	if (_ammo isEqualTo "") then {
		SHGT_ied_iedListAmmo pushBackUnique _x;
	} else {
		SHGT_ied_iedListAmmo pushBackUnique _ammo;
	};
} forEach SHGT_ied_iedList;
SHGT_ied_vbedIedAmmo = [];
{SHGT_ied_vbedIedAmmo pushBackUnique ([getText(configFile >> "CfgVehicles" >> _x >> "ammo")] select 0) } forEach SHGT_ied_vbedIed;

// Set ACE object class to be detectable
// IDEA: use spawned dummy object instead of the trash object class? This way we can have trash bags that arent IEDS too
ace_minedetector_detectableClasses setVariable ["Land_BarrelTrash_F",true];

// Broadcast
publicVariable "SHGT_ied_iedList";
publicVariable "SHGT_ied_iedListAmmo";
publicVariable "SHGT_ied_armingDistance";
publicVariable "SHGT_ied_vbedIed";
publicVariable "SHGT_ied_vbedIedAmmo";
publicVariable "SHGT_ied_vbedVehicles";
publicVariable "SHGT_ied_vbedChance";
//publicVariable "SHGT_ied_iedAmmo";
publicVariable "SHGT_ied_radioActivationChance";

[] call SHGT_fnc_ied_vehicleInit;
[[],SHGT_fnc_ied_activate] remoteExec ["call",0,true];



