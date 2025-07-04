["CBA_settingsInitialized", {
	if !(SHGT_garage_status isEqualTo true) exitWith {}; 
	[] call SHGT_fnc_garage_addActions;

}] call CBA_fnc_addEventHandler;