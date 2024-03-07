if !isServer exitWith {};

//Settings:
SHGT_persist_autoLoad = true; // should the server load a save on start?
SHGT_persist_autoSave = true; // autosave true/false
SHGT_persist_adminTag = 'Spearhead'; // Tag that allows saving/loading
SHGT_persist_autoSaveFrequency = 360; // in minutes
SHGT_persist_dBNamePrefix = 'SHGT_dB';
SHGT_persist_dBNamePostfix = 'testing'; // set to '' if you want it to append the briefingName
SHGT_persist_hqObjectName = "Flag_Blue_F";
SHGT_persist_fobObjectName = "Flag_Green_F";
SHGT_persist_pbObjectName = "Land_WoodenLog_F";
SHGT_persist_fobCost = 5;
SHGT_persist_pbCost = 5;
SHGT_persist_radiusToSaveHq = 1000;
SHGT_persist_radiusToSaveFob = 300;
SHGT_persist_radiusToSavePb = 50;
SHGT_persist_radiusToNextBase = 50; // Radius to check for how close bases/PB/FOB can be
SHGT_persist_vehicleSideToSave = [1]; // [1] for BLUFOR, [0] for REDFOR, [2] for GREENFOR, [3] for civ. [1,3] for WEST + CIV, [0,1,2,3] for ALL 
SHGT_persist_saveObject = "Land_Laptop_03_black_F";
SHGT_logistics_supplySource = "Land_Cargo40_military_green_F";
SHGT_logistics_supplyMax = 500;
SHGT_logistics_supplySearchRadius = 300;
SHGT_logistics_buildTimeMultiplier = 8; // Bigger number = will take longer. Direct multiplier
SHGT_callToPrayer = false;
SHGT_deleteAllMapLocations = false;
SHGT_removeAICollisionDamage = false;
SHGT_addVehicleReloadingAction = false;
SHGT_IEDs = true;
SHGT_garageInit = true;
SHGT_odinInit = false;
SHGT_checkMods = true; // Kicks player on mod discrepency. Run this command in-game to generate whitelist "copyToClipboard str ("true" configClasses (configFile >> "CfgPatches") apply {configName _x});"
SHGT_kickPlayerFromVehicleOnDeath = false; // Kicks player on death from a vehicle. If set to false, they need to be dragged out. Currently not applying to aircraft
SHGT_kickPlayerOnVehicleDeath = true; // Kicks players from a vehicle when the VEHICLE dies.
SHGT_removeItemsFromAI = true; // Currently removes binos + radios from all AI
SHGT_removeGPSfromVehicles = ["B_MRAP_01_F"]; // Remove GPS in vehicles from classnames

// Logi list
SHGT_logistics_list = '[["Land_Cargo10_military_green_F","20","CARGO"],["Land_HBarrier_1_F","1","FOB"],["Land_HBarrier_3_F","3","FOB"],["Land_HBarrier_5_F","5","FOB"],["Land_HBarrierWall_corridor_F","16","FOB"],["Land_HBarrierWall_corner_F","16","FOB"],["Land_HBarrierWall6_F","18","FOB"],["Land_HBarrierWall4_F","12","FOB"],["Land_HBarrierTower_F","50","FOB"],["Land_BagBunker_Small_F","10","FOB"],["Land_BagBunker_Large_F","50","FOB"],["Land_Razorwire_F","1","FOB"],["Land_CzechHedgehog_01_new_F","1","FOB"],["ACE_Wheel","1","FOB"],["ACE_Track","1","FOB"],["B_supplyCrate_F","0","FOB"],["Land_MedicalTent_01_NATO_generic_open_F","50","FOB"],["rhsusf_props_ScepterMFC_D","1","FOB"],["Land_BarGate_F","5","FOB"],["Land_Boxloader_Ramp_2m","2","FOB"],["land_boxloader_rampart_1m","2","FOB"],["Land_Boxloader_Ramp_1m","2","FOB"],["TFAR_Land_Communication_F","50","FOB"],["RHS_Stinger_AA_pod_D","100","FOB"],["RHS_M119_D","100","FOB"],["FIR_Baseplate","10","FOB"],["UK3CB_B_Searchlight_NATO_P","25","FOB"],["Land_Cargo40_military_green_F","0","HQ"],["Land_TentHangar_V1_F","0","HQ"],["Land_Boxloader_Fort_Helipad_Tarp_Mini","1","PB"],["Land_Boxloader_Fort_Helipad_Tarp_Mid","1","PB"],["PortableHelipadLight_01_white_F","1","PB"],["Land_CampingTable_F","1","PB"],["Land_CampingChair_V2_F","1","PB"],["Land_PortableLight_double_F","1","PB"],["Land_ConcreteWell_02_F","2","PB"],["Land_Sleeping_bag_F","1","PB"],["Campfire_burning_F","1","PB"],["CamoNet_BLUFOR_big_F","1","PB"],["Land_IntravenStand_01_empty_F","5","PB"],["Land_Boxloader_Crate_1","5","PB"],["Boxloader_VehicleAmmo_West","20","PB"],["Boxloader_BigPallet_Repair","20","PB"],["Boxloader_sixcon_fuel","20","PB"],["Land_Stretcher_01_sand_F","10","PB"],["ACE_envelope_small","-1","PB"],["ACE_envelope_big","-1","PB"],["CamoNet_BLUFOR_Curator_F","5","PB"],["CamoNet_BLUFOR_big_Curator_F","5","PB"],["Box_NATO_Ammo_F","1","PB"],["ACE_medicalSupplyCrate_advanced","1","PB"],["Land_BagFence_End_F","1","PERSONAL"],["Land_BagFence_Short_F","1","PERSONAL"],["Land_BagFence_Corner_F","2","PERSONAL"],["Land_BagFence_Round_F","2","PERSONAL"],["Land_BagFence_Long_F","2","PERSONAL"],["Land_SandbagBarricade_01_hole_F","5","PB"],["Land_SandbagBarricade_01_F","5","PB"],["Land_SandbagBarricade_01_half_F","3","PB"]]';

