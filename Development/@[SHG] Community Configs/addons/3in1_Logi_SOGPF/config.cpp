//Only for SOGPF
class CfgPatches{
    class 3in1_Logi_SOGPF{
		name = "Spearhead Gaming Configs - Three in One Logistics";
        author = "KetchupZombi";
        url = "https://discord.gg/spearheadgaming";
        units[] = {
			"vn_b_wheeled_m54_03",
			"vn_b_armor_m577_01"
		};
        weapons[] = {
		};
        requiredAddons[] = {
			"armor_f_vietnam_03_c",
			"wheeled_f_vietnam_c"
		};
        ammo[] = {
        };
		skipWhenMissingDependencies = 1;
        requiredVersion = 1.0;
    };
};
class CfgVehicles{
	class vn_wheeled_m54_03_base;
	class vn_b_wheeled_m54_03: vn_wheeled_m54_03_base{
		ace_refuel_fuelCargo = 10000;
		ace_rearm_defaultSupply = 1200;
		transportRepair = 5e+06;
	};
	class vn_armor_m577_01_base;
	class vn_b_armor_m577_01: vn_armor_m577_01_base{
		ace_refuel_fuelCargo = 10000;
		ace_rearm_defaultSupply = 1200;
		transportRepair = 5e+06;
	};
};