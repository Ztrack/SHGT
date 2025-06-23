#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_transport
	{
		name = "Spearhead Gaming Dev Tools Transport";
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
    class SHGT_transport_preInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_transport\XEH_preInit.sqf'";
    };
};
class Extended_PostInit_EventHandlers {
    class SHGT_transport_postInit {
        init = "call compile preprocessFileLineNumbers 'SHGT_transport\XEH_postInit.sqf'";
    };
};
class CfgFunctions
{
    class SHGT {
            class transport {
                file = "\SHGT_transport\functions";
                class transport_flightOrder {};
                class transport_callToPlayer {};
                class transport_initializeHelicopterModuleFunction {};
                class transport_initializeHelicopter {};
                class transport_initializeHelicopterAddAction {};
                class transport_initializeTransportLocationModuleFunction {};
                class transport_guiSelectTransportLocation {};
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
    #include "modules\transport_initializeHelicopter.hpp"
    #include "modules\transport_initializeLocation.hpp"

    class Thing;
    class ThingX;
    class RoadCone_F;
    class SHGT_transport_recallSign: RoadCone_F
    {
        displayName = "SHGT Recall";
        model = "A3\Signs_F\Signs_Ad\SignsAd_SponsorS_F.p3d";
        editorPreview = "\SHGT_transport\images\radioheli.paa";
        hiddenSelectionsTextures[] = {"\SHGT_transport\images\radioheli.paa"};
		scope = 2;
        scopeCurator = 2;
        simulation = "house";
    };
};

class CfgSounds
{
	sounds[] = {}; // OFP required it filled, now it can be empty or absent depending on the game's version

	class SHGT_transport_line1
	{
		name = "transport_line1";						// display name
		sound[] = { "\SHGT_transport\media\Line1.ogg", 20, 1, 50 };	// file, volume, pitch, maxDistance
		titles[] = {0,"Pilot: Copy, we're oscar mike your location"};
	};
    class SHGT_transport_line2
	{
		name = "transport_line2";						// display name
		sound[] = { "\SHGT_transport\media\Line2.ogg", 20, 1, 50 };	// file, volume, pitch, maxDistance
		titles[] = {0,"Pilot: Negative, we're currently on tasking"};
	};
    class SHGT_transport_line3
	{
		name = "transport_line3";						// display name
		sound[] = { "\SHGT_transport\media\Line3.ogg", 20, 1, 50 };	// file, volume, pitch, maxDistance
		titles[] = {0,"Pilot: Radio malfunctions, rerouting your way"};
	};
    class SHGT_transport_line4
	{
		name = "transport_line4";						// display name
		sound[] = { "\SHGT_transport\media\Line4.ogg", 20, 1, 50 };	// file, volume, pitch, maxDistance
		titles[] = {0,"Pilot: Make up your damn minds already. Oscar Mike to new LZ"};
	};

};