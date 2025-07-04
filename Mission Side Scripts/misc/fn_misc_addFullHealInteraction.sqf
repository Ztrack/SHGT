// This function sets an object to be able to full heal nearby players
// EXAMPLE: [_this] call SHGT_fnc_misc_addFullHealInteraction;

params ["_object"];

_object addAction ["Heal me up daddy", {

	// Import
	params ["_target", "_caller", "_actionId", "_arguments"];
	private _object = _arguments select 0;

	// Step 1: See if conditions are met (No nearby enemies)
	_enemySides = [side player] call BIS_fnc_enemySides;
	_radius = 50;
	_nearEnemies = allUnits select {(_x distance player < _radius) AND (side _x in _enemySides)};

	_nearestEnemy = 
	if (!(_nearEnemies isEqualTo []) or (isNil "_nearEnemies")) exitWith {systemChat "There are enemies nearby"};

	// Step 2: Get nearby players from _object 
	_radius = 25;
	_nearPlayers = allPlayers select {(_x distance _object < _radius) AND !(side _x in _enemySides)};

	// Step 3: RemoteExec full heal on those players
	
	// Method 1: Running code from the source player
	//{
	//	_x call ace_medical_treatment_fnc_fullHealLocal
	//} forEach _nearPlayers;

	// Method 2: Running remoteExec on nearby players
	_remoteHealFun = 
	{
		player call ace_medical_treatment_fnc_fullHealLocal;
		systemChat "You've been patched up";
	};
	[[],_remoteHealFun] remoteExec ["spawn",_nearPlayers,false];

},[_object],6,false,true,"","true",10];