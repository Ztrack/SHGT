//if (isServer or !hasInterface) exitWith {}; // run only on server

// remove AI on AI vehicle damage (if they run eachother over)
["Man", "init", {

	// Initialize
    _unit = (_this select 0);
	//systemChat "man initialized";
	if (isPlayer _unit) exitWith {};
	
	_unit addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
		//systemChat "man hit";
		if (isPlayer _unit) exitWith {};
		if (((side _instigator) isEqualTo (side _unit)) and (vehicle _instigator != _instigator)) then {_damage*0};
	}];

}, true, [], true] call CBA_fnc_addClassEventHandler;

// Remove AI terrain damage to vehicles
["Car", "init", {

	// Initialize
    _unit = (_this select 0);
	//systemChat "man initialized";
	if (isPlayer _unit) exitWith {};
	
	_unit addEventHandler ["HandleDamage", {
		params ["_unit", "_selection", "_damage", "_source", "_projectile", "_hitIndex", "_instigator", "_hitPoint", "_directHit"];
		//systemChat "man hit";
		if (isPlayer _unit) exitWith {};
		if ((isNull _instigator) and (isNull _source)) then {_damage*0};
	}];

}, true, [], true] call CBA_fnc_addClassEventHandler;