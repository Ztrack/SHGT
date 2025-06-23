// add functions here that will trigger on CBA initialization & on all machines
["CBA_settingsInitialized", {
	if !(SHGT_logistics_status isEqualTo true) exitWith {};
	// [] call SHGT_fnc_moduleName_functionName;
	[] call SHGT_fnc_logistics_lcla_loadCargoInit;

}] call CBA_fnc_addEventHandler;

if (isServer) then {
	// add functions here that will trigger on CBA initialization & on server only
	["CBA_settingsInitialized", {
		if !(SHGT_logistics_status isEqualTo true) exitWith {};
		// [] call SHGT_fnc_moduleName_functionName;
		[] call SHGT_fnc_logistics_postInit;

	}] call CBA_fnc_addEventHandler;
};

if (hasInterface) then {
	// add functions here that will trigger on CBA initialization & on players only
	["CBA_settingsInitialized", {
		[] call SHGT_fnc_logistics_boxSaverInteraction;
		[] call SHGT_fnc_logistics_addKeybinds;
		[] call SHGT_fnc_logistics_addActions;
		[] call SHGT_fnc_logistics_baseLoadPlayer;

	}] call CBA_fnc_addEventHandler;
};




/*
if (isServer and !hasInterface) exitWith {
	// add functions here that will trigger on CBA initialization & on headlessClient only
	["CBA_settingsInitialized", {
		// if !(SHGT_moduleName_status isEqualTo true) exitWith {};
		// [] call SHGT_fnc_moduleName_functionName;


	}] call CBA_fnc_addEventHandler;
};