

// Persistence Settings
SHGT_persist_autoLoad = false; // should the server load a save on start?
SHGT_persist_autoSave = false; // autosave true/false
SHGT_persist_adminTag = 'HQ'; // Tag that allows saving/loading
SHGT_persist_autoSaveFrequency = 360; // in minutes
SHGT_persist_dBNamePrefix = 'SHGT_dB';
SHGT_persist_dBNamePostfix = 'testing'; // This should be a custom name. set to '' if you want it to append the briefingName

// FOB construction settings
SHGT_persist_hqObjectName = "Flag_Blue_F";
SHGT_persist_fobObjectName = "Flag_Green_F";
SHGT_persist_pbObjectName = "Land_WoodenLog_F";
SHGT_persist_addSpawnToBases = []; // leave empty for no spawning. Can add PB,FOB ex: ['PB','FOB','HQ'];
SHGT_persist_addPlayerSavingToBases = ["PB","FOB"]; // leave empty for no player bases. Can add PB,FOB ex: ['PB','FOB','HQ'];
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
SHGT_logistics_buildTimeMultiplier = 4; // Bigger number = will take longer. Direct multiplier
SHGT_logistics_list = [["Land_Cargo10_military_green_F","20","CARGO"],["Land_HBarrier_1_F","1","FOB"],["Land_HBarrier_3_F","3","FOB"],["Land_HBarrier_5_F","5","FOB"],["Land_HBarrierWall_corridor_F","16","FOB"],["Land_HBarrierWall_corner_F","16","FOB"],["Land_HBarrierWall6_F","18","FOB"],["Land_HBarrierWall4_F","12","FOB"],["Land_HBarrierTower_F","50","FOB"],["Land_BagBunker_Small_F","10","FOB"],["Land_BagBunker_Large_F","50","FOB"],["Land_Razorwire_F","1","FOB"],["Land_CzechHedgehog_01_new_F","1","FOB"],["ACE_Wheel","1","FOB"],["ACE_Track","1","FOB"],["B_supplyCrate_F","0","FOB"],["Land_MedicalTent_01_NATO_generic_open_F","50","FOB"],["rhsusf_props_ScepterMFC_D","1","FOB"],["Land_BarGate_F","5","FOB"],["Land_Boxloader_Ramp_2m","2","FOB"],["land_boxloader_rampart_1m","2","FOB"],["Land_Boxloader_Ramp_1m","2","FOB"],["TFAR_Land_Communication_F","50","FOB"],["RHS_Stinger_AA_pod_D","100","FOB"],["RHS_M119_D","100","FOB"],["FIR_Baseplate","10","FOB"],["UK3CB_B_Searchlight_NATO_P","25","FOB"],["Land_Cargo40_military_green_F","0","HQ"],["Land_Boxloader_Fort_Helipad_Tarp_Mini","1","PB"],["Land_Boxloader_Fort_Helipad_Tarp_Mid","1","PB"],["PortableHelipadLight_01_white_F","1","PB"],["Land_CampingTable_F","1","PB"],["Land_CampingChair_V2_F","1","PB"],["Land_PortableLight_double_F","1","PB"],["Land_ConcreteWell_02_F","2","PB"],["Land_Sleeping_bag_F","1","PB"],["Campfire_burning_F","1","PB"],["CamoNet_BLUFOR_big_F","1","PB"],["Land_IntravenStand_01_empty_F","5","PB"],["Land_Boxloader_Crate_1","5","PB"],["Boxloader_VehicleAmmo_West","20","PB"],["Boxloader_BigPallet_Repair","20","PB"],["Boxloader_sixcon_fuel","20","PB"],["Land_Stretcher_01_sand_F","10","PB"],["ACE_envelope_small","-1","PB"],["ACE_envelope_big","-1","PB"],["CamoNet_BLUFOR_Curator_F","5","PB"],["CamoNet_BLUFOR_big_Curator_F","5","PB"],["Box_NATO_Ammo_F","1","PB"],["ACE_medicalSupplyCrate_advanced","1","PB"],["Land_BagFence_End_F","1","PERSONAL"],["Land_BagFence_Short_F","1","PERSONAL"],["Land_BagFence_Corner_F","2","PERSONAL"],["Land_BagFence_Round_F","2","PERSONAL"],["Land_BagFence_Long_F","2","PERSONAL"],["Land_SandbagBarricade_01_hole_F","5","PB"],["Land_SandbagBarricade_01_F","5","PB"],["Land_SandbagBarricade_01_half_F","3","PB"],["CUP_A2_Road_Bridge_wood_25","100","GLOBAL"],["Land_PortableCabinet_01_medical_F","20","FOB"],["UK3CB_B_Static_M240_Elcan_High_USMC_D","20","FOB"],["RHS_M2StaticMG_MiniTripod_USMC_D","20","FOB"],["RHS_TOW_TriPod_USMC_D","50","FOB"],["RHS_MK19_TriPod_USMC_D","20","FOB"]];