// Define categories for lists
SHGT_logistics_categories = createHashMap;
SHGT_logistics_categories set ['HQ',['HQ','FOB','PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['FOB',['FOB','PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['PB',['PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['GLOBAL',['GLOBAL','CREATION']];

// Define garaged vehicles & object
SHGT_garage_vehicleStorage = '[["Common","UK3CB_LDF_B_T72BB","12"],["Common","UK3CB_CW_US_B_EARLY_M1A1","4"],["Common","UK3CB_LDF_B_Marshall_Cage_Camo","4"],["Common","rhsusf_M1117_O","12"],["Common","UK3CB_LDF_B_T810_Refuel","8"],["Common","UK3CB_LDF_B_T810_Recovery","8"],["Common","UK3CB_LDF_B_T810_Repair","8"],["Common","UK3CB_LDF_B_T810_Reammo","8"],["Common","UK3CB_LDF_B_T810_Closed_PKM","5"],["Common","rhsusf_M1117_O","5"],["Common","UK3CB_LDF_B_M1025_TOW","5"],["Common","rhsusf_m1025_w_m2","8"],["Common","B_T_Truck_01_flatbed_F","8"],["Common","rhsusf_m1152_usarmy_wd","8"],["Common","UK3CB_CHD_B_2S1","NaN"],["Reaper","rhsusf_m1151_m2_v1_usarmy_wd","10"],["Reaper","UK3CB_ANA_B_M1151_GPK_PKM","10"],["misfit","rhsusf_m1165a1_gmv_m2_m240_socom_d","10"],["misfit","rhsusf_mrzr4_d","10"],["gambler","RHS_AH64D_wd","4"],["gambler","rhsgref_b_mi24g_CAS","12"],["gambler","UK3CB_UN_B_Mi8AMTSh","12"],["gambler","RHS_UH60M_d","4"],["gambler","FIR_F16C_Polish","4"],["gambler","FIR_F16D_Polish_CFT","4"],["gambler","UK3CB_LDF_B_MIG29SM","12"],["gambler","HWK_mi6pol","5"],["gambler","UK3CB_LDF_B_C130J_CARGO","2"],["gambler","UK3CB_LDF_B_C130J","2"],["gambler","B_UAV_02_dynamicLoadout_F","4"],["viking","rhsusf_m1165a1_gmv_m134d_m240_socom_d","10"],["viking","rhsusf_m1240a1_m2crows_usarmy_wd","10"],["viking","UK3CB_ADC_C_SUV_Armoured","5"],["viking","UK3CB_ION_B_Desert_Quadbike","10"],["viking","UK3CB_ION_B_Desert_SUV_Armed","5"],["Common","UK3CB_LDF_B_M1025_TOW","5"]]';
SHGT_garage_object = ["Land_RepairDepot_01_tan_F"];
SHGT_garage_target = ["Land_JumpTarget_F"];
SHGT_garage_tags = ["common","reaper","misfit","gambler","viking","HQ"];

// Call functions
[] call SHGT_fnc_logistics_postInit;
[] call SHGT_fnc_garage_postInit;
[] call SHGT_fnc_persist_postInit;
[] call SHGT_fnc_misc_postInit;
[] call SHGT_fnc_odin_postInit;
[] call SHGT_fnc_ied_postInit;