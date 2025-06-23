#include "BIS_AddonInfo.hpp"
class CfgPatches
{
	class SHGT_mainMenu
	{
		requiredAddons[] = {"A3_Data_F_Decade_Loadorder", "a3_map_altis_scenes","a3_map_vr_scenes","a3_map_stratis_scenes"};
		requiredVersion = 0.1;
		units[] = {};
        author = "ztrack";
	};
};

class RscChatListDefault;    // External class reference
class RscText;    // External class reference
class RscEdit;    // External class reference
class RscDisplayChannel;    // External class reference
class RscPicture;    // External class reference
class RscControlsGroup;    // External class reference
class RscStandardDisplay;    // External class reference
class RscPictureKeepAspect;    // External class reference
class RscDisplayMain: RscStandardDisplay {
	enableDisplay = 0;
	class controls {
		delete Spotlight1;
		delete Spotlight2;
		delete Spotlight3;
		delete BackgroundSpotlightRight;
		delete BackgroundSpotlightLeft;
		delete BackgroundSpotlight;
		class spotlightCustom {
			access = 0;
			colorBackground[] = {0,0,0,0};
			colorShadow[] = {0,0,0,0.5};
			colorText[] = {1,1,1,1};
			deletable = 0;
			fade = 0;
			fixedWidth = 0;
			font = "RobotoCondensed";
			h = "10 * 	(pixelH * pixelGridNoUIScale * 2)";
			idc = 1020;
			linespacing = 1;
			shadow = 1;
			show = 0;
			SizeEx = "(			(			(			((safezoneW / safezoneH) min 1.2) / 1.2) / 25) * 1)";
			style = 0;
			tooltipColorBox[] = {1,1,1,1};
			tooltipColorShade[] = {0,0,0,0.65};
			tooltipColorText[] = {1,1,1,1};
			type = 0;
			w = "10 * 	(pixelW * pixelGridNoUIScale * 2)";
			x = "0.5 - (0.5 * 	10) * 	(pixelW * pixelGridNoUIScale * 2)";
			y = "0.5 - (	10 / 2) * 	(pixelH * pixelGridNoUIScale * 2)";
			action = "_list = profileNamespace getVariable ['CBA_UI_ServerPasswords', ['69.67.175.31:2302', '']]; _sel = ((_list select 0) find '69.67.175.31:2302'); _pass =''; if !(_sel == -1) then {_pass = (_list select 1) select _sel;}; connectToServer ['69.67.175.31', 2302, '']";
			actionText = "Join the Spearhead Milsim Server";
			condition = "true";
			picture = "SHGT_unitConfigs\patches\SHGT_HQEmblem.paa";
			text = "Spearhead Gaming Milsim";
		};
	};
};

class CfgMainMenuSpotlight
{
    delete Bootcamp;
    delete EastWind;
    delete ApexProtocol;
    delete Orange_Campaign;
    delete Orange_CampaignGerman;
    delete Orange_Showcase_IDAP;
    delete Orange_Showcase_LoW;
    delete AoW_Showcase_AoW;
	delete AoW_Showcase_Future;
    delete OldMan;
    delete SP_FD14;
    class SpearheaadJoinServerMain
	{
		text = "Spearhead Gaming Milsim";
		picture = "SHGT_unitConfigs\patches\SHGT_HQEmblem.paa";
		action = "_list = profileNamespace getVariable ['CBA_UI_ServerPasswords', ['69.67.175.31:2302', '']]; _sel = ((_list select 0) find '69.67.175.31:2302'); _pass =''; if !(_sel == -1) then {_pass = (_list select 1) select _sel;}; connectToServer ['69.67.175.31', 2302, '']";
		actionText = "Join the Spearhead Milsim Server";
		condition = "true";
	};
};

class CfgMissions
{
	class Cutscenes
	{
		class spearheadIntroMission
		{
			directory = "SHGT_mainMenu\missions\spearheadIntroMission.VR"; // Path to scenario with the scene
		};
	};
};

class CfgWorlds
{
	class CAWorld;
	class Altis : CAWorld {
        cutscenes[] = {"spearheadIntroMission"};
    };
    
    class Stratis : CAWorld {
        cutscenes[] = {"spearheadIntroMission"};
    };
	class VR : CAWorld
	{
		cutscenes[] = {"spearheadIntroMission"};
	};
	initWorld = "VR";
	demoWorld = "VR";
};