// This whitelist script will first check all mods loaded on the server and allow them. Then it will reference mods in the whitelist array. 
// If there are leftover mods not on the server or whitelisted, player is kicked
// Run this command in-game to generate whitelist "copyToClipboard str ("true" configClasses (configFile >> "CfgPatches") apply {configName _x});"

SHGT_whiteList_serverAddons = ("(toLower (configName _x)) find ""a3"" != 0" configClasses (configFile >> "CfgPatches") apply {configName _x});
publicVariable "SHGT_whiteList_serverAddons";