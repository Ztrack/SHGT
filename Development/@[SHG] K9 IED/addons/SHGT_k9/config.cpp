class CfgPatches
{
	class SHGT_k9
	{
		name = "Spearhead Gaming Dev Tools K9 IED";
        author = "Ztrack";
        url = "https://discord.gg/spearheadgaming";

		requiredVersion = 1.0; // Required ARMA version
		requiredAddons[] = {"A3_Modules_F","cba_main","ace_main","MFR_Dogs"}; // Required mod PBOs
        units[] = {}; // List of objects (CfgVehicles classes) contained in the addon.
        weapons[] = {}; // List of weapons (CfgWeapons classes) contained in the addon.
        
        skipWhenMissingDependencies = 0; // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod
	};
};

class Extended_PreInit_EventHandlers {
    class SHGT_k9_preInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_k9\XEH_preInit.sqf'";
    };
};
class Extended_PostInit_EventHandlers {
    class SHGT_k9_postInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_k9\XEH_postInit.sqf'";
    };
};
class CfgFunctions
{
    class SHGT {
	tag = "SHGT";
	    class k9 {
            file = "\SHGT_k9\functions";
		    class k9_dogAI {};
        };
    };
};


class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version
    class dog_barking
	{
		name = "Barking dog";						// display name
		sound[] = { "SHGT_k9\sounds\dog_barking.ogg", 10, 1, 50 };	// file, volume, pitch, maxDistance
		titles[] = {0,""};
	};
};