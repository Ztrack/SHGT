// This script allows for players to go incognito as civilians so they can recon the map. No intention to add redfor incognito at this time.

// settings
SHGT_incognitoInteractionStatus = false;
SHGT_IncognitoAddActionObjectClass = "B_supplyCrate_F";
SHGT_IncognitoconditionalTag = 'viking';

// Broadcast
publicVariable "SHGT_incognitoInteractionStatus";
publicVariable "SHGT_IncognitoAddActionObjectClass";
publicVariable "SHGT_IncognitoconditionalTag";

// Status
if !(SHGT_incognitoInteractionStatus isEqualTo true) exitWith {};

[SHGT_IncognitoAddActionObjectClass, "init", {

	_obj = (_this select 0);
	_obj addAction ["Go incognito", {
		if (side player == civilian) exitWith {[player] join createGroup west; systemChat "You are now blufor"};

		/*
		// This code doesnt really work because shit isnt configured as expected in config.
		// Check player gear for anything blurfor,redfor, or greenfor
		_assignedItems = assignedItems [player, false, false];
		_checkVal = false;
		{
			_value = getNumber (configFile >> "CfgVehicles" >> _x >> "side");
			if (_value in [0,1,2]) exitWith {_checkVal = true; systemChat format ["You can't go incognito with %1",_x]};
		} forEach _assignedItems;
		if _checkVal exitWith {};
		*/

		// Check to see if player has a weapon, handgun, launcher, vest, nvg. Returns true if player has them.
		_check1 = !(primaryWeapon player == "");
		_check2 = !(handgunWeapon player == "");
		_check3 = !(secondaryWeapon player == "");
		_check4 = !(vest player == "");
		_check5 = !(hmd player == "");

		if (_check1 or _check2 or _check3 or _check4 or _check5) exitWith {systemChat "Remove any weapons,vest, or NVG to go incognito"};
		// Transfer player to civilian group
		[player] join createGroup civilian;
		systemChat "You are now incognito";

		// add event handlers to check when incognito breaks
		player addEventHandler ["SlotItemChanged", {
			params ["_unit", "_name", "_slot", "_assigned", "_weapon"];
			_check1 = !(primaryWeapon player == "");
			_check2 = !(handgunWeapon player == "");
			_check3 = !(secondaryWeapon player == "");
			_check4 = !(vest player == "");
			_check5 = !(hmd player == "");
			if (side player == west) exitWith {player removeEventHandler [_thisEvent, _thisEventHandler];};
			if (_check1 or _check2 or _check3 or _check4 or _check5) exitWith {[player] join createGroup west; systemChat "No longer incognito"; player removeEventHandler [_thisEvent, _thisEventHandler];};
		}];

		player addEventHandler ["WeaponChanged", {
			params ["_object", "_oldWeapon", "_newWeapon", "_oldMode", "_newMode", "_oldMuzzle", "_newMuzzle", "_turretIndex"];
			_check1 = !(primaryWeapon player == "");
			_check2 = !(handgunWeapon player == "");
			_check3 = !(secondaryWeapon player == "");
			_check4 = !(vest player == "");
			_check5 = !(hmd player == "");
			if (side player == west) exitWith {player removeEventHandler [_thisEvent, _thisEventHandler];};
			if (_check1 or _check2 or _check3 or _check4 or _check5) exitWith {[player] join createGroup west; systemChat "No longer incognito"; player removeEventHandler [_thisEvent, _thisEventHandler];};
		}];


	}, [], 1.5, false, true, "", str (player getVariable ["viking",false]), 10];

}, true, [], true] call CBA_fnc_addClassEventHandler;








/*


player getVariable ["viking",false];
