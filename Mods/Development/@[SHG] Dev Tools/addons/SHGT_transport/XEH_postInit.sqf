if !(SHGT_transport_status isEqualTo true) exitWith {};

if (hasInterface) then {
	["CBA_settingsInitialized", {
		[] call SHGT_fnc_transport_callToPlayer;
	}] call CBA_fnc_addEventHandler;
};

if (isServer) then {
	["CBA_settingsInitialized", {
		[] call SHGT_fnc_transport_initializeHelicopterModuleFunction;
		[] call SHGT_fnc_transport_initializeTransportLocationModuleFunction;
	}] call CBA_fnc_addEventHandler;
};