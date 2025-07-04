#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_survivableWrecks
	{
		units[] = {};
		requiredVersion = 1.0;
		requiredAddons[] = {"A3_Modules_F","ace_medical"};
		author = "Ztrack";
	};
};

class Extended_PreInit_EventHandlers {
    class SHGT_SW_preInit {
        init = "call compile preprocessFileLineNumbers 'SurvivableWrecks\XEH_preInit.sqf'";
    };
};

class CfgFunctions
{
    class SHGT {
	tag = "SHGT";
	    class SurvivableWrecks {
            file = "\SurvivableWrecks\functions";
            class survivableWrecks_playerInit {};
			class survivableWrecks_GlobalInit {postInit = 1};
	    };
        
    };
};

class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

	class SHGT_craftwarning
	{
		name = "Vehicle Crash Warning";						// display name
		sound[] = { "\SurvivableWrecks\sounds\SHGT_craftwarning.ogg", 10, 1, 200 };	// file, volume, pitch, maxDistance
		titles[] = {0,""};
	};
};