if !(isServer) exitWith {}; 
if !(SHGT_IEDs isEqualTo true) exitWith {}; 

// Init
SHGT_ied_iedList = ["IEDLandBig_F","IEDUrbanBig_F","IEDLandSmall_F","IEDUrbanSmall_F"];
SHGT_ied_armingDistance = 10;
SHGT_ied_vbedIed = ["SHGT_Explosive_Charge"]; // Single IED only
SHGT_ied_vbedChance = 100; // Chance an IED will be created in this vehicle
SHGT_ied_radioActivationChance = 50;
SHGT_ied_vbedVehicles = [
	["UK3CB_TKC_C_Ikarus",[[0.968384,-2.12875,-1.49067],0],[[-1.06311,-3.48251,-1.49269],180]],
	["UK3CB_TKC_C_Datsun_Civ_Closed",[[-0.617798,-1.09182,-0.701578],180],[[0.576538,-1.08843,-0.700819],270],[[0.676392,-0.191985,-1.02862],270]],
	["UK3CB_TKC_C_Datsun_Civ_Open",[[0.578247,-1.05424,-0.655608],270],[[-0.587891,-1.25341,-0.65312],90]],
	["UK3CB_TKC_C_Hatchback",[[0.501953,-0.742921,-0.767205],90],[[-0.659912,-0.82348,-0.760647],90],[[-0.0507813,-1.73746,-0.674392],0]],
	["UK3CB_TKC_C_V3S_Closed",[[-0.482666,-2.55923,-1.08136],90],[[0.542603,0.747045,-1.18027],90],[[-0.449829,1.05857,-1.17781],90]],
	["UK3CB_TKC_C_V3S_Refuel",[[-0.470215,0.596431,-1.05496],90],[[0.523926,0.268279,-1.05085],90],[[0.449585,-1.40538,-0.814045],90]],
	["UK3CB_TKC_C_Lada",[[-0.560791,-0.362014,-1.17762],90],[[0.524658,-0.254109,-1.17901],90],[[0.0284424,1.74617,-1.14719],0]],
	["UK3CB_TKC_C_Lada_Taxi",[[-0.560791,-0.362014,-1.17762],90],[[0.524658,-0.254109,-1.17901],90],[[0.0284424,1.74617,-1.14719],0]],
	["UK3CB_TKC_C_LR_Open",[[0.713013,-1.05614,-0.756143],90],[[-0.689087,-1.08648,-0.684375],90],[[0.0506592,-1.62356,-1.20114],180]],
	["UK3CB_TKC_C_S1203",[[-0.766724,-0.329753,-0.989581],0],[[0.777954,-1.29317,-0.985473],180],[[0.66333,-0.033069,-1.0162],90]],
	["UK3CB_TKC_C_S1203_Amb",[[-0.766724,-0.329753,-0.989581],0],[[0.777954,-1.29317,-0.985473],180],[[0.66333,-0.033069,-1.0162],90]],
	["UK3CB_TKC_C_Tractor_Old",[[0.173584,-0.217688,-0.701229],90],[[-0.610962,-0.526321,-0.665928],90],[[-0.155762,-0.0855422,-0.942806],0]],
	["UK3CB_TKC_C_TT650",[[-0.165771,0.219547,-0.990426],0],[[-0.285278,-0.351278,-0.79853],270],[[-0.104858,-0.367388,-0.798436],270]],
	["UK3CB_TKC_C_YAVA",[[-0.221069,0.227068,-1.00852],90],[[-0.00854492,0.0595554,-0.857423],90]],
	["UK3CB_TKC_C_UAZ_Open",[[-0.679321,-0.153978,-0.678959],90],[[0.644897,-0.0890364,-0.678572],90],[[-0.115234,-1.48036,-0.599456],0]],
	["UK3CB_TKC_C_Gaz24",[[-0.521729,-1.67738,-0.190179],0],[[-0.690063,-0.530409,-0.293328],90],[[-0.515747,-1.09803,-0.240185],270]]
];

// Find Ammo types
SHGT_ied_iedListAmmo = [];
{
	_ammo = ([getText(configFile >> "CfgVehicles" >> _x >> "ammo")] select 0);
	if (_ammo isEqualTo "") then {
		SHGT_ied_iedListAmmo pushBackUnique _x;
		//ace_minedetector_detectableClasses setVariable [_x,true]; // Set ACE object class to be detectable
		//_detectables = +(uiNamespace getVariable "ace_minedetector_detectableclasses");
		//_detectables set [_x, objNull];
		//uiNamespace setVariable ["ace_minedetector_detectableclasses",_detectables,true];
		
	} else {
		SHGT_ied_iedListAmmo pushBackUnique _ammo;
	};
} forEach SHGT_ied_iedList;
SHGT_ied_vbedIedAmmo = [];
{SHGT_ied_vbedIedAmmo pushBackUnique ([getText(configFile >> "CfgVehicles" >> _x >> "ammo")] select 0) } forEach SHGT_ied_vbedIed;

// Add inits for radio activation of IEDs
SHGT_IED_IEDRadioActivation = {
if !(hasInterace) exitWith {};
["MyID", "OnTangent", {
//hint format ["%1 %2 speaking", _this select 0, if(_this select 1)then{"is"}else{"isn't"}];
	_ied = nearestObjects [player, SHGT_ied_iedListAmmo,10];
	if !(_ied isEqualTo [])  then {
		_ied = _ied select 0; // get the first IED
		if (!(_ied getVariable ["boom",false]) and (random 100 <= SHGT_ied_radioActivationChance)) then {
			_ied setVariable ["boom",true];
			//[[_ied],SHGT_ied_activateWithNokia] remoteExec ["call",2,false];
			[_ied] call SHGT_ied_activateWithNokia;
		};
	};
}, Player] call TFAR_fnc_addEventHandler;
};
[[],SHGT_IED_IEDRadioActivation] remoteExec ["call",0,true];


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
publicVariable "SHGT_ied_ActivationSound";
publicVariable "SHGT_ied_ActivationDelay";
publicVariable "SHGT_ied_ActivationDistance";

//[] call SHGT_fnc_ied_vehicleInit;
[[],SHGT_fnc_ied_activate] remoteExec ["call",0,true];
