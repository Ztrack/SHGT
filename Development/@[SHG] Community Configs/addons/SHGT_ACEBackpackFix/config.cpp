#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_ACEBackPackFix
	{
		name = "Spearhead Gaming Dev Tools ACE backpack Fix";
        author = "Ztrack";
        url = "https://discord.gg/spearheadgaming";

		requiredVersion = 1.0; // Required ARMA version
		requiredAddons[] = {"A3_Modules_F","simc_uaf_67_core"}; // Required mod PBOs
        units[] = {}; // List of objects (CfgVehicles classes) contained in the addon.
        weapons[] = {}; // List of weapons (CfgWeapons classes) contained in the addon.
        
        skipWhenMissingDependencies = 1; // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod
	};
};

class CfgVehicles
{
    class B_AssaultPack_rgr;
    class B_simc_rajio_base: B_AssaultPack_rgr
    {
        class TransportItems
        {
            delete _xx_ItemRadio;
            delete _xx_SmokeShell;
            delete _xx_SmokeShellPurple;
            delete _xx_SmokeShellGreen;
            delete _xx_SmokeShellRed;
        };
    };
    class B_simc_rajio_1: B_simc_rajio_base
    {
        class TransportItems
        {
            delete _xx_ItemRadio;
            delete _xx_SmokeShell;
            delete _xx_SmokeShellPurple;
            delete _xx_SmokeShellGreen;
            delete _xx_SmokeShellRed;
        };
    };
    class B_simc_rajio_3: B_simc_rajio_1
    {
        class TransportItems
        {
            delete _xx_ItemRadio;
            delete _xx_SmokeShell;
            delete _xx_SmokeShellPurple;
            delete _xx_SmokeShellGreen;
            delete _xx_SmokeShellRed;
        };
    };
    class B_simc_rajio_3_alt: B_simc_rajio_3
    {
        class TransportItems
        {
            delete _xx_ItemRadio;
            delete _xx_SmokeShell;
            delete _xx_SmokeShellPurple;
            delete _xx_SmokeShellGreen;
            delete _xx_SmokeShellRed;
        };
    };
    class B_simc_rajio_flak_3: B_simc_rajio_3
    {
        class TransportItems
        {
            delete _xx_ItemRadio;
            delete _xx_SmokeShell;
            delete _xx_SmokeShellPurple;
            delete _xx_SmokeShellGreen;
            delete _xx_SmokeShellRed;
        };
    };
    class B_simc_rajio_flak_3_alt: B_simc_rajio_3
    {
        class TransportItems
        {
            delete _xx_ItemRadio;
            delete _xx_SmokeShell;
            delete _xx_SmokeShellPurple;
            delete _xx_SmokeShellGreen;
            delete _xx_SmokeShellRed;
        };
    };
};