
_types = ["Car"];
{
[_x, "init", {

	// Initialize
    _unit = (_this select 0);
	if !((getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "side")) in SHGT_persist_vehicleSideToSave) exitWith {};
	
	_unit addAction ["Reload from stored ammo", {
			params ["_target", "_caller", "_actionId", "_arguments"];
			_reloadsLeft =  _target getVariable ["SHGT_Reloads",2];
		if (_reloadsLeft > 0) then {
			_target setVehicleAmmo 1;
			_target setVariable ["SHGT_Reloads",_reloadsLeft-1,true];
			systemChat "Vehicle Reloaded";
		} else {systemChat "Out of reloads";};
	},[],0,false,true,"","true",2];

}, true, [], true] call CBA_fnc_addClassEventHandler;
} forEach _types;