
// Add save actions
[SHGT_persist_saveObject, "init", {
	(_this select 0) addAction ["Save objects Local dB", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_cond1 = (admin (owner _caller) == 2);
		_cond2 = _caller getVariable [SHGT_persist_adminTag,false];
		if (_cond1 or _cond2) then {[] call SHGT_fnc_persist_save; systemChat "Saving called";} else {systemChat "You are not admin or HQ"};
	},[],6,true,true,"","true",10];
	(_this select 0) addAction ["Load objects Local dB", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_cond1 = (admin (owner _caller) == 2);
		_cond2 = _caller getVariable [SHGT_persist_adminTag,false];
		if (_cond1 or _cond2) then {[] call SHGT_fnc_persist_load; systemChat "Loading called";} else {systemChat "You are not admin"};
	},[],6,true,true,"","true",10];
	
	// Add server saving
	(_this select 0) addAction ["Save objects Server dB", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_cond1 = (admin (owner _caller) == 2);
		_cond2 = _caller getVariable [SHGT_persist_adminTag,false];
		if (_cond1 or _cond2) then {[[],SHGT_fnc_persist_save] remoteExec ["call",2]; systemChat "Saving called";} else {systemChat "You are not admin"};
	},[],6,true,true,"","true",10];
	(_this select 0) addAction ["Load objects Server dB", {
		params ["_target", "_caller", "_actionId", "_arguments"];
		_cond1 = (admin (owner _caller) == 2);
		_cond2 = _caller getVariable [SHGT_persist_adminTag,false];
		if (_cond1 or _cond2) then {[[],SHGT_fnc_persist_load] remoteExec ["call",2]; systemChat "Loading called";} else {systemChat "You are not admin"};
	},[],6,true,true,"","true",10];
}, true, [], true] call CBA_fnc_addClassEventHandler;