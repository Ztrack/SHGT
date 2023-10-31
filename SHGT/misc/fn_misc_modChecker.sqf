
if ((isServer) and isNil ("SHGT_clientAddons")) then {SHGT_clientAddons = []; publicVariable "SHGT_clientAddons";};
SHGT_whitelistedAddons = ["vn_versioning","3denEnhanced"];

SHGT_modCheckerToServer = {
params ["_clientConfigs","_name"];
	private _AA = "((toLower (configName _x)) find ""a3"" != 0) && ((toLower (configName _x)) find ""jsrs"" != 0) && ((toLower (configName _x)) find ""vn"" != 0)" configClasses (configFile >> "CfgPatches"); 
	//private _AA = "(toLower (configName _x)) find ""a3"" != 0 && (toLower (configName _x)) find ""jsrs"" != 0 " configClasses (configFile >> "CfgPatches"); 
	private _serverConfigs = _AA apply {configName _x} ; //bux
	private _clientSide = _clientConfigs - _serverConfigs;
	_clientSide = _clientSide - SHGT_whitelistedAddons;
	diag_log format ["SHGT Addon Checker: %1, %2", _name, _clientSide];
	//{
	//	if (_x isEqualTo _name) then {SHGT_clientAddons set [_forEachIndex,[_name,_clientSide]]} else {SHGT_clientAddons pushBack [_name,_clientSide]};
	//} forEach SHGT_clientAddons;
	//if (SHGT_clientAddons isEqualTo []) then {SHGT_clientAddons pushBack [_name,_clientSide]};
	//publicVariable "SHGT_clientAddons";
};



if (hasInterface) then {
	private _AA = "(toLower (configName _x)) find ""a3"" != 0 && (toLower (configName _x)) find ""jsrs"" != 0" configClasses (configFile >> "CfgPatches"); 
	private _configs = _AA apply {configName _x} ; //bux
	private _name = name player;
	[[_configs,_name],SHGT_modCheckerToServer] remoteExec ["call", 2, false];
};
