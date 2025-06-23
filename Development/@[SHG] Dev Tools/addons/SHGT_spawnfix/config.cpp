#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_spawnfix
	{
		name = "Spearhead Gaming Dev Tools";
        author = "Ztrack";
        url = "https://discord.gg/spearheadgaming";

		requiredVersion = 1.0; // Required ARMA version
		requiredAddons[] = {"A3_Modules_F","cba_main"}; // Required mod PBOs
        units[] = {}; // List of objects (CfgVehicles classes) contained in the addon.
        weapons[] = {}; // List of weapons (CfgWeapons classes) contained in the addon.
        
        skipWhenMissingDependencies = 0; // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod
	};
};

class Extended_PreInit_EventHandlers {
    class SHGT_spawnfix_preInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_spawnfix\XEH_preInit.sqf'";
    };
};
class Extended_PostInit_EventHandlers {
    class SHGT_spawnfix_postInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_spawnfix\XEH_postInit.sqf'";
    };
};
class CfgFunctions
{
    class SHGT {
	tag = "SHGT";
	    class spawnfix {
            file = "\SHGT_spawnfix\functions";
		    class spawnfix_init {};
        };
    };
};
