#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_arsenal
	{
		name = "Spearhead Gaming Dev Tools";
        author = "Ztrack";
        url = "https://discord.gg/spearheadgaming";

		requiredVersion = 1.0; // Required ARMA version
		requiredAddons[] = {"A3_Modules_F","ace_arsenal"}; // Required mod PBOs
        units[] = {}; // List of objects (CfgVehicles classes) contained in the addon.
        weapons[] = {}; // List of weapons (CfgWeapons classes) contained in the addon.
        
        skipWhenMissingDependencies = 0; // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod
	};
};

class CfgFactionClasses
{
    class SHGT_modules
    {
        displayname = "SHG Tools";
    };
};

class CfgFunctions
{
    class SHGT {
	tag = "SHGT";
	    class arsenal {
            file = "\SHGT_arsenal\functions";
            class arsenal_postInit {postInit = 1};
            class arsenal_playerInteraction {};
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
	
	// arsenal Modules
	#include "modules\arsenal_core.hpp"
	#include "modules\arsenal_listCreator.hpp"	
};