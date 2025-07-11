class CfgPatches{
    class Three_in_one_logi{
		name = "Spearhead Gaming Configs - Three in One Logistics";
        author = "KetchupZombi";
        url = "https://discord.gg/spearheadgaming";
        units[] = {
			"SHG_m1152",
			"SHG_m1152d",
			"SHG_M113",
			"SHG_M113d",
			"SHG_M977A4_Logi_wd",
			"SHG_M977A4_Logi_d",
			"SHG_M939W",
			"SHG_MTVRW",
			"SHG_M939D",
			"SHG_MTVRD",
			"SHG_MTLB_Logi",
			"SHG_ADM_Logi",
			"SHG_Van_Logi"
		};
        weapons[] = {
		};
        requiredAddons[] = {
			"rhsusf_c_m11xx",
			"rhsusf_c_HEMTT_A4",
			"ace_compat_rhs_usf3",
			"rhsusf_c_m113",
			"UK3CB_Factions_Vehicles_M939",
			"UK3CB_Factions_Vehicles_MTVR",
			"UK3CB_Factions_ADA_B",
			"UK3CB_Factions_ADM_B"
		};
        ammo[] = {
        };
		skipWhenMissingDependencies = 1;
        requiredVersion = 1.0;
    };
};
class CfgVehicles{
	class rhsusf_m1152_rsv_usarmy_wd;
	class rhsusf_m1152_rsv_usarmy_d;
	class SHG_m1152: rhsusf_m1152_rsv_usarmy_wd{
		ace_refuel_fuelCargo = 10000;
		ace_cargo_space = 10;
		displayName = "M1152A1 Logistics Woodland";
	};
	class SHG_m1152d: rhsusf_m1152_rsv_usarmy_d{
		ace_refuel_fuelCargo = 10000;
		ace_cargo_space = 10;
		displayName = "M1152A1 Logistics Desert";
	};
	class rhsusf_m113_usarmy_supply;
	class SHG_M113: rhsusf_m113_usarmy_supply{
		ace_refuel_fuelCargo = 10000;
		transportRepair = 5e+06;
		ace_cargo_space = 16;
		displayName = "M113 Logistics Woodland";
	};
	class rhsusf_m113d_usarmy_supply;
	class SHG_M113d: rhsusf_m113d_usarmy_supply{
		ace_refuel_fuelCargo = 10000;
		transportRepair = 5e+06;
		ace_cargo_space = 16;
		displayName = "M113 Logistics Desert";
	};
	class rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd;
	class rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d;
	class SHG_M977A4_Logi_wd: rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_wd{
		ace_refuel_fuelCargo = 10000;
		ace_rearm_defaultSupply = 1200;
		displayName = "M977A4 Logistics Woodland";
	};
	class SHG_M977A4_Logi_d: rhsusf_M977A4_REPAIR_BKIT_M2_usarmy_d{
		ace_refuel_fuelCargo = 10000;
		ace_rearm_defaultSupply = 1200;
		displayName = "M977A4 Logistics Desert";
	};
	class UK3CB_B_M939_Reammo_WDL;
	class SHG_M939W: UK3CB_B_M939_Reammo_WDL{
		ace_refuel_fuelCargo = 10000;
		transportRepair = 5e+06;
		displayName = "M939 Logistics Woodland";
	};
	class UK3CB_B_MTVR_Reammo_WDL;
	class SHG_MTVRW: UK3CB_B_MTVR_Reammo_WDL{
		ace_refuel_fuelCargo = 10000;
		transportRepair = 5e+06;
		displayName = "MTVR Logistics Woodland";
	};
	class UK3CB_B_M939_Reammo_DES;
	class SHG_M939D: UK3CB_B_M939_Reammo_DES{
		ace_refuel_fuelCargo = 10000;
		transportRepair = 5e+06;
		displayName = "M939 Logistics Desert";
	};
	class UK3CB_B_MTVR_Reammo_DES;
	class SHG_MTVRD: UK3CB_B_MTVR_Reammo_DES{
		ace_refuel_fuelCargo = 10000;
		transportRepair = 5e+06;
		displayName = "MTVR Logistics Desert";
	};
	class UK3CB_ADM_B_Van_Fuel;
	class SHG_Van_Logi: UK3CB_ADM_B_Van_Fuel{
		ace_rearm_defaultSupply = 1200;
		transportRepair = 5e+06;
		displayName = "Van Logistics";
		ace_cargo_space = 8;
	};
	class UK3CB_ADM_B_V3S_Repair;
	class SHG_ADM_Logi: UK3CB_ADM_B_V3S_Repair{
		ace_refuel_fuelCargo = 10000;
		ace_rearm_defaultSupply = 1200;
		displayName = "Praga V3S Logistics";
	};
	class UK3CB_ADM_B_MTLB_PKT;
	class SHG_MTLB_Logi: UK3CB_ADM_B_MTLB_PKT{
		ace_refuel_fuelCargo = 10000;
		ace_rearm_defaultSupply = 1200;
		transportRepair = 5e+06;
		displayName = "MT-LB Logistics";
		ace_cargo_space = 10;
		transportSoldier = 2;
		maximumLoad = 5000;
		transportMaxMagazines = 200;
		transportMaxBackpacks = 14;
		transportMaxWeapons = 16;
	};
};
