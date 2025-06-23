#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_reporter
	{
		name = "Spearhead Gaming Dev Tools Reporter";
        author = "Ztrack";
        url = "https://discord.gg/spearheadgaming";

		requiredVersion = 1.0; // Required ARMA version
		requiredAddons[] = {"A3_Modules_F","cba_main"}; // Required mod PBOs
        units[] = {}; // List of objects (CfgVehicles classes) contained in the addon.
        weapons[] = {}; // List of weapons (CfgWeapons classes) contained in the addon.
        
        skipWhenMissingDependencies = 0; // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod
	};
};

class Extended_PostInit_EventHandlers {
    class SHGT_reporter_postInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_reporter\XEH_postInit.sqf'";
    };
};
class CfgFunctions
{
    class SHGT {
	tag = "SHGT";
	    class reporter {
            file = "\SHGT_reporter\functions";
            class reporter_shotLogHandler {};
        };
    };
};