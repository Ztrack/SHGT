// add functions here that will trigger on CBA initialization & on all machines
	["CBA_settingsInitialized", {
		if !(SHGT_moduleName_status isEqualTo true) exitWith {};
		[] call SHGT_fnc_medicalDummy_functionsInit;


	}] call CBA_fnc_addEventHandler;