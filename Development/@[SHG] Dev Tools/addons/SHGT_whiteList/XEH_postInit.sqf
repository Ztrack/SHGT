if (isServer) exitWith {
	// add functions here that will trigger on CBA initialization & on server only
	["CBA_settingsInitialized", {
		if !(SHGT_whiteList_status isEqualTo true) exitWith {}; 
		[] call SHGT_fnc_whiteList_serverModChecker;


	}] call CBA_fnc_addEventHandler;
};

if (hasInterface) exitWith {
	// add functions here that will trigger on CBA initialization & on players only
	["CBA_settingsInitialized", {
		if !(SHGT_whiteList_status isEqualTo true) exitWith {}; 
		[] call SHGT_fnc_whiteList_playerModChecker;


	}] call CBA_fnc_addEventHandler;
};