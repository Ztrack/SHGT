if !(isServer) exitWith {}; 
if !(SHGT_IEDs isEqualTo true) exitWith {}; 

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