// Garage module Settings
SHGT_garage_status = false;
SHGT_garage_vehicleStorage = [["Common","B_MRAP_01_F","20"],["Common","B_Truck_01_cargo_F","20"],["viking","B_Quadbike_01_F","20"]];
SHGT_garage_interactObject = ["Land_RepairDepot_01_tan_F"];
SHGT_garage_target = ["Land_HelipadEmpty_F","Land_JumpTarget_F","Land_HelipadCircle_F", "Land_HelipadCivil_F", "Land_HelipadRescue_F", "Land_HelipadSquare_F"];
SHGT_garage_tags = ["Common","Reaper","Misfit","Gambler","Viking","HQ"];

// General IED settings
SHGT_IEDs = true;
SHGT_ied_ActivationSound = 'SHGT_nokia1'; // Any sound file set in the description.ext can work. Set to '' if you dont want it to play a sound. *IF YOU PUT A FILE IN THE MISSION FOLDER RESTART YOUR EDITOR SO IT CAN BE DETECTED*
SHGT_ied_ActivationDelay = [2, 3, 5]; // Delay after a player triggers the ied that it will blow up. random # [min, middle, max], gaussian distribution centered on middle number, so its most likely to play the middle.
SHGT_ied_ActivationDistance = [2, 3, 6]; // Same as activation delay, execept with distance to the ied
SHGT_ied_iedList = ["IEDLandBig_F","IEDUrbanBig_F","IEDLandSmall_F","IEDUrbanSmall_F"]; // These IEDs or anything that inherits from these IEDs will active when players are nearby
SHGT_ied_armingDistance = 10; // distance the player needs to be to start IED explosive checks
SHGT_ied_vbedIed = ["IEDUrbanSmall_F"]; // Can be any type of explosive
SHGT_ied_vbedChance = 100; // Chance an IED will be created in this vehicle
SHGT_ied_radioActivationChance = 50;
SHGT_ied_vbedVehicles = [
	["UK3CB_TKC_C_Ikarus",[[0.968384,-2.12875,-1.49067],0],[[-1.06311,-3.48251,-1.49269],180]],
	["UK3CB_TKC_C_Datsun_Civ_Closed",[[-0.617798,-1.09182,-0.701578],180],[[0.576538,-1.08843,-0.700819],270],[[0.676392,-0.191985,-1.02862],270]],
	["UK3CB_TKC_C_Datsun_Civ_Open",[[0.578247,-1.05424,-0.655608],270],[[-0.587891,-1.25341,-0.65312],90]],
	["UK3CB_TKC_C_Hatchback",[[0.501953,-0.742921,-0.767205],90],[[-0.659912,-0.82348,-0.760647],90],[[-0.0507813,-1.73746,-0.674392],0]],
	["UK3CB_TKC_C_V3S_Closed",[[-0.482666,-2.55923,-1.08136],90],[[0.542603,0.747045,-1.18027],90],[[-0.449829,1.05857,-1.17781],90]],
	["UK3CB_TKC_C_V3S_Refuel",[[-0.470215,0.596431,-1.05496],90],[[0.523926,0.268279,-1.05085],90],[[0.449585,-1.40538,-0.814045],90]],
	["UK3CB_TKC_C_Lada",[[-0.560791,-0.362014,-1.17762],90],[[0.524658,-0.254109,-1.17901],90],[[0.0284424,1.74617,-1.14719],0]],
	["UK3CB_TKC_C_Lada_Taxi",[[-0.560791,-0.362014,-1.17762],90],[[0.524658,-0.254109,-1.17901],90],[[0.0284424,1.74617,-1.14719],0]],
	["UK3CB_TKC_C_LR_Open",[[0.713013,-1.05614,-0.756143],90],[[-0.689087,-1.08648,-0.684375],90],[[0.0506592,-1.62356,-1.20114],180]],
	["UK3CB_TKC_C_S1203",[[-0.766724,-0.329753,-0.989581],0],[[0.777954,-1.29317,-0.985473],180],[[0.66333,-0.033069,-1.0162],90]],
	["UK3CB_TKC_C_S1203_Amb",[[-0.766724,-0.329753,-0.989581],0],[[0.777954,-1.29317,-0.985473],180],[[0.66333,-0.033069,-1.0162],90]],
	["UK3CB_TKC_C_Tractor_Old",[[0.173584,-0.217688,-0.701229],90],[[-0.610962,-0.526321,-0.665928],90],[[-0.155762,-0.0855422,-0.942806],0]],
	["UK3CB_TKC_C_TT650",[[-0.165771,0.219547,-0.990426],0],[[-0.285278,-0.351278,-0.79853],270],[[-0.104858,-0.367388,-0.798436],270]],
	["UK3CB_TKC_C_YAVA",[[-0.221069,0.227068,-1.00852],90],[[-0.00854492,0.0595554,-0.857423],90]],
	["UK3CB_TKC_C_UAZ_Open",[[-0.679321,-0.153978,-0.678959],90],[[0.644897,-0.0890364,-0.678572],90],[[-0.115234,-1.48036,-0.599456],0]],
	["UK3CB_TKC_C_Gaz24",[[-0.521729,-1.67738,-0.190179],0],[[-0.690063,-0.530409,-0.293328],90],[[-0.515747,-1.09803,-0.240185],270]]
];

