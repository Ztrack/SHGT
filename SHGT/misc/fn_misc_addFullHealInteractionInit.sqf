// This init function will add an interaction to objects for players to full heal from. The actual interaction function called is stored in addFullHealInteraction

[SHGT_medical_interactionObject, "init", {
	private _veh = (_this select 0);
	[_veh] call SHGT_fnc_misc_addFullHealInteraction;
}, true, [], true] call CBA_fnc_addClassEventHandler;