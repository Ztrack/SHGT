class CfgFunctions {
	class SHGT {
	class main {
		file = "SHGT";
		class main_settings {preInit = 1;};
	};
	class logistics {
		file = "SHGT\logistics";
		class logistics_postInit {postInit = 1};
		class logistics_addActions {};
		class logistics_addKeybinds {};
		class logistics_guiUserSelectObject {};
		class logistics_interactionKey {};
		class logistics_placeObject {};
		class logistics_unbuildAction {};
		class logistics_buildObject {};
		class logistics_assistbuildingAction {};
		class logistics_holdPlayer {};
		class logistics_createBase {};
		class logistics_baseSavePlayer {};
		class logistics_baseLoadPlayer {};
		class logistics_lcla_loadCargoInit {postInit = 1;};
		class logistics_lcla_loadCargo {};
		class logistics_lcla_UnloadCargo {};
		class logistics_boxSaverInteraction {postInit = 1;};
		class logistics_fillContainer {};
	};
	class persist {
		file = "SHGT\persist";
		class persist_postInit {postInit = 1};
		class persist_addActions {};
		class persist_deleteObjectsBeforeLoad {};
		class persist_load {};
		class persist_save {};
		class persist_saveObjects {};
		class persist_saveVehicles {};
		class persist_spawnObjects {};
		class persist_saveBases {};
		class persist_loadBases {};
		class persist_autoSave {};
		class persist_saveCivInteract {};
		class persist_loadCivInteract {};
	};
	class garage {
		file = "SHGT\garage";
		class garage_postInit {postInit = 1};
		class garage_addActions {};
		class garage_guiGarageVehicleSelect {};
		class garage_spawnVehicle {};
		class garage_storeVehicle {};
		class garage_loadoutSaverInit {postInit = 1};
	};
	class odin {
		file = "SHGT\odin";
		class odin_postInit {};
	};
	class ied {
		file = "SHGT\ied";
		class ied_postInit {postInit = 1};
		class ied_vehicleInit {};
		class ied_activate {};
		class ied_CuratorModules {postInit = 1;};
		class ied_CreateVBED {};
		class ied_SBomber {};
	};
	class misc {
		file = "SHGT\misc";
		class misc_postInit {postInit = 1};
		class misc_addActions {};
		class misc_quotesSay3d {};
		class misc_callToPrayer {};
		class misc_removeAICollisionDamage {};
		class misc_vehicleReloadingaddAction {};
		class misc_deleteLocations {};
		class misc_medicalDummy {};
		class misc_soccerInit {};
		class misc_modChecker {};
		class misc_quickDropBackpack {};
		class misc_kickPlayerOnVehicleDeath {};
		class misc_kickdeadPlayerFromVehicleOnDeath {};
		class misc_removeItemsFromAI {};
		class misc_removeGPSfromVehicles {};
		class misc_addFullHealInteractionInit {postInit = 1;};
		class misc_addFullHealInteraction {};
		class misc_cadence {};
		class misc_dogAI {postInit = 1};
		class misc_intelCarrier {postInit = 1};
	};
	class civInteract {
		file = "SHGT\civInteract";
		class civInteract_postInit {postInit = 1;};
		class civInteract_civInit {};
		class civInteract_giveHumrat {};
		class civInteract_intelEnemy {};
		class civInteract_intelIED {};
		class civInteract_CivAddActions {};
		class civInteract_reputationLossKilledEventHandler {};
		class civInteract_changeTownRepOfCivilian {};
		class civInteract_getTownRepofCivilian {};
		class civInteract_changeNearestTownRep {};
		class civInteract_interActGUI {};
		class civInteract_buildingDestroyedRepHandler {};
		class civInteract_getNearestTownArea {};
		class civInteract_IEDInit {};
		class civInteract_Question_1 {};
		class civInteract_Question_2 {};
		class civInteract_Question_3 {};
		class civInteract_curatorModules {postInit = 1};
	};
	class transport {
		file = "SHGT\transport";
		class transportInit {};
		class flightorder {};
		class recall {};
	};
	class incognito {
		file = "SHGT\incognito";
		class incognitoInit {postInit = 1};
	};
};
};