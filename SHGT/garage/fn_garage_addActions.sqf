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

		// Add actions for wheel
		(_this select 0) addAction ["Pull out spare wheel", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_veh = createVehicle ["ACE_Wheel", position player, [], 0, "NONE"];
			_veh setDamage 0;
		}, [], 6, false, true, "", "true", 10];

		// Add actions for track
		(_this select 0) addAction ["Pull out spare track", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_veh = createVehicle ["ACE_Track", position player, [], 0, "NONE"];
			_veh setDamage 0;
		}, [], 6, false, true, "", "true", 10];

		// Add actions for jerry can
		(_this select 0) addAction ["Pull out jerry can", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_veh = createVehicle ["rhsusf_props_ScepterMFC_D", position player, [], 0, "NONE"];
			_veh setDamage 0;
		}, [], 6, false, true, "", "true", 10];

		(_this select 0) addAction ["Clear area", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_list = nearestObjects [player, ["ACE_Wheel", "ACE_Track", "rhsusf_props_ScepterMFC_D"], 25];
			{
				deleteVehicle _x;
			} forEach _list;
			systemChat "Area cleared of wheels, tracks, and cans";
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