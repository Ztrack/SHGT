// This whitelist script will first check all mods loaded on the server and allow them. Then it will reference mods in the whitelist array. 
// If there are leftover mods not on the server or whitelisted, player is kicked
// Run this command in-game to generate whitelist "copyToClipboard str ("true" configClasses (configFile >> "CfgPatches") apply {configName _x});"

if ((isServer) and isNil ("SHGT_serverAddons")) then {
	SHGT_serverAddons = ("true" configClasses (configFile >> "CfgPatches") apply {configName _x});
	publicVariable "SHGT_serverAddons";
};

// Following code runs only on players
if !(hasInterface) exitWith {};

// Run the following code in unnscheduled so we can suspend
[] spawn {

//Wait for conditions
waitUntil {uiSleep 1; !(isNil "SHGT_whitelistedAddons")}; // Wait for whitelist variable to exist
waitUntil {uiSleep 1; (getClientStateNumber >= 10)}; // Wait for player to be past the briefing phase

// Get player addons
_playerAddons = ("true" configClasses (configFile >> "CfgPatches") apply {configName _x}); // Get all player addons

// Find if any mods remain after checking server + whitelist addons
_remainder = _playerAddons - SHGT_serverAddons;
_remainder = _remainder - SHGT_whitelistedAddons;

// If mods are good, player continues with their miserable life
uiSleep 5;
if !(count _remainder > 0) exitWith {systemChat "SHGT WL: Good"}; // Player is good to play on the server

// If unwhitelisted mods exist, continue to warn & kick player
systemChat format ["Unwhitelisted mods loaded, You will be kicked to lobby in 15... Remove: %1",str _remainder];
uiSleep 15;
endMission "END2";

};
