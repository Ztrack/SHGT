// This whitelist script will first check all mods loaded on the server and allow them. Then it will reference mods in the whitelist array. 
// If there are leftover mods not on the server or whitelisted, player is kicked
// Run this command in-game to generate whitelist "copyToClipboard str ("true" configClasses (configFile >> "CfgPatches") apply {configName _x});"


// Run the following code in unnscheduled so we can suspend
[] spawn {

//Wait for conditions
waitUntil {uiSleep 1; (getClientStateNumber >= 10)}; // Wait for whitelist variable to exist
waitUntil {uiSleep 1; !(isNil "SHGT_whiteList_serverAddons")}; // Wait for whitelist variable to exist
uiSleep 30;

// Get whitelist
//systemChat "SHGT WL: Start...";
private _whitelistedAddons = [];
if (SHGT_whiteList_missionFile isEqualTo 1) then {
	// Load CBA setting
	_whitelistedAddons = SHGT_whiteList_whiteListedAddons;
};
if (SHGT_whiteList_missionFile isEqualTo 0) then {
	private _contents = loadFile "SHGT_modWhitelist.txt";
	_whitelistedAddons = parseSimpleArray _contents;
};

// Get player addons
private _playerAddons = ("(toLower (configName _x)) find ""a3"" != 0" configClasses (configFile >> "CfgPatches") apply {configName _x}); // Get all player addons

private _remainder = _playerAddons - SHGT_whiteList_serverAddons;
_remainder = _remainder - _whitelistedAddons;

// If mods are good, player continues with their miserable life
if (!(count _remainder > 0) or (_remainder isEqualTo []) or (isNil "_remainder")) exitWith {}; // Player is good to play on the server

// If unwhitelisted mods exist, continue to warn & kick player
systemChat format ["Unwhitelisted mods loaded, You will be kicked to lobby in 30s... Remove: %1",str _remainder];
hint format ["Unwhitelisted mods loaded, You will be kicked to lobby in 30s... Remove: %1",str _remainder];
uiSleep 30;
endMission "END2";

};
