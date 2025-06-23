//Only for RHS Smoke GLs
class CfgPatches{
    class SHGT_GL{
        name = "Spearhead Gaming Configs - Smoke GLs fix";
        author = "KetchupZombi";
        url = "https://discord.gg/spearheadgaming";
		
		units[] = {
		};
        weapons[] = {
		};
        requiredAddons[] = {
			"rhsusf_c_weapons",
			"rhs_c_weapons",
			"ace_compat_rhs_afrf3",
			 "A3_Weapons_F",
			 "ace_frag",
			 "ace_vehicle_damage",
			 "A3_Sounds_F",
			 "ace_grenades",
			 "ace_advanced_throwing",
			 "ace_medical_damage"
		};
		skipWhenMissingDependencies = 1; // Optional. If this is 1, if any of requiredAddons[] entry is missing in your game the entire config will be ignored and return no error (but in rpt) so useful to make a compat Mod
        requiredVersion = 1.0;
    };
};
class CfgAmmo{
	class SmokeShell;
	class SmokeShellBlue;
	class SmokeShellGreen;
	class SmokeShellOrange;
	class SmokeShellPurple;
	class SmokeShellRed;
	class SmokeShellYellow;
	
	class G_40mm_Smoke: SmokeShell {
		simulation = "shotSmoke";
		deflectionSlowDown = 0;
		deflecting = 0;
	};
	
	class rhs_40mm_m715_green: SmokeShellGreen {
		simulation = "shotSmoke";
		deflectionSlowDown = 0;
		deflecting = 0;
	};

	class rhs_40mm_m713_red: SmokeShellRed {
		simulation = "shotSmoke";
		deflectionSlowDown = 0;
		deflecting = 0;
	};

	class rhs_40mm_m714_white: SmokeShell {
		simulation = "shotSmoke";
		deflectionSlowDown = 0;
		deflecting = 0;
	};

	class rhs_40mm_m716_yellow: SmokeShellYellow {
		simulation = "shotSmoke";
		deflectionSlowDown = 0;
		deflecting = 0;
	};
	class rhs_g_vog25;

	class rhs_g_vg40md_green: rhs_g_vog25 {
		simulation = "shotSmoke";
		deflectionSlowDown = 0;
		deflecting = 0;
	};

	class rhs_g_vg40md_red: rhs_g_vog25 {
		simulation = "shotSmoke";
		deflectionSlowDown = 0;
		deflecting = 0;
	};

	class rhs_g_vg40md_white: rhs_g_vog25 {
		simulation = "shotSmoke";
		deflectionSlowDown = 0;
		deflecting = 0;
	};
};