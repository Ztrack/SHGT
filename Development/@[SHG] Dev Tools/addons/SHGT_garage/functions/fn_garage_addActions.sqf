if !(hasInterface) exitWith {};

{
	[_x, "init", {
		(_this select 0) allowDamage false;
		(_this select 0) addAction ["Retrieve Vehicle", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target] call SHGT_fnc_garage_guiGarageVehicleSelect;
		}, [], 6, false, true, "", "true", 10];

		(_this select 0) addAction ["Store nearest Vehicle", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target] call SHGT_fnc_garage_storeVehicle;
		}, [], 6, false, true, "", "true", 10];

		// Add actions for supplies
		(_this select 0) addAction ["Pull out vehicle supplies", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			[_target] call SHGT_fnc_garage_guiGarageSuppliesSelect;
		}, [], 6, false, true, "", "true", 10];

		(_this select 0) addAction ["Clear area of supplies", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_list = nearestObjects [player, SHGT_garage_supplies, 25];
			{
				deleteVehicle _x;
			} forEach _list;
			systemChat "Area cleared of supplies";
		}, [], 6, false, true, "", "true", 10];

		//(_this select 0) addAction ["Reload internal ammo of nearest vehicle", {
		//	params ["_target", "_caller", "_actionId", "_arguments"];
		//	_nearObj = nearestObjects [player, ["Car", "Tank", "Plane", "Helicopter"], 25];
		//	if (_nearObj isEqualTo []) exitWith {
		//		systemChat "Nothing nearby to reload";
		//	};
		//	_unit = _nearObj select 0;
		//	_unit setVariable ["SHGT_Reloads", 2, true];
		//	systemChat "Nearest Vehicle reloaded";
		//}, [], 6, false, true, "", "true", 10];
	}, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach SHGT_garage_interactObject;