// Civilian Interaction Module Settings
SHGT_civInteraction_status = true; // If set to false, the module turns off
SHGT_civInteraction_debug = false;
SHGT_civInteract_TOAR = ['TOAR1','TOAR2','TOAR3','TOAR4']; // TOARs drawn on the editor map as markers of any type. Each marker is a town/area
SHGT_civInteract_TOARActive = ['TOAR1','TOAR2','TOAR3','TOAR4']; // Only These towns will spawn ieds
SHGT_civInteract_responseSounds = ['SHGT_pash1','SHGT_pash2','SHGT_pash3','SHGT_pash4','SHGT_pash5','SHGT_pash6'];
SHGT_civInteract_civrepSpread = 30; // Civ rep will be town rep +/- this number
SHGT_civInteract_civrepaddedfromHumrat = 20;
SHGT_civInteract_TownrepAddedfromHumrat = 1;
SHGT_civInteract_TownrepAddedFromDestroyedBuilding = -10;
SHGT_civInteract_TownrepAddedFromcivKilled = -20; // Triggers when civ is killed by a player
SHGT_civInteract_DefineCivHouses = ["Land_House_L_1_EP1","Land_House_C_3_EP1","Land_House_L_3_EP1","Land_House_L_3_dam_EP1","Land_House_L_3_H_EP1","Land_House_L_4_EP1","Land_House_L_4_dam_EP1","Land_House_L_6_EP1","Land_House_L_6_dam_EP1","Land_House_L_7_EP1","Land_House_L_7_dam_EP1","Land_House_L_8_EP1","Land_House_L_8_dam_EP1","Land_House_L_9_EP1","Land_House_K_1_EP1","Land_House_K_5_EP1","Land_House_K_5_dam_EP1","Land_House_K_8_EP1","Land_House_K_8_dam_EP1","Land_House_K_1_EP1","Land_House_K_5_EP1","Land_House_K_5_dam_EP1","Land_House_K_8_EP1","Land_House_K_8_dam_EP1","Land_House_K_6_EP1","Land_House_K_6_dam_EP1","Land_House_K_3_EP1","Land_House_K_3_dam_EP1","Land_House_K_3_EP1","Land_House_K_3_dam_EP1","Land_House_K_7_EP1","Land_House_K_7_dam_EP1","Land_House_K_2_basehide_EP1","Land_A_Minaret_EP1","Land_A_Minaret_dam_EP1","Land_A_Minaret_Porto_EP1","Land_A_Minaret_porto_dam_EP1","Land_A_Mosque_big_addon_EP1","Land_A_Mosque_big_hq_EP1","Land_A_Mosque_big_minaret_1_EP1","Land_A_Mosque_big_minaret_1_dam_EP1","Land_A_Mosque_big_minaret_2_EP1","Land_A_Mosque_big_minaret_2_dam_EP1","Land_A_Mosque_small_1_EP1","Land_A_Mosque_small_1_dam_EP1","Land_A_Mosque_small_2_dam_EP1","Land_A_Mosque_small_2_EP1","Land_House_C_12_EP1", "Land_House_C_12_dam_EP1", "Land_A_Stationhouse_ep1", "Land_Dum_istan4", "Land_Dum_istan4_big", "Land_Dum_istan2_01", "Land_Dum_istan2_02", "Land_Dum_istan2_04a", "Land_Dum_istan2_03", "Land_Dum_istan2_03a", "Land_Dum_istan4_detaily1", "Land_Dum_istan4_inverse", "Land_Dum_istan4_big_inverse", "Land_Dum_istan3_hromada", "Land_House_C_10_EP1", "Land_House_C_10_dam_EP1", "Land_House_C_11_EP1", "Land_House_C_11_dam_EP1", "Land_Dum_istan3_pumpa", "Land_House_C_5_EP1", "Land_House_C_5_dam_EP1", "Land_House_C_5_V1_EP1", "Land_House_C_5_V1_dam_EP1", "Land_House_C_5_V2_EP1", "Land_House_C_5_V2_dam_EP1", "Land_House_C_5_V3_EP1","Land_House_C_5_V3_dam_EP1", "Land_Dum_istan2", "Land_Dum_istan2b", "Land_Dum_mesto3_istan", "Land_Dum_istan3", "Land_Dum_istan3_hromada2", "Land_A_Villa_EP1", "Land_A_Villa_dam_EP1", "Land_House_C_4_EP1", "Land_House_C_4_dam_EP1", "Land_A_Office01_EP1","Land_House_C_9_EP1", "Land_House_C_9_dam_EP1", "Land_House_C_3_EP1", "Land_House_C_3_dam_EP1", "Land_House_C_2_EP1", "Land_House_C_2_DAM_EP1", "Land_House_C_1_EP1", "Land_House_C_1_dam_EP1", "Land_House_C_1_v2_EP1", "Land_House_C_1_v2_dam_EP1", "Land_Ind_PowerStation_EP1"];
SHGT_civInteract_maxHumratRepGainPerDay = 100;

