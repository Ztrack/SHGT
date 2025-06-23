#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_zeus
	{
		name = "Spearhead Gaming Dev Tools";
        author = "Ztrack";
        url = "https://discord.gg/spearheadgaming";

		requiredVersion = 1.0; // Required ARMA version
		requiredAddons[] = {"A3_Modules_F","cba_main","zen_common","zen_dialog"}; // Required mod PBOs
        units[] = {}; // List of objects (CfgVehicles classes) contained in the addon.
        weapons[] = {}; // List of weapons (CfgWeapons classes) contained in the addon.
        
        skipWhenMissingDependencies = 1; // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod
	};
};

class Extended_PostInit_EventHandlers {
    class SHGT_zeus_postInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_zeus\XEH_postInit.sqf'";
    };
};
class CfgFunctions
{
    class SHGT {
	tag = "SHGT";
	    class zeus {
            file = "\SHGT_zeus\functions";
		    class zeus_rpgfire {};
        };
    };
};