
if (hasInterface) exitWith {
	// add functions here that will trigger on CBA initialization & on players only
	["CBA_settingsInitialized", {
		// if !(SHGT_moduleName_status isEqualTo true) exitWith {};
		// [] call SHGT_fnc_moduleName_functionName;
		[] call SHGT_fnc_reporter_shotLogHandler;
	}] call CBA_fnc_addEventHandler;
};
