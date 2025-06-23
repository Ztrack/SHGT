// add functions here that will trigger on CBA initialization & on all machines
["CBA_settingsInitialized", {
	// if !(SHGT_moduleName_status isEqualTo true) exitWith {};
	// [] call SHGT_fnc_moduleName_functionName;


}] call CBA_fnc_addEventHandler;

if (isServer) exitWith {
	// add functions here that will trigger on CBA initialization & on server only
	["CBA_settingsInitialized", {
		if !(SHGT_persist_status) exitWith {};
		if !(SHGT_persist_saveEditorObjectsCheck) then {[] call SHGT_fnc_persist_editorObjectsFlagger};
		[] call SHGT_fnc_persist_ServerPostInit;

	}] call CBA_fnc_addEventHandler;
};

if (hasInterface) exitWith {
	// add functions here that will trigger on CBA initialization & on players only
	["CBA_settingsInitialized", {
		// if !(SHGT_moduleName_status isEqualTo true) exitWith {};
		// [] call SHGT_fnc_moduleName_functionName;


	}] call CBA_fnc_addEventHandler;
};

if (isServer and !hasInterface) exitWith {
	// add functions here that will trigger on CBA initialization & on headlessClient only
	["CBA_settingsInitialized", {
		// if !(SHGT_moduleName_status isEqualTo true) exitWith {};
		// [] call SHGT_fnc_moduleName_functionName;


	}] call CBA_fnc_addEventHandler;
};