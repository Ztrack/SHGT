class CfgPatches
{
	class SHGT_moduleName
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

class CfgFactionClasses
{
    class SHGT_modules
    {
        displayname = "SHG Tools";
    };
};

class Extended_PreInit_EventHandlers {
    class SHGT_moduleName_preInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_moduleName\XEH_preInit.sqf'";
    };
};
class Extended_PostInit_EventHandlers {
    class SHGT_moduleName_postInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_moduleName\XEH_postInit.sqf'";
    };
};
class CfgFunctions
{
    class SHGT {
	tag = "SHGT";
	    class moduleName {
            file = "\SHGT_moduleName\functions";
		    class moduleName_functionName {};
        };
    };
};

class CfgVehicles {
    class theparentclass;
    class ace_flags_carrier_white: theparentclass {
      class EventHandlers;
    };
    class yourclass: ace_flags_carrier_white {
      class EventHandlers: EventHandlers {
        init = "systemChat 'hello everybody i am really cool'";
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
    #include "modules\moduleName_editorModuleName.hpp"
};