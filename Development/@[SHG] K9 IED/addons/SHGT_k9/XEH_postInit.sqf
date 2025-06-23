if (isServer) exitWith {
	// add functions here that will trigger on CBA initialization & on server only
	["CBA_settingsInitialized", {
		// if !(SHGT_moduleName_status isEqualTo true) exitWith {};
		[] call SHGT_fnc_k9_dogAI;


	}] call CBA_fnc_addEventHandler;
};
