if !isServer exitWith {};

//Settings:
SHGT_persist_autoLoad = false; // should the server load a save on start?
SHGT_persist_autoSave = true; // autosave true/false
SHGT_persist_adminTag = 'HQ'; // Tag that allows saving/loading
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
SHGT_callToPrayer = true;
SHGT_deleteAllMapLocations = false;
SHGT_removeAICollisionDamage = false;
SHGT_addVehicleReloadingAction = false;
SHGT_IEDs = true;
SHGT_ied_ActivationSound = 'SHGT_nokia1'; // Any sound file set in the description.ext can work. Set to '' if you dont want it to play a sound. *IF YOU PUT A FILE IN THE MISSION FOLDER RESTART YOUR EDITOR SO IT CAN BE DETECTED*
SHGT_ied_ActivationDelay = [2, 3, 5]; // Delay after a player triggers the ied that it will blow up. random # [min, middle, max], gaussian distribution centered on middle number, so its most likely to play the middle.
SHGT_ied_ActivationDistance = [2, 3, 6]; // Same as activation delay, execept with distance to the ied
SHGT_garageInit = true;
SHGT_odinInit = false;
SHGT_checkMods = true; // Kicks player on mod discrepency. Run this command in-game to generate whitelist "copyToClipboard str ("true" configClasses (configFile >> "CfgPatches") apply {configName _x});"
SHGT_kickPlayerFromVehicleOnDeath = false; // Kicks player on death from a vehicle. If set to false, they need to be dragged out. Currently not applying to aircraft
SHGT_kickPlayerOnVehicleDeath = false; // Kicks players from a vehicle when the VEHICLE dies.
SHGT_removeItemsFromAI = true; // Currently removes binos + radios from all AI
SHGT_removeGPSfromVehicles = ["B_MRAP_01_F"]; // Remove GPS in vehicles from classnames
SHGT_medical_interactionObject = "Land_PortableCabinet_01_medical_F";
publicVariable "SHGT_medical_interactionObject";

// Logi list
SHGT_logistics_list = '[["Land_Cargo10_military_green_F","20","CARGO"],["Land_HBarrier_1_F","1","FOB"],["Land_HBarrier_3_F","3","FOB"],["Land_HBarrier_5_F","5","FOB"],["Land_HBarrierWall_corridor_F","16","FOB"],["Land_HBarrierWall_corner_F","16","FOB"],["Land_HBarrierWall6_F","18","FOB"],["Land_HBarrierWall4_F","12","FOB"],["Land_HBarrierTower_F","50","FOB"],["Land_BagBunker_Small_F","10","FOB"],["Land_BagBunker_Large_F","50","FOB"],["Land_Razorwire_F","1","FOB"],["Land_CzechHedgehog_01_new_F","1","FOB"],["ACE_Wheel","1","FOB"],["ACE_Track","1","FOB"],["B_supplyCrate_F","0","FOB"],["Land_MedicalTent_01_NATO_generic_open_F","50","FOB"],["rhsusf_props_ScepterMFC_D","1","FOB"],["Land_BarGate_F","5","FOB"],["Land_Boxloader_Ramp_2m","2","FOB"],["land_boxloader_rampart_1m","2","FOB"],["Land_Boxloader_Ramp_1m","2","FOB"],["TFAR_Land_Communication_F","50","FOB"],["RHS_Stinger_AA_pod_D","100","FOB"],["RHS_M119_D","100","FOB"],["FIR_Baseplate","10","FOB"],["UK3CB_B_Searchlight_NATO_P","25","FOB"],["Land_Cargo40_military_green_F","0","HQ"],["Land_Boxloader_Fort_Helipad_Tarp_Mini","1","PB"],["Land_Boxloader_Fort_Helipad_Tarp_Mid","1","PB"],["PortableHelipadLight_01_white_F","1","PB"],["Land_CampingTable_F","1","PB"],["Land_CampingChair_V2_F","1","PB"],["Land_PortableLight_double_F","1","PB"],["Land_ConcreteWell_02_F","2","PB"],["Land_Sleeping_bag_F","1","PB"],["Campfire_burning_F","1","PB"],["CamoNet_BLUFOR_big_F","1","PB"],["Land_IntravenStand_01_empty_F","5","PB"],["Land_Boxloader_Crate_1","5","PB"],["Boxloader_VehicleAmmo_West","20","PB"],["Boxloader_BigPallet_Repair","20","PB"],["Boxloader_sixcon_fuel","20","PB"],["Land_Stretcher_01_sand_F","10","PB"],["ACE_envelope_small","-1","PB"],["ACE_envelope_big","-1","PB"],["CamoNet_BLUFOR_Curator_F","5","PB"],["CamoNet_BLUFOR_big_Curator_F","5","PB"],["Box_NATO_Ammo_F","1","PB"],["ACE_medicalSupplyCrate_advanced","1","PB"],["Land_BagFence_End_F","1","PERSONAL"],["Land_BagFence_Short_F","1","PERSONAL"],["Land_BagFence_Corner_F","2","PERSONAL"],["Land_BagFence_Round_F","2","PERSONAL"],["Land_BagFence_Long_F","2","PERSONAL"],["Land_SandbagBarricade_01_hole_F","5","PB"],["Land_SandbagBarricade_01_F","5","PB"],["Land_SandbagBarricade_01_half_F","3","PB"],["CUP_A2_Road_Bridge_wood_25","100","GLOBAL"],["Land_PortableCabinet_01_medical_F","20","FOB"],["UK3CB_B_Static_M240_Elcan_High_USMC_D","20","FOB"],["RHS_M2StaticMG_MiniTripod_USMC_D","20","FOB"],["RHS_TOW_TriPod_USMC_D","50","FOB"],["RHS_MK19_TriPod_USMC_D","20","FOB"]]';

// Define categories for lists
SHGT_logistics_categories = createHashMap;
SHGT_logistics_categories set ['HQ',['HQ','FOB','PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['FOB',['FOB','PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['PB',['PB','WEAPONS','PERSONAL','CARGO']];
SHGT_logistics_categories set ['GLOBAL',['GLOBAL','CREATION']];

// Define garaged vehicles & object
SHGT_garage_vehicleStorage = '[["common","B_MRAP_01_F","20"],["common","B_Boat_Transport_01_F","20"],["common","B_Boat_Armed_01_minigun_F","20"]]';
SHGT_garage_object = ["Land_RepairDepot_01_tan_F"];
SHGT_garage_target = ["Land_HelipadEmpty_F","Land_JumpTarget_F","Land_HelipadCircle_F", "Land_HelipadCivil_F", "Land_HelipadRescue_F", "Land_HelipadSquare_F"];
SHGT_garage_tags = ["common","reaper","misfit","gambler","viking","HQ"];

// Call functions
[] call SHGT_fnc_logistics_postInit;
[] call SHGT_fnc_garage_postInit;
[] call SHGT_fnc_persist_postInit;
[] call SHGT_fnc_misc_postInit;
[] call SHGT_fnc_odin_postInit;
[] call SHGT_fnc_ied_postInit;