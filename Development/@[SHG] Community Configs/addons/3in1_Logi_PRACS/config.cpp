class CfgPatches{
    class 3in1_Logi_PRACS{
		name = "Spearhead Gaming Configs - Three in One Logistics PRACS";
        author = "KetchupZombi";
        url = "https://discord.gg/spearheadgaming";
        units[] = {
			"SHG_M250_Logi"
		};
        weapons[] = {
		};
        requiredAddons[] = {
			"PRACS_truck"
		};
        ammo[] = {
        };
		skipWhenMissingDependencies = 1;
        requiredVersion = 1.0;
    };
};
class CfgVehicles{
	class PRACS_M250_Repair;
	class SHG_M250_Logi: PRACS_M250_Repair{
		ace_refuel_fuelCargo = 10000;
		ace_rearm_defaultSupply = 1200;
		displayName = "IVECO M250 Logistics";
	};
};
