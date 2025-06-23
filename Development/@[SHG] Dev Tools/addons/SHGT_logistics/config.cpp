#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_logistics
	{
		name = "Spearhead Gaming Dev Tools";
        author = "Ztrack";
        url = "https://discord.gg/spearheadgaming";

		requiredVersion = 1.0; // Required ARMA version
		requiredAddons[] = {"A3_Modules_F","cba_main","CAU_UserInputMenus"}; // Required mod PBOs
        units[] = {}; // List of objects (CfgVehicles classes) contained in the addon.
        weapons[] = {}; // List of weapons (CfgWeapons classes) contained in the addon.
        
        skipWhenMissingDependencies = 1; // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod
	};
};

class CfgFactionClasses
{
    class SHGT_modules
    {
        displayname = "SHG Tools";
    };
};

class Extended_PreInit_EventHandlers {
    class SHGT_logistics_preInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_logistics\XEH_preInit.sqf'";
    };
};
class Extended_PostInit_EventHandlers {
    class SHGT_logistics_postInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_logistics\XEH_postInit.sqf'";
    };
};
class CfgFunctions
{
    class SHGT {
	tag = "SHGT";
	    class logistics {
            file = "\SHGT_logistics\functions";
		    class logistics_postInit {};
		    class logistics_addActions {};
		    class logistics_addKeybinds {};
		    class logistics_guiUserSelectObject {};
		    class logistics_interactionKey {};
		    class logistics_placeObject {};
		    class logistics_unbuildAction {};
		    class logistics_buildObject {};
		    class logistics_assistbuildingAction {};
		    class logistics_holdPlayer {};
		    class logistics_createBase {};
		    class logistics_baseSavePlayer {};
		    class logistics_baseLoadPlayer {};
		    class logistics_lcla_loadCargoInit {};
		    class logistics_lcla_loadCargo {};
		    class logistics_lcla_UnloadCargo {};
		    class logistics_boxSaverInteraction {};
		    class logistics_fillContainer {};
        };
    };
};

class CfgVehicles
{
    class Logic;
    class Module_F: Logic
    {
        class AttributesBase
        {
            class Default;
            class Edit; // Default edit box (i.e., text input field)
            class Combo; // Default combo box (i.e., drop-down menu)
            class CheckBox; // Tickbox, returns true/false
            class CheckBoxNumber; // Tickbox, returns 1/0
            class ModuleDescription; // Module description
        };
        class ModuleDescription
        {
            class Anything;
        };
    };
	
	// garage modules
    // #include "modules\logistics_editorModuleName.hpp"
};