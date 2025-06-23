#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_persist
	{
		name = "Spearhead Gaming Dev Tools Persistence";
        author = "Ztrack";
        url = "https://discord.gg/spearheadgaming";

		requiredVersion = 1.0; // Required ARMA version
		requiredAddons[] = {"A3_Modules_F","cba_main","SHGT_logistics"}; // Required mod PBOs
        units[] = {}; // List of objects (CfgVehicles classes) contained in the addon.
        weapons[] = {}; // List of weapons (CfgWeapons classes) contained in the addon.
        
        skipWhenMissingDependencies = 0; // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod
	};
};

class Extended_PreInit_EventHandlers {
    class SHGT_persist_preInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_persistence\XEH_preInit.sqf'";
    };
};
class Extended_PostInit_EventHandlers {
    class SHGT_persist_postInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_persistence\XEH_postInit.sqf'";
    };
};
class CfgFunctions
{
    class SHGT {
    class persist {
		file = "\SHGT_persistence\functions";
		class persist_ServerPostInit {};
		class persist_addActions {};
		class persist_deleteObjectsBeforeLoad {};
		class persist_load {};
		class persist_save {};
		class persist_saveObjects {};
		class persist_saveVehicles {};
		class persist_spawnObjects {};
		class persist_saveBases {};
		class persist_loadBases {};
		class persist_autoSave {};
		class persist_saveCivInteract {};
		class persist_loadCivInteract {};
        class persist_editorObjectsFlagger {};
	};
    };
};