// Civilian Reputation IED Spawner Settings
SHGT_civInteraction_iedSpawning = true; // If set to false, the module turns off
SHGT_civInteract_maxIEDsDensity = 1; // Max density of IEDs per 100x100 meter area
SHGT_civInteract_maxIEDsPerArea = 10; // Max ieds per large AO/town area
SHGT_civInteract_SafeplayerProximity = 1000; // Check players are far enough before spawning a new IED
SHGT_civInteract_IEDsUpdate = .1; // Time in minutes before a 'tick' is made to spawn more IEDs
SHGT_civInteract_IEDSpawnRate = 2; // How many IEDs spawn per town area per tick.
SHGT_civInteract_IEDSpawnRoadChance = 50; // Chance an IED will spawn on a road vs near a building
SHGT_civInteract_IEDminimumSpacing = 25; // minimum spacing between IED spawns
SHGT_civInteract_highRepThreshold = 80; // At this reputation no more IEDS will spawn. Linear relationship between 0 and this number to determine max density and #
SHGT_civInteraction_PauseIEDSpawningNearPlayers = true;
SHGT_civInteract_iedDefusalTownRepAdd = 2;
SHGT_civInteraction_RoadIEDList = ['IEDLandBig_F','IEDUrbanBig_F','IEDLandSmall_F','IEDUrbanSmall_F'];
SHGT_civInteraction_BuildingIEDList = ['IEDLandBig_F','IEDUrbanBig_F','IEDLandSmall_F','IEDUrbanSmall_F'];

// Box saver options
SHGT_logistics_boxSaverStatus = false;
SHGT_logistics_boxSaverInterActionObjectClass = 'B_supplyCrate_F';
SHGT_logistics_boxSaverAdminTags = ['HQ','leadership'];
SHGT_logisticsBoxEmpty = ['ACE_medicalSupplyCrate','ACE_Box_82mm_Mo_HE','ACE_Box_Ammo'];

// Heli transport settings
SHGT_transport_cargoSize = 4; // ACE cargo of helicopters set to transport

// Miscellanious settings
SHGT_callToPrayer = false;
SHGT_deleteAllMapLocations = false;
SHGT_removeAICollisionDamage = false;
SHGT_addVehicleReloadingAction = false; // adds internal magazine reloading to vehicles. Can be resupplied at garages
SHGT_odinInit = false;
SHGT_checkMods = true; // Kicks player on mod discrepency. Run this command in-game to generate whitelist "copyToClipboard str ("true" configClasses (configFile >> "CfgPatches") apply {configName _x});"
SHGT_kickPlayerFromVehicleOnDeath = false; // Kicks player on death from a vehicle. If set to false, they need to be dragged out. Currently not applying to aircraft
SHGT_kickPlayerOnVehicleDeath = false; // Kicks players from a vehicle when the VEHICLE dies.
SHGT_removeItemsFromAI = true; // Currently removes binos + radios from all AI
SHGT_removeGPSfromVehicles = ["B_MRAP_01_F"]; // Remove GPS in vehicles from classnames
SHGT_medical_interactionObject = "Land_PortableCabinet_01_medical_F";
SHGT_intelcarrierUnits = ['O_Soldier_AAR_F']; // all of these units will drop documents

/*

// Call functions
[] call SHGT_fnc_logistics_postInit;
[] call SHGT_fnc_garage_postInit;
[] call SHGT_fnc_persist_postInit;
[] call SHGT_fnc_misc_postInit;
[] call SHGT_fnc_odin_postInit;
[] call SHGT_fnc_ied_postInit;