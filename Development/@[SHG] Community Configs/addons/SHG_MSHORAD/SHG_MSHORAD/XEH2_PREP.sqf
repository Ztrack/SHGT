["SHG_M6A2_Shorad", "Fired", {
	params ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_gunner"];

	if (_ammo != "shg_ammo_XM1211") exitWith {};
	[_projectile] spawn {
		params ["_projectile"];
		
		waitUntil {(count ((_projectile nearObjects ["Air", 20]) select {((getPos _x) select 2 > 20) && !(_x isKindOf "ParachuteBase")}) > 0) || (!alive _projectile)};
		if (!alive _projectile || (getPos _projectile) select 2 < 25) exitWith {};
		
		_ab = "shg_ammo_XM1211_Prox" createVehicle getPos _projectile;
		deleteVehicle _projectile;
	};
}] call CBA_fnc_addClassEventHandler;
