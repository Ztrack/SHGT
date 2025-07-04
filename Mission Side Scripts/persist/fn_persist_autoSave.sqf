[] spawn {
	while {(SHGT_persist_autoSave isEqualTo true)} do {
		sleep (SHGT_persist_autoSaveFrequency*60);
		[] call SHGT_fnc_persist_save;
	}; 
};