
["Man", "init", {
	//if ((hasInterface) and !(isServer)) exitWith {}; // Run only on AI
	_unit = (_this select 0);

	//Remove binos
	_item = binocular player;
	_unit removeWeapon _item;

	// Remove Radio
	_unit removeweapon "ItemRadio";

}, true, [], true] call CBA_fnc_addClassEventHandler;


/*
["Man", "init", {
	//if ((hasInterface) and !(isServer)) exitWith {}; // Run only on AI
	_unit = (_this select 0);

	[_unit] spawn {
		sleep 5;
		params ["_unit"];

		//Remove binos
		_item = binocular player;
		_unit removeWeapon _item;

		// Remove Radio
		_unit removeweapon "ItemRadio";
	};
}, true, [], true] call CBA_fnc_addClassEventHandler;

addMissionEventHandler ["EntityCreated", {
	params ["_entity"];
	if !(_entity isKindof "Man") exitWith {};
	systemChat str _entity;
}];