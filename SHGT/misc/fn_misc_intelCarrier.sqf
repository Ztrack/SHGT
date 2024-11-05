
if (isServer) then {publicVariable "SHGT_intelcarrierUnits"};
//if (hasInterface) exitWith {};
if !(isServer) exitWith {};
//systemChat "script start";
// Start class EH for each
{
	[_x, "init", {
		_unit = (_this select 0);
		
		private _hasItem = [_unit, "acex_intelitems_document"] call BIS_fnc_hasItem;
		if (_hasItem) then { // Proceed if the item is found
			//hint format ["%1 already has the document"];
		} else { // If the item is not found, add it
			_unit addItem "acex_intelitems_document"; // Add item if not present
			//hint format ["Added document"];
		};
		//systemChat "thing added";
	}, false, [], true] call CBA_fnc_addClassEventHandler;
} forEach SHGT_intelcarrierUnits;