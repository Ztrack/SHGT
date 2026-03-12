class CfgPatches{
    class 3in1_Logi_RHSUSAF{
		name = "Spearhead Gaming Configs - Three in One Logistics";
        author = "KetchupZombi";
        url = "https://discord.gg/spearheadgaming";
        units[] = {
			"SHG_m1152",
			"SHG_m1152d",
			"SHG_M113",
			"SHG_M113d",
			"SHG_M977A4_Logi_wd",
			"SHG_M977A4_Logi_d"
		};
        weapons[] = {
		};
        requiredAddons[] = {
			"rhsusf_c_m11xx",
			"rhsusf_c_HEMTT_A4",
			"ace_compat_rhs_usf3",
			"rhsusf_c_m113"
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
};
