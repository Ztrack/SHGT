["SHG_M6A1_Shorad", "Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

	if (_ammo != "RHS_ammo_M792_HEI") exitWith {};
	[_projectile] spawn {
		params ["_projectile"];
		
		waitUntil {(count ((_projectile nearObjects ["Air", 20]) select {((getPos _x) select 2 > 20) && !(_x isKindOf "ParachuteBase")}) > 0) || (!alive _projectile)};
		if (!alive _projectile || (getPos _projectile) select 2 < 25) exitWith {};
		
		_ab = "rhs_ammo_M792_Prox" createVehicle getPos _projectile;
		deleteVehicle _projectile;
	};
}] call CBA_fnc_addClassEventHandler;
