class SHGT {
	class main {
		file = "SHGT";
		class main_postInit {postInit = 1;};
	};
	class logistics {
		file = "SHGT\logistics";
		class logistics_postInit {};
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
	};
	class persist {
		file = "SHGT\persist";
		class persist_postInit {};
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
	};
	class garage {
		file = "SHGT\garage";
		class garage_postInit {};
		class garage_addActions {};
		class garage_guiGarageVehicleSelect {};
		class garage_spawnVehicle {};
		class garage_storeVehicle {};
		class garage_loadoutSaverInit {};
	};
	class odin {
		file = "SHGT\odin";
		class odin_postInit {};
	};
	class ied {
		file = "SHGT\ied";
		class ied_postInit {};
		class ied_vehicleInit {};
		class ied_activate {};
	};
	class misc {
		file = "SHGT\misc";
		class misc_postInit {};
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
	};
};